# -*- coding: utf-8 -*-
"""
Created on Thu Apr 13 15:42:52 2023

@author: Marcin
"""

# import openneuro as on
# on.download(dataset='ds004302', target_dir='data/bids')

import nibabel as nib
import matplotlib.pyplot as plt

#1. ANATOMICAL
anat_subj1 = nib.load('C:/Users/Marcin/Desktop/data/bids/sub-01/anat/sub-01_T1w.nii.gz')

# Get the data array of the image
anat_subj1_data = anat_subj1.get_fdata()

# Plot
num_slices = anat_subj1_data.shape[2]
for i in range(num_slices):
    plt.imshow(anat_subj1_data[:,:,i], cmap='gray')
    plt.show()

#2. FUNCTIONAL
func_subj1 = nib.load('C:/Users/Marcin/Desktop/data/bids/sub-01/func/sub-01_task-speech_bold.nii.gz')

# Get the data array of the image
func_subj1_data = func_subj1.get_fdata()

# Plot
num_slices = func_subj1_data.shape[2]
for i in range(1,num_slices, 2):
    plt.imshow(func_subj1_data[:,:, i,1], cmap='gray')
    plt.show()

print(num_slices)



