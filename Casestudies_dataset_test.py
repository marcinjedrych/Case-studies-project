# -*- coding: utf-8 -*-
"""
Created on Thu Apr 13 15:42:52 2023

@author: Marcin
"""

# import openneuro as on
# on.download(dataset='ds000171', target_dir='data2/bids')

import nibabel as nib
from nilearn import plotting
import matplotlib.pyplot as plt
import numpy as np
import nibabel as nib

# Different control participants in music condition (is enkel anatomisch)
for pp in range(1,20):
    if pp < 10:
        nr = '0' + str(pp)
    else:
        nr = str(pp)
    print('participant' + nr)
    control_subj1 = nib.load('C:/Users/Marcin/Desktop/data2/bids/sub-control' + nr +'/func/sub-control' + nr +'_task-music_run-'+ '1' + '_bold.nii.gz')
    # Show the plot
    plt.show()

# MDD participant 1 music - functies voor functionele data
mdd_subj1 = nib.load('C:/Users/Marcin/Desktop/data2/bids/sub-mdd01/func/sub-mdd01_task-music_run-1_bold.nii.gz')
mdd_subj1_data = mdd_subj1.get_fdata()
plotting.plot_roi(mdd_subj1.slicer[..., 10])
plotting.plot_glass_brain(mdd_subj1.slicer[..., 10])
plotting.plot_stat_map(mdd_subj1.slicer[..., 10])
plotting.plot_epi(mdd_subj1.slicer[..., 10])
#plotting.plot_connectome(mdd_subj1.slicer[..., 1]) #coords

plt.show()

#WERKT NIET
# Load data for all participants
mdd_data = []
for i in range(1, 20):
    filename = 'C:/Users/Marcin/Desktop/data2/bids/sub-mdd{:02d}/func/sub-mdd{:02d}_task-music_run-1_bold.nii.gz'.format(i, i)
    mdd_subj = nib.load(filename)
    mdd_subj_data = mdd_subj.get_fdata()
    mdd_data.append(mdd_subj_data)

# Compute mean brain activity across participants
mean_data = np.mean(mdd_data, axis=0)

threshold = 0.5
# Plot mean brain activity
plotting.plot_roi(nib.Nifti1Image(mean_data, mdd_subj.affine), cut_coords=(x, y, z))
plotting.plot_glass_brain(nib.Nifti1Image(mean_data, mdd_subj.affine), threshold=threshold)
plotting.plot_stat_map(nib.Nifti1Image(mean_data, mdd_subj.affine), threshold=threshold)
plotting.plot_epi(nib.Nifti1Image(mean_data, mdd_subj.affine), cut_coords=(x, y, z))





