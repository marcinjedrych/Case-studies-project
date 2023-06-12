% % Onset files for all movements
% % Run this script from the directory that contains all of your subjects

subjects = [01 02 03 05 06 07 08 09 10 11 12 13 14 16 17 18 20 21 22 24 25 26 29 30 31 32 33 34 35 36 37 38 39 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 65 66 67 68]; % Replace with a list of all of the subjects you wish to analyze


for subject=subjects
    
    subject = num2str(subject, '%02d'); % Zero-pads each number so that the subject ID is 2 characters long

    cd(['sub-' subject]) % Navigate to the subject's directory

    Run1_onsetTimes = tdfread(['sub-' subject '_ses-1_task-motor_run-01_events.tsv'], '\t'); % Read onset times file
    Run1_onsetTimes.trial_type = string(Run1_onsetTimes.trial_type); % Convert char array to string array, to make logical comparisons easier

    Run1_Rest = [];
    Run1_ArmMovement = [];
    Run1_LegMovement = [];
    Run1_MouthMovement = [];
    Run1_EyeMovement = [];
    Run1_FingerMovement = [];
    Run1_WristMovement = [];
    Run1_AnkleMovement = [];
    Run1_ToeMovement = [];

    for i = 1:length(Run1_onsetTimes.onset)
        if strtrim(Run1_onsetTimes.trial_type(i,:)) == 'Rest'
            Run1_Rest = [Run1_Rest; Run1_onsetTimes.onset(i,:) Run1_onsetTimes.duration(i,:)];

        elseif strtrim(Run1_onsetTimes.trial_type(i,:)) == 'Upper arm movements'
            Run1_ArmMovement = [Run1_ArmMovement; Run1_onsetTimes.onset(i,:) Run1_onsetTimes.duration(i,:)];
        elseif strtrim(Run1_onsetTimes.trial_type(i,:)) == 'Forearm movements'
            Run1_ArmMovement = [Run1_ArmMovement; Run1_onsetTimes.onset(i,:) Run1_onsetTimes.duration(i,:)];

        elseif strtrim(Run1_onsetTimes.trial_type(i,:)) == 'Left leg movements'
            Run1_LegMovement = [Run1_LegMovement; Run1_onsetTimes.onset(i,:) Run1_onsetTimes.duration(i,:)];
        elseif strtrim(Run1_onsetTimes.trial_type(i,:)) == 'Right leg movements'
            Run1_LegMovement = [Run1_LegMovement; Run1_onsetTimes.onset(i,:) Run1_onsetTimes.duration(i,:)];

        elseif strtrim(Run1_onsetTimes.trial_type(i,:)) == 'Jaw movements'
            Run1_MouthMovement = [Run1_MouthMovement; Run1_onsetTimes.onset(i,:) Run1_onsetTimes.duration(i,:)];
        elseif strtrim(Run1_onsetTimes.trial_type(i,:)) == 'Tongue movements'
            Run1_MouthMovement = [Run1_MouthMovement; Run1_onsetTimes.onset(i,:) Run1_onsetTimes.duration(i,:)];
        elseif strtrim(Run1_onsetTimes.trial_type(i,:)) == 'Lip movements'
            Run1_MouthMovement = [Run1_MouthMovement; Run1_onsetTimes.onset(i,:) Run1_onsetTimes.duration(i,:)];

        elseif strtrim(Run1_onsetTimes.trial_type(i,:)) == 'Eye movements'
            Run1_EyeMovement = [Run1_EyeMovement; Run1_onsetTimes.onset(i,:) Run1_onsetTimes.duration(i,:)];

        elseif strtrim(Run1_onsetTimes.trial_type(i,:)) == 'Finger movements'
            Run1_FingerMovement = [Run1_FingerMovement; Run1_onsetTimes.onset(i,:) Run1_onsetTimes.duration(i,:)];

        elseif strtrim(Run1_onsetTimes.trial_type(i,:)) == 'Wrist movements'
            Run1_WristMovement = [Run1_WristMovement; Run1_onsetTimes.onset(i,:) Run1_onsetTimes.duration(i,:)];

        elseif strtrim(Run1_onsetTimes.trial_type(i,:)) == 'Ankle movements'
            Run1_AnkleMovement = [Run1_AnkleMovement; Run1_onsetTimes.onset(i,:) Run1_onsetTimes.duration(i,:)];

        elseif strtrim(Run1_onsetTimes.trial_type(i,:)) == 'Toe movements'
            Run1_ToeMovement = [Run1_ToeMovement; Run1_onsetTimes.onset(i,:) Run1_onsetTimes.duration(i,:)];
        end
    end

    Run2_onsetTimes = tdfread(['sub-' subject '_ses-1_task-motor_run-02_events.tsv'], '\t');
    Run2_onsetTimes.trial_type = string(Run2_onsetTimes.trial_type);

    Run2_Rest = [];
    Run2_ArmMovement = [];
    Run2_LegMovement = [];
    Run2_MouthMovement = [];
    Run2_EyeMovement = [];
    Run2_FingerMovement = [];
    Run2_WristMovement = [];
    Run2_AnkleMovement = [];
    Run2_ToeMovement = [];

    for i = 1:length(Run2_onsetTimes.onset)
        if strtrim(Run2_onsetTimes.trial_type(i,:)) == 'Rest'
            Run2_Rest = [Run2_Rest; Run2_onsetTimes.onset(i,:) Run2_onsetTimes.duration(i,:)];

        elseif strtrim(Run2_onsetTimes.trial_type(i,:)) == 'Upper arm movements'
            Run2_ArmMovement = [Run2_ArmMovement; Run2_onsetTimes.onset(i,:) Run2_onsetTimes.duration(i,:)];
        elseif strtrim(Run2_onsetTimes.trial_type(i,:)) == 'Forearm movements'
            Run2_ArmMovement = [Run2_ArmMovement; Run2_onsetTimes.onset(i,:) Run2_onsetTimes.duration(i,:)];

        elseif strtrim(Run2_onsetTimes.trial_type(i,:)) == 'Left leg movements'
            Run2_LegMovement = [Run2_LegMovement; Run2_onsetTimes.onset(i,:) Run2_onsetTimes.duration(i,:)];
        elseif strtrim(Run2_onsetTimes.trial_type(i,:)) == 'Right leg movements'
            Run2_LegMovement = [Run2_LegMovement; Run2_onsetTimes.onset(i,:) Run2_onsetTimes.duration(i,:)];

        elseif strtrim(Run2_onsetTimes.trial_type(i,:)) == 'Jaw movements'
            Run2_MouthMovement = [Run2_MouthMovement; Run2_onsetTimes.onset(i,:) Run2_onsetTimes.duration(i,:)];
        elseif strtrim(Run2_onsetTimes.trial_type(i,:)) == 'Tongue movements'
            Run2_MouthMovement = [Run2_MouthMovement; Run2_onsetTimes.onset(i,:) Run2_onsetTimes.duration(i,:)];
        elseif strtrim(Run2_onsetTimes.trial_type(i,:)) == 'Lip movements'
            Run2_MouthMovement = [Run2_MouthMovement; Run2_onsetTimes.onset(i,:) Run2_onsetTimes.duration(i,:)];

        elseif strtrim(Run2_onsetTimes.trial_type(i,:)) == 'Eye movements'
            Run2_EyeMovement = [Run2_EyeMovement; Run2_onsetTimes.onset(i,:) Run2_onsetTimes.duration(i,:)];

        elseif strtrim(Run2_onsetTimes.trial_type(i,:)) == 'Finger movements'
            Run2_FingerMovement = [Run2_FingerMovement; Run2_onsetTimes.onset(i,:) Run2_onsetTimes.duration(i,:)];

        elseif strtrim(Run2_onsetTimes.trial_type(i,:)) == 'Wrist movements'
            Run2_WristMovement = [Run2_WristMovement; Run2_onsetTimes.onset(i,:) Run2_onsetTimes.duration(i,:)];

        elseif strtrim(Run2_onsetTimes.trial_type(i,:)) == 'Ankle movements'
            Run2_AnkleMovement = [Run2_AnkleMovement; Run2_onsetTimes.onset(i,:) Run2_onsetTimes.duration(i,:)];

        elseif strtrim(Run2_onsetTimes.trial_type(i,:)) == 'Toe movements'
            Run2_ToeMovement = [Run2_ToeMovement; Run2_onsetTimes.onset(i,:) Run2_onsetTimes.duration(i,:)];
        end
    end

    Run3_onsetTimes = tdfread(['sub-' subject '_ses-1_task-motor_run-03_events.tsv'], '\t');
    Run3_onsetTimes.trial_type = string(Run3_onsetTimes.trial_type);

    Run3_Rest = [];
    Run3_ArmMovement = [];
    Run3_LegMovement = [];
    Run3_MouthMovement = [];
    Run3_EyeMovement = [];
    Run3_FingerMovement = [];
    Run3_WristMovement = [];
    Run3_AnkleMovement = [];
    Run3_ToeMovement = [];

    for i = 1:length(Run3_onsetTimes.onset)
        if strtrim(Run3_onsetTimes.trial_type(i,:)) == 'Rest'
            Run3_Rest = [Run3_Rest; Run3_onsetTimes.onset(i,:) Run3_onsetTimes.duration(i,:)];

        elseif strtrim(Run3_onsetTimes.trial_type(i,:)) == 'Upper arm movements'
            Run3_ArmMovement = [Run3_ArmMovement; Run3_onsetTimes.onset(i,:) Run3_onsetTimes.duration(i,:)];
        elseif strtrim(Run3_onsetTimes.trial_type(i,:)) == 'Forearm movements'
            Run3_ArmMovement = [Run3_ArmMovement; Run3_onsetTimes.onset(i,:) Run3_onsetTimes.duration(i,:)];

        elseif strtrim(Run3_onsetTimes.trial_type(i,:)) == 'Left leg movements'
            Run3_LegMovement = [Run3_LegMovement; Run3_onsetTimes.onset(i,:) Run3_onsetTimes.duration(i,:)];
        elseif strtrim(Run3_onsetTimes.trial_type(i,:)) == 'Right leg movements'
            Run3_LegMovement = [Run3_LegMovement; Run3_onsetTimes.onset(i,:) Run3_onsetTimes.duration(i,:)];

        elseif strtrim(Run3_onsetTimes.trial_type(i,:)) == 'Jaw movements'
            Run3_MouthMovement = [Run3_MouthMovement; Run3_onsetTimes.onset(i,:) Run3_onsetTimes.duration(i,:)];
        elseif strtrim(Run3_onsetTimes.trial_type(i,:)) == 'Tongue movements'
            Run3_MouthMovement = [Run3_MouthMovement; Run3_onsetTimes.onset(i,:) Run3_onsetTimes.duration(i,:)];
        elseif strtrim(Run3_onsetTimes.trial_type(i,:)) == 'Lip movements'
            Run3_MouthMovement = [Run3_MouthMovement; Run3_onsetTimes.onset(i,:) Run3_onsetTimes.duration(i,:)];

        elseif strtrim(Run3_onsetTimes.trial_type(i,:)) == 'Eye movements'
            Run3_EyeMovement = [Run3_EyeMovement; Run3_onsetTimes.onset(i,:) Run3_onsetTimes.duration(i,:)];

        elseif strtrim(Run3_onsetTimes.trial_type(i,:)) == 'Finger movements'
            Run3_FingerMovement = [Run3_FingerMovement; Run3_onsetTimes.onset(i,:) Run3_onsetTimes.duration(i,:)];

        elseif strtrim(Run3_onsetTimes.trial_type(i,:)) == 'Wrist movements'
            Run3_WristMovement = [Run3_WristMovement; Run3_onsetTimes.onset(i,:) Run3_onsetTimes.duration(i,:)];

        elseif strtrim(Run3_onsetTimes.trial_type(i,:)) == 'Ankle movements'
            Run3_AnkleMovement = [Run3_AnkleMovement; Run3_onsetTimes.onset(i,:) Run3_onsetTimes.duration(i,:)];

        elseif strtrim(Run3_onsetTimes.trial_type(i,:)) == 'Toe movements'
            Run3_ToeMovement = [Run3_ToeMovement; Run3_onsetTimes.onset(i,:) Run3_onsetTimes.duration(i,:)];
        end
    end

    Run4_onsetTimes = tdfread(['sub-' subject '_ses-1_task-motor_run-04_events.tsv'], '\t');
    Run4_onsetTimes.trial_type = string(Run4_onsetTimes.trial_type);

    Run4_Rest = [];
    Run4_ArmMovement = [];
    Run4_LegMovement = [];
    Run4_MouthMovement = [];
    Run4_EyeMovement = [];
    Run4_FingerMovement = [];
    Run4_WristMovement = [];
    Run4_AnkleMovement = [];
    Run4_ToeMovement = [];

    for i = 1:length(Run4_onsetTimes.onset)
        if strtrim(Run4_onsetTimes.trial_type(i,:)) == 'Rest'
            Run4_Rest = [Run4_Rest; Run4_onsetTimes.onset(i,:) Run4_onsetTimes.duration(i,:)];

        elseif strtrim(Run4_onsetTimes.trial_type(i,:)) == 'Upper arm movements'
            Run4_ArmMovement = [Run4_ArmMovement; Run4_onsetTimes.onset(i,:) Run4_onsetTimes.duration(i,:)];
        elseif strtrim(Run4_onsetTimes.trial_type(i,:)) == 'Forearm movements'
            Run4_ArmMovement = [Run4_ArmMovement; Run4_onsetTimes.onset(i,:) Run4_onsetTimes.duration(i,:)];

        elseif strtrim(Run4_onsetTimes.trial_type(i,:)) == 'Left leg movements'
            Run4_LegMovement = [Run4_LegMovement; Run4_onsetTimes.onset(i,:) Run4_onsetTimes.duration(i,:)];
        elseif strtrim(Run4_onsetTimes.trial_type(i,:)) == 'Right leg movements'
            Run4_LegMovement = [Run4_LegMovement; Run4_onsetTimes.onset(i,:) Run4_onsetTimes.duration(i,:)];

        elseif strtrim(Run4_onsetTimes.trial_type(i,:)) == 'Jaw movements'
            Run4_MouthMovement = [Run4_MouthMovement; Run4_onsetTimes.onset(i,:) Run4_onsetTimes.duration(i,:)];
        elseif strtrim(Run4_onsetTimes.trial_type(i,:)) == 'Tongue movements'
            Run4_MouthMovement = [Run4_MouthMovement; Run4_onsetTimes.onset(i,:) Run4_onsetTimes.duration(i,:)];
        elseif strtrim(Run4_onsetTimes.trial_type(i,:)) == 'Lip movements'
            Run4_MouthMovement = [Run4_MouthMovement; Run4_onsetTimes.onset(i,:) Run4_onsetTimes.duration(i,:)];

        elseif strtrim(Run4_onsetTimes.trial_type(i,:)) == 'Eye movements'
            Run4_EyeMovement = [Run4_EyeMovement; Run4_onsetTimes.onset(i,:) Run4_onsetTimes.duration(i,:)];

        elseif strtrim(Run4_onsetTimes.trial_type(i,:)) == 'Finger movements'
            Run4_FingerMovement = [Run4_FingerMovement; Run4_onsetTimes.onset(i,:) Run4_onsetTimes.duration(i,:)];

        elseif strtrim(Run4_onsetTimes.trial_type(i,:)) == 'Wrist movements'
            Run4_WristMovement = [Run4_WristMovement; Run4_onsetTimes.onset(i,:) Run4_onsetTimes.duration(i,:)];

        elseif strtrim(Run4_onsetTimes.trial_type(i,:)) == 'Ankle movements'
            Run4_AnkleMovement = [Run4_AnkleMovement; Run4_onsetTimes.onset(i,:) Run4_onsetTimes.duration(i,:)];

        elseif strtrim(Run4_onsetTimes.trial_type(i,:)) == 'Toe movements'
            Run4_ToeMovement = [Run4_ToeMovement; Run4_onsetTimes.onset(i,:) Run4_onsetTimes.duration(i,:)];
        end
    end

    Run5_onsetTimes = tdfread(['sub-' subject '_ses-1_task-motor_run-05_events.tsv'], '\t');
    Run5_onsetTimes.trial_type = string(Run5_onsetTimes.trial_type);

    Run5_Rest = [];
    Run5_ArmMovement = [];
    Run5_LegMovement = [];
    Run5_MouthMovement = [];
    Run5_EyeMovement = [];
    Run5_FingerMovement = [];
    Run5_WristMovement = [];
    Run5_AnkleMovement = [];
    Run5_ToeMovement = [];

    for i = 1:length(Run5_onsetTimes.onset)
        if strtrim(Run5_onsetTimes.trial_type(i,:)) == 'Rest'
            Run5_Rest = [Run5_Rest; Run5_onsetTimes.onset(i,:) Run5_onsetTimes.duration(i,:)];

        elseif strtrim(Run5_onsetTimes.trial_type(i,:)) == 'Upper arm movements'
            Run5_ArmMovement = [Run5_ArmMovement; Run5_onsetTimes.onset(i,:) Run5_onsetTimes.duration(i,:)];
        elseif strtrim(Run5_onsetTimes.trial_type(i,:)) == 'Forearm movements'
            Run5_ArmMovement = [Run5_ArmMovement; Run5_onsetTimes.onset(i,:) Run5_onsetTimes.duration(i,:)];

        elseif strtrim(Run5_onsetTimes.trial_type(i,:)) == 'Left leg movements'
            Run5_LegMovement = [Run5_LegMovement; Run5_onsetTimes.onset(i,:) Run5_onsetTimes.duration(i,:)];
        elseif strtrim(Run5_onsetTimes.trial_type(i,:)) == 'Right leg movements'
            Run5_LegMovement = [Run5_LegMovement; Run5_onsetTimes.onset(i,:) Run5_onsetTimes.duration(i,:)];

        elseif strtrim(Run5_onsetTimes.trial_type(i,:)) == 'Jaw movements'
            Run5_MouthMovement = [Run5_MouthMovement; Run5_onsetTimes.onset(i,:) Run5_onsetTimes.duration(i,:)];
        elseif strtrim(Run5_onsetTimes.trial_type(i,:)) == 'Tongue movements'
            Run5_MouthMovement = [Run5_MouthMovement; Run5_onsetTimes.onset(i,:) Run5_onsetTimes.duration(i,:)];
        elseif strtrim(Run5_onsetTimes.trial_type(i,:)) == 'Lip movements'
            Run5_MouthMovement = [Run5_MouthMovement; Run5_onsetTimes.onset(i,:) Run5_onsetTimes.duration(i,:)];

        elseif strtrim(Run5_onsetTimes.trial_type(i,:)) == 'Eye movements'
            Run5_EyeMovement = [Run5_EyeMovement; Run5_onsetTimes.onset(i,:) Run5_onsetTimes.duration(i,:)];

        elseif strtrim(Run5_onsetTimes.trial_type(i,:)) == 'Finger movements'
            Run5_FingerMovement = [Run5_FingerMovement; Run5_onsetTimes.onset(i,:) Run5_onsetTimes.duration(i,:)];

        elseif strtrim(Run5_onsetTimes.trial_type(i,:)) == 'Wrist movements'
            Run5_WristMovement = [Run5_WristMovement; Run5_onsetTimes.onset(i,:) Run5_onsetTimes.duration(i,:)];

        elseif strtrim(Run5_onsetTimes.trial_type(i,:)) == 'Ankle movements'
            Run5_AnkleMovement = [Run5_AnkleMovement; Run5_onsetTimes.onset(i,:) Run5_onsetTimes.duration(i,:)];

        elseif strtrim(Run5_onsetTimes.trial_type(i,:)) == 'Toe movements'
            Run5_ToeMovement = [Run5_ToeMovement; Run5_onsetTimes.onset(i,:) Run5_onsetTimes.duration(i,:)];
        end
    end

    Run6_onsetTimes = tdfread(['sub-' subject '_ses-1_task-motor_run-06_events.tsv'], '\t');
    Run6_onsetTimes.trial_type = string(Run6_onsetTimes.trial_type);

    Run6_Rest = [];
    Run6_ArmMovement = [];
    Run6_LegMovement = [];
    Run6_MouthMovement = [];
    Run6_EyeMovement = [];
    Run6_FingerMovement = [];
    Run6_WristMovement = [];
    Run6_AnkleMovement = [];
    Run6_ToeMovement = [];

    for i = 1:length(Run6_onsetTimes.onset)
        if strtrim(Run6_onsetTimes.trial_type(i,:)) == 'Rest'
            Run6_Rest = [Run6_Rest; Run6_onsetTimes.onset(i,:) Run6_onsetTimes.duration(i,:)];

        elseif strtrim(Run6_onsetTimes.trial_type(i,:)) == 'Upper arm movements'
            Run6_ArmMovement = [Run6_ArmMovement; Run6_onsetTimes.onset(i,:) Run6_onsetTimes.duration(i,:)];
        elseif strtrim(Run6_onsetTimes.trial_type(i,:)) == 'Forearm movements'
            Run6_ArmMovement = [Run6_ArmMovement; Run6_onsetTimes.onset(i,:) Run6_onsetTimes.duration(i,:)];

        elseif strtrim(Run6_onsetTimes.trial_type(i,:)) == 'Left leg movements'
            Run6_LegMovement = [Run6_LegMovement; Run6_onsetTimes.onset(i,:) Run6_onsetTimes.duration(i,:)];
        elseif strtrim(Run6_onsetTimes.trial_type(i,:)) == 'Right leg movements'
            Run6_LegMovement = [Run6_LegMovement; Run6_onsetTimes.onset(i,:) Run6_onsetTimes.duration(i,:)];

        elseif strtrim(Run6_onsetTimes.trial_type(i,:)) == 'Jaw movements'
            Run6_MouthMovement = [Run6_MouthMovement; Run6_onsetTimes.onset(i,:) Run6_onsetTimes.duration(i,:)];
        elseif strtrim(Run6_onsetTimes.trial_type(i,:)) == 'Tongue movements'
            Run6_MouthMovement = [Run6_MouthMovement; Run6_onsetTimes.onset(i,:) Run6_onsetTimes.duration(i,:)];
        elseif strtrim(Run6_onsetTimes.trial_type(i,:)) == 'Lip movements'
            Run6_MouthMovement = [Run6_MouthMovement; Run6_onsetTimes.onset(i,:) Run6_onsetTimes.duration(i,:)];

        elseif strtrim(Run6_onsetTimes.trial_type(i,:)) == 'Eye movements'
            Run6_EyeMovement = [Run6_EyeMovement; Run6_onsetTimes.onset(i,:) Run6_onsetTimes.duration(i,:)];

        elseif strtrim(Run6_onsetTimes.trial_type(i,:)) == 'Finger movements'
            Run6_FingerMovement = [Run6_FingerMovement; Run6_onsetTimes.onset(i,:) Run6_onsetTimes.duration(i,:)];

        elseif strtrim(Run6_onsetTimes.trial_type(i,:)) == 'Wrist movements'
            Run6_WristMovement = [Run6_WristMovement; Run6_onsetTimes.onset(i,:) Run6_onsetTimes.duration(i,:)];

        elseif strtrim(Run6_onsetTimes.trial_type(i,:)) == 'Ankle movements'
            Run6_AnkleMovement = [Run6_AnkleMovement; Run6_onsetTimes.onset(i,:) Run6_onsetTimes.duration(i,:)];

        elseif strtrim(Run6_onsetTimes.trial_type(i,:)) == 'Toe movements'
            Run6_ToeMovement = [Run6_ToeMovement; Run6_onsetTimes.onset(i,:) Run6_onsetTimes.duration(i,:)];
        end
    end
   
   % Save timing files into text files

    save('Rest_run1.txt', 'Run1_Rest', '-ASCII');
    save('Rest_run2.txt', 'Run2_Rest', '-ASCII');
    save('Rest_run3.txt', 'Run3_Rest', '-ASCII');
    save('Rest_run4.txt', 'Run4_Rest', '-ASCII');
    save('Rest_run5.txt', 'Run5_Rest', '-ASCII');
    save('Rest_run6.txt', 'Run6_Rest', '-ASCII');

    save('ArmMovement_run1.txt', 'Run1_ArmMovement', '-ASCII');
    save('ArmMovement_run2.txt', 'Run2_ArmMovement', '-ASCII');
    save('ArmMovement_run3.txt', 'Run3_ArmMovement', '-ASCII');
    save('ArmMovement_run4.txt', 'Run4_ArmMovement', '-ASCII');
    save('ArmMovement_run5.txt', 'Run5_ArmMovement', '-ASCII');
    save('ArmMovement_run6.txt', 'Run6_ArmMovement', '-ASCII');

    save('LegMovement_run1.txt', 'Run1_LegMovement', '-ASCII');
    save('LegMovement_run2.txt', 'Run2_LegMovement', '-ASCII');
    save('LegMovement_run3.txt', 'Run3_LegMovement', '-ASCII');
    save('LegMovement_run4.txt', 'Run4_LegMovement', '-ASCII');
    save('LegMovement_run5.txt', 'Run5_LegMovement', '-ASCII');
    save('LegMovement_run6.txt', 'Run6_LegMovement', '-ASCII');

    save('MouthMovement_run1.txt', 'Run1_MouthMovement', '-ASCII');
    save('MouthMovement_run2.txt', 'Run2_MouthMovement', '-ASCII');
    save('MouthMovement_run3.txt', 'Run3_MouthMovement', '-ASCII');
    save('MouthMovement_run4.txt', 'Run4_MouthMovement', '-ASCII');
    save('MouthMovement_run5.txt', 'Run5_MouthMovement', '-ASCII');
    save('MouthMovement_run6.txt', 'Run6_MouthMovement', '-ASCII');

    save('EyeMovement_run1.txt', 'Run1_EyeMovement', '-ASCII');
    save('EyeMovement_run2.txt', 'Run2_EyeMovement', '-ASCII');
    save('EyeMovement_run3.txt', 'Run3_EyeMovement', '-ASCII');
    save('EyeMovement_run4.txt', 'Run4_EyeMovement', '-ASCII');
    save('EyeMovement_run5.txt', 'Run5_EyeMovement', '-ASCII');
    save('EyeMovement_run6.txt', 'Run6_EyeMovement', '-ASCII');

    save('FingerMovement_run1.txt', 'Run1_FingerMovement', '-ASCII');
    save('FingerMovement_run2.txt', 'Run2_FingerMovement', '-ASCII');
    save('FingerMovement_run3.txt', 'Run3_FingerMovement', '-ASCII');
    save('FingerMovement_run4.txt', 'Run4_FingerMovement', '-ASCII');
    save('FingerMovement_run5.txt', 'Run5_FingerMovement', '-ASCII');
    save('FingerMovement_run6.txt', 'Run6_FingerMovement', '-ASCII');

    save('WristMovement_run1.txt', 'Run1_WristMovement', '-ASCII');
    save('WristMovement_run2.txt', 'Run2_WristMovement', '-ASCII');
    save('WristMovement_run3.txt', 'Run3_WristMovement', '-ASCII');
    save('WristMovement_run4.txt', 'Run4_WristMovement', '-ASCII');
    save('WristMovement_run5.txt', 'Run5_WristMovement', '-ASCII');
    save('WristMovement_run6.txt', 'Run6_WristMovement', '-ASCII');

    save('AnkleMovement_run1.txt', 'Run1_AnkleMovement', '-ASCII');
    save('AnkleMovement_run2.txt', 'Run2_AnkleMovement', '-ASCII');
    save('AnkleMovement_run3.txt', 'Run3_AnkleMovement', '-ASCII');
    save('AnkleMovement_run4.txt', 'Run4_AnkleMovement', '-ASCII');
    save('AnkleMovement_run5.txt', 'Run5_AnkleMovement', '-ASCII');
    save('AnkleMovement_run6.txt', 'Run6_AnkleMovement', '-ASCII');

    save('ToeMovement_run1.txt', 'Run1_ToeMovement', '-ASCII');
    save('ToeMovement_run2.txt', 'Run2_ToeMovement', '-ASCII');
    save('ToeMovement_run3.txt', 'Run3_ToeMovement', '-ASCII');
    save('ToeMovement_run4.txt', 'Run4_ToeMovement', '-ASCII');
    save('ToeMovement_run5.txt', 'Run5_ToeMovement', '-ASCII');
    save('ToeMovement_run6.txt', 'Run6_ToeMovement', '-ASCII');
    
    % go to previous directory (the directory that contains all of your subjects)
    cd ../

end
