%-----------------------------------------------------------------------
% Code for preprocessing, step 1: coregister
% spm SPM - SPM12 (7771)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------

%% Unzip files if not yet done
%subjects = [01 02  03 04 05 06 07 08 09 10 11 12 13 14 16 17 18 20 21 22 23 24 25 26 27 29 30 31 32 33 34 35 36 37 38 39 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 65 66 67 68];
subjects = [02 03];

for subject=subjects
    subject = num2str(subject, '%02d');

    if isfile(['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii']) == 0
        display('Run 1 has not been unzipped; unzipping now')
        gunzip(['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii.gz'])
    else
        display('Run 1 is already unzipped; doing nothing')
    end

    if isfile(['D:\Riet\CaseStudies\Analyses\Data\anat\sub-' subject '\ses-1\anat\sub-' subject '_ses-1_run-01_T1w.nii']) == 0
        display('Anatomical has not been unzipped; unzipping now')
        gunzip(['D:\Riet\CaseStudies\Analyses\Data\anat\sub-' subject '\ses-1\anat\sub-' subject '_ses-1_run-01_T1w.nii.gz'])
    else
        display('Anatomical is already unzipped; doing nothing')
    end

%% Coregister

matlabbatch{1}.spm.spatial.coreg.estwrite.ref = {['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,1']};
matlabbatch{1}.spm.spatial.coreg.estwrite.source = {['D:\Riet\CaseStudies\Analyses\Data\anat\sub-' subject '\ses-1\anat\sub-' subject '_ses-1_run-01_T1w.nii,1']};
matlabbatch{1}.spm.spatial.coreg.estwrite.other = {''};
matlabbatch{1}.spm.spatial.coreg.estwrite.eoptions.cost_fun = 'nmi';
matlabbatch{1}.spm.spatial.coreg.estwrite.eoptions.sep = [4 2];
matlabbatch{1}.spm.spatial.coreg.estwrite.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
matlabbatch{1}.spm.spatial.coreg.estwrite.eoptions.fwhm = [7 7];
matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.interp = 4;
matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.wrap = [0 0 0];
matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.mask = 0;
matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.prefix = 'r';

spm_jobman('run', matlabbatch);

end % end subject loop
