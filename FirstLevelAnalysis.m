%%This code runs model specification and estimation for all subjects, all movements
%%Save this file in the directory with all subject folders containing the preprocessed data
%%Execute the code specified in the SPM GUI

%% Unzip files if not yet done
subjects = [01 02  03 04 05 06 07 08 09 10 11 12 13 14 16 17 18 20 21 22 23 24 25 26 27 29 30 31 32 33 34 35 36 37 38 39 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 65 66 67 68];

for subject=subjects
    subject = num2str(subject, '%02d');

    if isfile(['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii']) == 0
        display('Run 1 has not been unzipped; unzipping now')
        gunzip(['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii.gz'])
    else
        display('Run 1 is already unzipped; doing nothing')
    end

    if isfile(['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii']) == 0
        display('Run 2 has not been unzipped; unzipping now')
        gunzip(['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii.gz'])
    else
        display('Run 2 is already unzipped; doing nothing')
    end

%% Set directory, timing units, RT, microtime resolution and microtime onset
matlabbatch{1}.spm.stats.fmri_spec.dir = {['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\FirstLevel\sub-' subject]};
matlabbatch{1}.spm.stats.fmri_spec.timing.units = 'secs';
matlabbatch{1}.spm.stats.fmri_spec.timing.RT = 2;
matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t = 16;
matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t0 = 8;

%% Load scans for run-1
matlabbatch{1}.spm.stats.fmri_spec.sess(1).scans = {
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,1']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,2']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,3']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,4']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,5']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,6']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,7']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,8']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,9']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,10']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,11']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,12']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,13']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,14']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,15']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,16']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,17']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,18']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,19']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,20']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,21']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,22']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,23']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,24']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,25']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,26']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,27']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,28']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,29']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,30']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,31']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,32']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,33']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,34']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,35']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,36']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,37']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,38']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,39']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,40']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,41']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,42']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,43']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,44']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,45']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,46']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,47']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,48']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,49']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,50']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,51']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,52']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,53']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,54']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,55']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,56']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,57']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,58']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,59']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,60']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,61']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,62']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,63']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,64']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,65']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,66']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,67']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,68']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,69']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,70']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,71']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,72']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,73']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,74']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,75']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,76']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,77']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,78']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,79']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,80']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,81']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,82']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,83']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,84']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,85']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,86']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,87']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,88']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,89']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,90']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,91']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,92']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,93']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,94']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,95']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,96']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,97']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,98']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,99']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,100']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,101']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,102']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,103']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,104']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,105']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,106']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,107']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,108']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,109']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,110']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,111']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,112']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,113']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,114']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,115']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,116']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,117']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,118']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,119']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,120']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,121']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,122']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,123']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,124']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,125']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,126']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,127']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,128']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,129']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,130']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,131']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,132']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,133']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,134']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,135']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,136']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,137']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,138']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,139']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,140']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,141']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,142']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,143']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,144']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,145']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,146']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,147']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,148']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,149']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,150']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,151']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,152']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,153']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,154']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,155']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,156']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,157']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,158']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,159']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,160']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,161']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,162']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,163']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,164']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,165']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,166']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,167']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,168']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,169']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,170']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,171']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,172']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,173']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,174']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,175']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,176']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,177']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,178']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,179']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,180']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,181']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,182']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,183']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,184']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,185']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,186']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,187']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,188']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,189']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,190']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,191']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,192']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,193']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,194']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,195']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,196']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,197']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,198']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,199']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,200']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,201']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,202']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,203']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,204']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,205']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,206']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,207']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,208']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,209']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,210']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,211']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,212']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,213']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,214']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,215']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,216']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,217']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,218']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,219']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,220']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,221']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,222']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,223']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,224']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,225']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,226']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,227']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,228']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,229']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,230']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,231']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-1_space-T1w_desc-preproc_bold_denoised.nii,232']
                                                    };

%% Load the timing files for each condition for run-1
Data_Rest_run1 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\Rest_run1.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(1).name = 'Rest';
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(1).onset = Data_Rest_run1(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(1).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(1).orth = 1;

Data_Arm_run1 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\ArmMovement_run1.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(2).name = 'Arm';
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(2).onset = Data_Arm_run1(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(2).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(2).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(2).orth = 1;

Data_Wrist_run1 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\WristMovement_run1.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(3).name = 'Wrist';
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(3).onset = Data_Wrist_run1(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(3).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(3).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(3).orth = 1;

Data_Finger_run1 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\FingerMovement_run1.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(4).name = 'Finger';
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(4).onset = Data_Finger_run1(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(4).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(4).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(4).orth = 1;

Data_Leg_run1 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\LegMovement_run1.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(5).name = 'Leg';
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(5).onset = Data_Leg_run1(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(5).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(5).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(5).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(5).orth = 1;

Data_Ankle_run1 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\AnkleMovement_run1.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(6).name = 'Ankle';
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(6).onset = Data_Ankle_run1(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(6).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(6).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(6).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(6).orth = 1;

Data_Toe_run1 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\ToeMovement_run1.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(7).name = 'Toe';
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(7).onset = Data_Toe_run1(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(7).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(7).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(7).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(7).orth = 1;

Data_Mouth_run1 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\MouthMovement_run1.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(8).name = 'Mouth';
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(8).onset = Data_Mouth_run1(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(8).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(8).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(8).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(8).orth = 1;

Data_Eye_run1 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\EyeMovement_run1.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(9).name = 'Eye';
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(9).onset = Data_Eye_run1(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(9).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(9).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(9).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(9).orth = 1;

matlabbatch{1}.spm.stats.fmri_spec.sess(1).multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(1).regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(1).multi_reg = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(1).hpf = 128;

%% Load scans for run-2
matlabbatch{1}.spm.stats.fmri_spec.sess(2).scans = {
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,1']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,2']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,3']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,4']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,5']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,6']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,7']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,8']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,9']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,10']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,11']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,12']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,13']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,14']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,15']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,16']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,17']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,18']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,19']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,20']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,21']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,22']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,23']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,24']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,25']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,26']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,27']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,28']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,29']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,30']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,31']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,32']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,33']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,34']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,35']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,36']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,37']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,38']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,39']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,40']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,41']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,42']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,43']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,44']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,45']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,46']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,47']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,48']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,49']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,50']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,51']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,52']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,53']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,54']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,55']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,56']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,57']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,58']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,59']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,60']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,61']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,62']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,63']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,64']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,65']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,66']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,67']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,68']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,69']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,70']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,71']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,72']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,73']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,74']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,75']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,76']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,77']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,78']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,79']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,80']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,81']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,82']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,83']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,84']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,85']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,86']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,87']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,88']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,89']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,90']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,91']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,92']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,93']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,94']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,95']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,96']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,97']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,98']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,99']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,100']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,101']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,102']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,103']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,104']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,105']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,106']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,107']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,108']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,109']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,110']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,111']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,112']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,113']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,114']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,115']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,116']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,117']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,118']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,119']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,120']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,121']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,122']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,123']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,124']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,125']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,126']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,127']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,128']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,129']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,130']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,131']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,132']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,133']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,134']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,135']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,136']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,137']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,138']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,139']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,140']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,141']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,142']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,143']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,144']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,145']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,146']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,147']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,148']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,149']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,150']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,151']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,152']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,153']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,154']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,155']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,156']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,157']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,158']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,159']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,160']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,161']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,162']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,163']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,164']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,165']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,166']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,167']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,168']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,169']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,170']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,171']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,172']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,173']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,174']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,175']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,176']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,177']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,178']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,179']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,180']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,181']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,182']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,183']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,184']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,185']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,186']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,187']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,188']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,189']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,190']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,191']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,192']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,193']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,194']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,195']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,196']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,197']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,198']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,199']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,200']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,201']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,202']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,203']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,204']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,205']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,206']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,207']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,208']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,209']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,210']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,211']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,212']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,213']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,214']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,215']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,216']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,217']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,218']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,219']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,220']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,221']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,222']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,223']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,224']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,225']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,226']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,227']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,228']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,229']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,230']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,231']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-2_space-T1w_desc-preproc_bold_denoised.nii,232']
                                                    };

%% Load the timing files for each condition for run-2
Data_Rest_run2 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\Rest_run2.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(1).name = 'Rest';
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(1).onset = Data_Rest_run2(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(1).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(1).orth = 1;

Data_Arm_run2 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\ArmMovement_run2.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(2).name = 'Arm';
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(2).onset = Data_Arm_run2(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(2).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(2).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(2).orth = 1;

Data_Wrist_run2 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\WristMovement_run2.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(3).name = 'Wrist';
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(3).onset = Data_Wrist_run2(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(3).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(3).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(3).orth = 1;

Data_Finger_run2 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\FingerMovement_run2.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(4).name = 'Finger';
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(4).onset = Data_Finger_run2(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(4).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(4).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(4).orth = 1;

Data_Leg_run2 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\LegMovement_run2.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(5).name = 'Leg';
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(5).onset = Data_Leg_run2(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(5).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(5).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(5).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(5).orth = 1;

Data_Ankle_run2 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\AnkleMovement_run2.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(6).name = 'Ankle';
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(6).onset = Data_Ankle_run2(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(6).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(6).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(6).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(6).orth = 1;

Data_Toe_run2 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\ToeMovement_run2.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(7).name = 'Toe';
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(7).onset = Data_Toe_run2(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(7).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(7).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(7).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(7).orth = 1;

Data_Mouth_run2 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\MouthMovement_run2.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(8).name = 'Mouth';
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(8).onset = Data_Mouth_run2(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(8).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(8).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(8).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(8).orth = 1;

Data_Eye_run2 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\EyeMovement_run2.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(9).name = 'Eye';
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(9).onset = Data_Eye_run2(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(9).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(9).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(9).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(9).orth = 1;

matlabbatch{1}.spm.stats.fmri_spec.sess(2).multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(2).regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(2).multi_reg = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(2).hpf = 128;

%% Load scans for run-3
matlabbatch{1}.spm.stats.fmri_spec.sess(3).scans = {
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,1']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,2']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,3']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,4']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,5']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,6']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,7']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,8']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,9']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,10']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,11']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,12']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,13']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,14']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,15']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,16']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,17']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,18']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,19']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,20']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,21']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,22']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,23']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,24']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,25']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,26']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,27']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,28']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,29']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,30']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,31']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,32']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,33']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,34']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,35']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,36']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,37']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,38']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,39']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,40']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,41']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,42']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,43']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,44']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,45']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,46']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,47']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,48']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,49']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,50']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,51']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,52']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,53']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,54']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,55']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,56']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,57']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,58']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,59']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,60']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,61']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,62']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,63']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,64']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,65']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,66']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,67']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,68']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,69']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,70']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,71']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,72']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,73']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,74']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,75']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,76']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,77']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,78']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,79']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,80']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,81']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,82']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,83']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,84']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,85']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,86']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,87']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,88']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,89']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,90']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,91']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,92']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,93']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,94']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,95']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,96']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,97']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,98']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,99']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,100']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,101']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,102']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,103']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,104']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,105']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,106']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,107']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,108']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,109']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,110']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,111']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,112']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,113']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,114']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,115']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,116']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,117']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,118']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,119']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,120']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,121']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,122']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,123']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,124']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,125']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,126']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,127']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,128']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,129']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,130']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,131']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,132']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,133']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,134']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,135']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,136']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,137']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,138']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,139']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,140']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,141']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,142']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,143']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,144']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,145']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,146']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,147']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,148']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,149']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,150']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,151']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,152']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,153']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,154']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,155']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,156']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,157']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,158']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,159']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,160']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,161']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,162']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,163']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,164']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,165']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,166']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,167']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,168']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,169']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,170']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,171']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,172']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,173']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,174']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,175']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,176']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,177']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,178']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,179']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,180']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,181']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,182']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,183']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,184']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,185']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,186']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,187']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,188']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,189']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,190']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,191']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,192']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,193']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,194']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,195']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,196']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,197']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,198']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,199']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,200']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,201']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,202']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,203']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,204']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,205']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,206']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,207']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,208']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,209']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,210']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,211']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,212']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,213']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,214']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,215']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,216']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,217']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,218']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,219']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,220']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,221']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,222']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,223']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,224']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,225']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,226']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,227']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,228']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,229']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,230']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,231']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-3_space-T1w_desc-preproc_bold_denoised.nii,232']
                                                    };

%% Load the timing files for each condition for run-3
Data_Rest_run3 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\Rest_run3.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(1).name = 'Rest';
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(1).onset = Data_Rest_run3(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(1).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(1).orth = 1;

Data_Arm_run3 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\ArmMovement_run3.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(2).name = 'Arm';
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(2).onset = Data_Arm_run3(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(2).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(2).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(2).orth = 1;

Data_Wrist_run3 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\WristMovement_run3.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(3).name = 'Wrist';
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(3).onset = Data_Wrist_run3(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(3).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(3).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(3).orth = 1;

Data_Finger_run3 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\FingerMovement_run3.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(4).name = 'Finger';
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(4).onset = Data_Finger_run3(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(4).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(4).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(4).orth = 1;

Data_Leg_run3 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\LegMovement_run3.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(5).name = 'Leg';
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(5).onset = Data_Leg_run3(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(5).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(5).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(5).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(5).orth = 1;

Data_Ankle_run3 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\AnkleMovement_run3.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(6).name = 'Ankle';
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(6).onset = Data_Ankle_run3(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(6).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(6).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(6).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(6).orth = 1;

Data_Toe_run3 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\ToeMovement_run3.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(7).name = 'Toe';
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(7).onset = Data_Toe_run3(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(7).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(7).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(7).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(7).orth = 1;

Data_Mouth_run3 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\MouthMovement_run3.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(8).name = 'Mouth';
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(8).onset = Data_Mouth_run3(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(8).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(8).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(8).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(8).orth = 1;

Data_Eye_run3 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\EyeMovement_run3.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(9).name = 'Eye';
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(9).onset = Data_Eye_run3(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(9).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(9).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(9).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(9).orth = 1;

matlabbatch{1}.spm.stats.fmri_spec.sess(3).multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(3).regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(3).multi_reg = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(3).hpf = 128;

%% Load scans for run-4
matlabbatch{1}.spm.stats.fmri_spec.sess(4).scans = {
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,1']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,2']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,3']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,4']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,5']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,6']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,7']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,8']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,9']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,10']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,11']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,12']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,13']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,14']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,15']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,16']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,17']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,18']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,19']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,20']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,21']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,22']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,23']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,24']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,25']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,26']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,27']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,28']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,29']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,30']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,31']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,32']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,33']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,34']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,35']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,36']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,37']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,38']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,39']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,40']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,41']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,42']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,43']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,44']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,45']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,46']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,47']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,48']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,49']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,50']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,51']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,52']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,53']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,54']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,55']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,56']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,57']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,58']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,59']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,60']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,61']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,62']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,63']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,64']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,65']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,66']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,67']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,68']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,69']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,70']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,71']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,72']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,73']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,74']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,75']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,76']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,77']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,78']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,79']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,80']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,81']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,82']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,83']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,84']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,85']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,86']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,87']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,88']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,89']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,90']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,91']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,92']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,93']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,94']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,95']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,96']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,97']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,98']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,99']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,100']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,101']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,102']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,103']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,104']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,105']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,106']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,107']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,108']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,109']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,110']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,111']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,112']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,113']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,114']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,115']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,116']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,117']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,118']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,119']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,120']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,121']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,122']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,123']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,124']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,125']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,126']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,127']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,128']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,129']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,130']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,131']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,132']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,133']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,134']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,135']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,136']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,137']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,138']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,139']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,140']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,141']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,142']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,143']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,144']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,145']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,146']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,147']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,148']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,149']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,150']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,151']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,152']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,153']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,154']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,155']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,156']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,157']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,158']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,159']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,160']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,161']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,162']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,163']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,164']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,165']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,166']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,167']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,168']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,169']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,170']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,171']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,172']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,173']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,174']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,175']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,176']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,177']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,178']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,179']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,180']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,181']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,182']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,183']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,184']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,185']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,186']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,187']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,188']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,189']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,190']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,191']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,192']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,193']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,194']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,195']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,196']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,197']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,198']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,199']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,200']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,201']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,202']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,203']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,204']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,205']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,206']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,207']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,208']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,209']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,210']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,211']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,212']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,213']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,214']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,215']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,216']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,217']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,218']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,219']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,220']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,221']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,222']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,223']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,224']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,225']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,226']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,227']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,228']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,229']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,230']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,231']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-4_space-T1w_desc-preproc_bold_denoised.nii,232']
                                                    };

%% Load the timing files for each condition for run-4
Data_Rest_run4 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\Rest_run4.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(1).name = 'Rest';
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(1).onset = Data_Rest_run4(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(1).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(1).orth = 1;

Data_Arm_run4 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\ArmMovement_run4.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(2).name = 'Arm';
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(2).onset = Data_Arm_run4(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(2).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(2).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(2).orth = 1;

Data_Wrist_run4 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\WristMovement_run4.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(3).name = 'Wrist';
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(3).onset = Data_Wrist_run4(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(3).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(3).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(3).orth = 1;

Data_Finger_run4 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\FingerMovement_run4.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(4).name = 'Finger';
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(4).onset = Data_Finger_run4(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(4).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(4).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(4).orth = 1;

Data_Leg_run4 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\LegMovement_run4.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(5).name = 'Leg';
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(5).onset = Data_Leg_run4(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(5).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(5).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(5).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(5).orth = 1;

Data_Ankle_run4 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\AnkleMovement_run4.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(6).name = 'Ankle';
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(6).onset = Data_Ankle_run4(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(6).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(6).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(6).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(6).orth = 1;

Data_Toe_run4 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\ToeMovement_run4.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(7).name = 'Toe';
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(7).onset = Data_Toe_run4(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(7).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(7).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(7).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(7).orth = 1;

Data_Mouth_run4 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\MouthMovement_run4.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(8).name = 'Mouth';
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(8).onset = Data_Mouth_run4(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(8).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(8).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(8).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(8).orth = 1;

Data_Eye_run4 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\EyeMovement_run4.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(9).name = 'Eye';
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(9).onset = Data_Eye_run4(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(9).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(9).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(9).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(9).orth = 1;

matlabbatch{1}.spm.stats.fmri_spec.sess(4).multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(4).regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(4).multi_reg = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(4).hpf = 128;

%% Load scans for run-5
matlabbatch{1}.spm.stats.fmri_spec.sess(5).scans = {
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,1']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,2']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,3']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,4']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,5']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,6']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,7']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,8']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,9']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,10']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,11']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,12']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,13']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,14']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,15']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,16']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,17']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,18']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,19']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,20']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,21']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,22']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,23']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,24']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,25']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,26']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,27']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,28']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,29']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,30']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,31']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,32']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,33']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,34']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,35']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,36']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,37']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,38']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,39']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,40']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,41']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,42']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,43']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,44']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,45']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,46']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,47']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,48']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,49']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,50']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,51']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,52']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,53']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,54']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,55']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,56']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,57']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,58']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,59']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,60']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,61']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,62']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,63']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,64']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,65']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,66']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,67']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,68']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,69']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,70']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,71']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,72']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,73']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,74']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,75']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,76']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,77']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,78']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,79']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,80']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,81']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,82']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,83']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,84']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,85']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,86']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,87']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,88']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,89']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,90']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,91']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,92']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,93']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,94']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,95']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,96']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,97']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,98']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,99']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,100']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,101']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,102']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,103']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,104']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,105']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,106']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,107']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,108']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,109']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,110']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,111']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,112']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,113']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,114']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,115']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,116']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,117']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,118']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,119']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,120']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,121']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,122']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,123']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,124']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,125']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,126']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,127']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,128']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,129']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,130']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,131']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,132']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,133']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,134']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,135']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,136']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,137']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,138']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,139']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,140']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,141']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,142']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,143']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,144']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,145']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,146']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,147']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,148']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,149']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,150']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,151']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,152']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,153']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,154']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,155']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,156']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,157']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,158']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,159']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,160']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,161']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,162']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,163']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,164']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,165']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,166']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,167']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,168']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,169']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,170']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,171']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,172']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,173']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,174']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,175']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,176']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,177']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,178']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,179']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,180']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,181']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,182']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,183']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,184']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,185']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,186']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,187']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,188']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,189']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,190']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,191']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,192']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,193']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,194']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,195']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,196']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,197']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,198']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,199']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,200']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,201']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,202']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,203']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,204']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,205']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,206']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,207']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,208']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,209']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,210']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,211']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,212']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,213']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,214']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,215']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,216']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,217']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,218']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,219']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,220']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,221']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,222']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,223']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,224']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,225']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,226']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,227']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,228']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,229']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,230']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,231']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-5_space-T1w_desc-preproc_bold_denoised.nii,232']
                                                    };

%% Load the timing files for each condition for run-5
Data_Rest_run5 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\Rest_run5.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(1).name = 'Rest';
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(1).onset = Data_Rest_run5(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(1).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(1).orth = 1;

Data_Arm_run5 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\ArmMovement_run5.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(2).name = 'Arm';
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(2).onset = Data_Arm_run5(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(2).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(2).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(2).orth = 1;

Data_Wrist_run5 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\WristMovement_run5.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(3).name = 'Wrist';
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(3).onset = Data_Wrist_run5(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(3).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(3).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(3).orth = 1;

Data_Finger_run5 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\FingerMovement_run5.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(4).name = 'Finger';
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(4).onset = Data_Finger_run5(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(4).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(4).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(4).orth = 1;

Data_Leg_run5 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\LegMovement_run5.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(5).name = 'Leg';
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(5).onset = Data_Leg_run5(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(5).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(5).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(5).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(5).orth = 1;

Data_Ankle_run5 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\AnkleMovement_run5.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(6).name = 'Ankle';
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(6).onset = Data_Ankle_run5(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(6).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(6).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(6).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(6).orth = 1;

Data_Toe_run5 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\ToeMovement_run5.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(7).name = 'Toe';
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(7).onset = Data_Toe_run5(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(7).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(7).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(7).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(7).orth = 1;

Data_Mouth_run5 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\MouthMovement_run5.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(8).name = 'Mouth';
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(8).onset = Data_Mouth_run5(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(8).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(8).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(8).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(8).orth = 1;

Data_Eye_run5 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\EyeMovement_run5.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(9).name = 'Eye';
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(9).onset = Data_Eye_run5(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(9).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(9).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(9).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(9).orth = 1;

matlabbatch{1}.spm.stats.fmri_spec.sess(5).multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(5).regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(5).multi_reg = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(5).hpf = 128;

%% Load scans for run-6
matlabbatch{1}.spm.stats.fmri_spec.sess(6).scans = {
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,1']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,2']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,3']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,4']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,5']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,6']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,7']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,8']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,9']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,10']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,11']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,12']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,13']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,14']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,15']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,16']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,17']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,18']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,19']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,20']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,21']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,22']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,23']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,24']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,25']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,26']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,27']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,28']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,29']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,30']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,31']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,32']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,33']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,34']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,35']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,36']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,37']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,38']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,39']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,40']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,41']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,42']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,43']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,44']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,45']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,46']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,47']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,48']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,49']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,50']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,51']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,52']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,53']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,54']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,55']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,56']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,57']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,58']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,59']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,60']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,61']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,62']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,63']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,64']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,65']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,66']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,67']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,68']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,69']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,70']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,71']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,72']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,73']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,74']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,75']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,76']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,77']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,78']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,79']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,80']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,81']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,82']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,83']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,84']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,85']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,86']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,87']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,88']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,89']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,90']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,91']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,92']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,93']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,94']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,95']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,96']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,97']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,98']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,99']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,100']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,101']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,102']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,103']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,104']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,105']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,106']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,107']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,108']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,109']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,110']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,111']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,112']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,113']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,114']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,115']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,116']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,117']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,118']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,119']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,120']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,121']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,122']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,123']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,124']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,125']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,126']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,127']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,128']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,129']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,130']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,131']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,132']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,133']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,134']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,135']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,136']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,137']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,138']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,139']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,140']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,141']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,142']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,143']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,144']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,145']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,146']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,147']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,148']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,149']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,150']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,151']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,152']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,153']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,154']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,155']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,156']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,157']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,158']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,159']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,160']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,161']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,162']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,163']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,164']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,165']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,166']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,167']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,168']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,169']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,170']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,171']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,172']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,173']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,174']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,175']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,176']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,177']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,178']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,179']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,180']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,181']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,182']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,183']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,184']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,185']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,186']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,187']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,188']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,189']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,190']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,191']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,192']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,193']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,194']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,195']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,196']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,197']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,198']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,199']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,200']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,201']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,202']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,203']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,204']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,205']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,206']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,207']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,208']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,209']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,210']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,211']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,212']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,213']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,214']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,215']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,216']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,217']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,218']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,219']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,220']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,221']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,222']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,223']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,224']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,225']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,226']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,227']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,228']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,229']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,230']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,231']
                                                    ['D:\Riet\CaseStudies\Analyses\Data\fmriprep\sub-' subject '\sub-' subject '_ses-1_task-motor_run-6_space-T1w_desc-preproc_bold_denoised.nii,232']
                                                    };

%% Load the timing files for each condition for run-6
Data_Rest_run6 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\Rest_run6.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(1).name = 'Rest';
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(1).onset = Data_Rest_run6(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(1).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(1).orth = 1;

Data_Arm_run6 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\ArmMovement_run6.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(2).name = 'Arm';
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(2).onset = Data_Arm_run6(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(2).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(2).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(2).orth = 1;

Data_Wrist_run6 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\WristMovement_run6.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(3).name = 'Wrist';
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(3).onset = Data_Wrist_run6(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(3).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(3).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(3).orth = 1;

Data_Finger_run6 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\FingerMovement_run6.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(4).name = 'Finger';
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(4).onset = Data_Finger_run6(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(4).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(4).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(4).orth = 1;

Data_Leg_run6 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\LegMovement_run6.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(5).name = 'Leg';
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(5).onset = Data_Leg_run6(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(5).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(5).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(5).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(5).orth = 1;

Data_Ankle_run6 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\AnkleMovement_run6.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(6).name = 'Ankle';
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(6).onset = Data_Ankle_run6(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(6).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(6).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(6).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(6).orth = 1;

Data_Toe_run6 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\ToeMovement_run6.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(7).name = 'Toe';
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(7).onset = Data_Toe_run6(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(7).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(7).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(7).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(7).orth = 1;

Data_Mouth_run6 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\MouthMovement_run6.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(8).name = 'Mouth';
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(8).onset = Data_Mouth_run6(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(8).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(8).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(8).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(8).orth = 1;

Data_Eye_run6 = load(['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\EventFiles\sub-' subject '\EyeMovement_run6.txt']);
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(9).name = 'Eye';
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(9).onset = Data_Eye_run6(:,1);
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(9).duration = 16;
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(9).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(9).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(9).orth = 1;

matlabbatch{1}.spm.stats.fmri_spec.sess(6).multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(6).regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(6).multi_reg = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(6).hpf = 128;

matlabbatch{1}.spm.stats.fmri_spec.fact = struct('name', {}, 'levels', {});
matlabbatch{1}.spm.stats.fmri_spec.bases.hrf.derivs = [0 0];
matlabbatch{1}.spm.stats.fmri_spec.volt = 1;
matlabbatch{1}.spm.stats.fmri_spec.global = 'None';
matlabbatch{1}.spm.stats.fmri_spec.mthresh = 0.8;
matlabbatch{1}.spm.stats.fmri_spec.mask = {''};
matlabbatch{1}.spm.stats.fmri_spec.cvi = 'AR(1)';

%% Estimation
matlabbatch{2}.spm.stats.fmri_est.spmmat = {['C:\Users\verga\OneDrive - UGent\School\Psychologie - experimentele\3e master\4 Case Studies in the Analysis of Experimental Data\Analyses\Data\FirstLevel\sub-' subject '\SPM.mat']};
matlabbatch{2}.spm.stats.fmri_est.write_residuals = 1;
matlabbatch{2}.spm.stats.fmri_est.method.Classical = 1;

spm_jobman('run', matlabbatch);

end % end of participant loop
