This folder contains all code needed to reproduce our SPM analysis on the dataset:

First, we did some additional preprocessing on the original fmriprep data. We were not able to upload the preprocessed data because data files were too large. However, one can reproduce the preprocessing analyses using the following codes in the right order:
1) Corigster
2) Segment
3) Normalize

Secondly, we performed a first level analysis using the code in the 'First Level Analysis' folder. The contrasts that were created using this analysis, are uploaded in the subfolder 'Results' within the 'First Level Analysis' folder.

Lastly, we did a second level analysis using the code in the 'Second Level Analysis' folder. Also here, results of this analysis are uploaded in the subfolder 'Results' in the 'Second Level Analysis' folder.

The results of the second level analysis were visualized using the MRIcroGL tool which can be downloaded here: https://www.nitrc.org/projects/mricrogl.
