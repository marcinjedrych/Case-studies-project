This folder contains the code needed to reproduce our analysis with Nilearn.

-1st level analysis:

  In this script we created a design matrix for the first participant. After defining the contrasts, we made a first level       model.

-2nd level analysis (Ankle condition):
 
   In this script the first-level analysis was put in a function. In this way we could iterate trough the participants, and      store individual contrast maps in a list. Based on these contrast maps we made a second level model.

-Nilearn plotting test.py:

  In this script, we tried out some visualization methods 
