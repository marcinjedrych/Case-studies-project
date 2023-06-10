# -*- coding: utf-8 -*-
"""
Created on Sat June 3 19:32:35 2023

@author: Marcin
"""

import matplotlib as plt
from nilearn import plotting
from nilearn.glm.second_level import SecondLevelModel, make_second_level_design_matrix

def first_analysis(participant):
    
    import nilearn
    import nibabel as nib
    from nilearn import datasets, surface
    from nilearn.glm.first_level import make_first_level_design_matrix, run_glm
    
    # Files
    fmri_files, event_files = [], []
    for run in range(1, 7):
        fmri_files.append(f"C:/Users/Marcin/ds004044-download/derivatives/fmriprep/sub-0{participant}/sub-0{participant}_ses-1_task-motor_run-{str(run)}_space-T1w_desc-preproc_bold_denoised.nii.gz")
        event_files.append(f"C:/Users/Marcin/ds004044-download/sub-0{participant}/ses-1/func/sub-0{participant}_ses-1_task-motor_run-0{run}_events.tsv")
    
    # Concatenate fmri files
    from nilearn.image import concat_imgs
    fmri_data = concat_imgs(fmri_files)
    
    import pandas as pd
    # Concatenate the event files
    events = pd.concat([pd.read_csv(file, delimiter='\t') for file in event_files], ignore_index=True)
    
    # Define the TR (Repetition Time) of your fMRI data
    TR = 2.0  # Replace with the actual TR value of your data
    
    # Calculate the number of volume scans per event
    #scans_per_event = 8
    
    # Calculate the total number of scans
    total_scans = fmri_data.shape[-1]
    
    import numpy as np
    # Create the frame_times array
    frame_times = np.arange(0, total_scans) * TR
    
    # Concatenate the event files with an offset for each run
    events = pd.DataFrame()
    offset = 0
    for run, event_file in enumerate(event_files):
        # Load the event file for the current run
        events_run = pd.read_csv(event_file, delimiter='\t')
        
        # Add an offset to the onset times for the current run
        events_run["onset"] += offset
        
        # Append the events for the current run to the dataframe
        events = events.append(events_run)
        
        # Update the offset for the next run
        offset += events_run["duration"].sum() + TR
    
    # Create the design matrix
    design_matrix = make_first_level_design_matrix(frame_times=frame_times, events=events)
    
    # Print the shape of the design matrix
    print("Design matrix shape:", design_matrix.shape)
    

    #________________________________________________________

    #first level analysis
    from nilearn.glm.first_level import FirstLevelModel
    first_level_model = FirstLevelModel(t_r = 2)
    first_level_model = first_level_model.fit(fmri_data, events=events, design_matrices=design_matrix)

    fsaverage = nilearn.datasets.fetch_surf_fsaverage()

    contrasts = { 'Ankle': np.array([1] + [0] * 5 + [-1] + [0] * 62), # Contrast vector for Ankle vs Rest
                 'Eye': np.array([0] + [1] + [0] * 4 + [-1] + [0] * 62), # Contrast vector for Eye vs Rest 
                 'Finger': np.array([0] * 2 + [1] + [0] * 3 + [-1] + [0] * 62), # Contrast vector for Finger vs Rest
                 'Forearm': np.array([0] * 3 + [1] + [0] * 2 + [-1] + [0] * 62), # Contrast vector for Forearm vs Rest 
                 'Jaw': np.array([0] * 4 + [1] + [0] * 1 + [-1] + [0] * 62), # Contrast vector for Jaw vs Rest
                 'Left leg': np.array([0] * 5 + [1] + [-1] + [0] * 62), # Contrast vector for Left leg vs Rest
                 'Rest': np.array([-1/12] * 6 + [1] + [-1/12] * 6 + [0] * 56),
                 'Right leg': np.array([0] * 6 + [-1] + [1] + [0] * 61), # Contrast vector for Right leg vs Rest 
                 'Toe': np.array([0] * 6 + [-1] + [0] + [1] + [0] * 60), # Contrast vector for Toe vs Rest
                 'Tongue': np.array([0] * 6 + [-1] + [0] * 2 + [1] + [0]*59), # Contrast vector for Tongue vs Rest 
                 'Upper arm': np.array([0]*6+[-1]+[0]*3+[1]+[0]*58), # Contrast vector for Upper arm vs Rest
                 'Wrist': np.array([0]*6+[-1]+[0]*4+[1]+[0]*57) # Contrast vector for Wrist vs Rest 
                 }
                 
    from nilearn.glm.contrasts import compute_contrast

    import nilearn.masking as masking
    brain_mask = masking.compute_brain_mask(fmri_data)
    
    masked_data = masking.apply_mask(fmri_data, brain_mask)
    
    # Run the glm on the masked data and the design matrix
    labels, estimates = run_glm(masked_data, design_matrix.values)
    
    for index, (contrast_id, contrast_val) in enumerate(contrasts.items()):
        print('  Contrast % i out of %i: %s, left hemisphere' %
              (index + 1, len(contrasts), contrast_id))
        # compute contrast-related statistics
        z_map = compute_contrast(labels, estimates, contrast_val, contrast_type='t')
        print('z_map', z_map)
        
        # Extract the z-scores from the z_map
        z_scores = z_map.z_score()
        print('z_scores',z_scores)
        
        z_score = z_map.z_score() # this is a numpy array
        affine = fmri_data.affine # this is the affine matrix from your original fMRI data
        # Reshape the data array to a 3D shape
        # You need to specify the desired shape, e.g., (256, 256, 1)
        z_score_3d =  masking.unmask(z_score, brain_mask)

        # Create a new 3D Nifti1Image object with the same affine matrix
        nii_list.append(z_score_3d)

        
        # x = plotting.plot_surf_stat_map(
        #    fsaverage.infl_left, z_score, hemi='left',
        #     title=contrast_id, colorbar=True,
        #     threshold=4, bg_map=fsaverage.sulc_left)
    
    return nii_list, fmri_data


nii_list = []
for participant in range(1,3):
    cmaps, fmri_data = first_analysis(participant)
    nii_list.append(cmaps)


from nilearn.masking import compute_epi_mask
import nilearn
mask_img = compute_epi_mask(fmri_data)

ankle_z_maps = [img for i, img in enumerate(nii_list) if i % 12 == 11] # select the 12th element (index 11) from each sublist

for pp in range(2):
    plotting.plot_stat_map(ankle_z_maps[pp], threshold=1.5, cmap='coolwarm')



second_level_model = SecondLevelModel(mask_img=mask_img)

subjects_label = ["sub-01", "sub-02"]
design_matrix = make_second_level_design_matrix(subjects_label)

# Choose one of the images as the reference
reference_img = ankle_z_maps[0]
# Resample the other images to match the reference
resampled_ankle_z_maps = [nilearn.image.resample_to_img(img, reference_img) for img in ankle_z_maps]
# Use the resampled images in the second-level model
second_level_model = second_level_model.fit(resampled_ankle_z_maps, design_matrix=design_matrix)

# Import the plotting module
from nilearn import plotting

# Get the second-level contrast map
second_level_contrast = second_level_model.compute_contrast(second_level_contrast='intercept')

plotting.plot_stat_map(second_level_contrast, threshold=1.5, cmap='coolwarm')
