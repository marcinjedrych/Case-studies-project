This folder contains the code to reproduce our analysis with Nilearn.

1.) 1st level analysis.py:

  In this script we created a design matrix for the first participant. After also defining the contrasts, we made a first       level model.

2.) 2nd level analysis (Ankle condition).py:
 
   In this script the first-level analysis was put in a function. In this way we could iterate trough the participants, and      store individual contrast maps in a list. Based on these contrast maps we made a second level    model.

3.) Nilearn plotting test.py:

  In this script, we tried out some visualization methods 
