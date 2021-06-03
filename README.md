# Personal Contact, Individuation, and the Better-Than-Average Effect

This repo contains both a [soSciSurvey](https://www.soscisurvey.de/) export and a R analysis script to demonstrate the studies done in the paper [Personal Contact, Individuation, and the Better-Than-Average Effect](https://www.researchgate.net/publication/232581252_Personal_Contact_Individuation_and_the_Better-Than-Average_Effect) by Alicke et al. (1995) in a classroom setting.


The items were translated to German, but the original items from the paper are still availabe in the R script, so you can replace those in the survey if you wish to use this in an english speaking class.

Note that the items related to contracting cancer and attempting suicicde were removed from the negative life events list, as we figured this would be an unecessary source of distress in a classroom setting. Additionally, the [-10;10] scale of the live event questionaire was simplified to a [1;9] scale.


This survey was intended for a teaching session using [Zoom](https://zoom.us/), but can be adjusted for other video chat programs and live lectures.


## Instructions

### Importing the study into soSciSurvey

After creating your project on [soSci](https://www.soscisurvey.de/), go into `Project Settings` > `Import Project or Questions` and upload the `project.xml` file. 


### Conducting the experiment

Instruct the students that this is a study concerned with how individuals compare themselves to others. Inform them that they are free to and that their answers are confidential and cannot be traced back to them. Next, instruct the students that they are not supposed to talk to each other during the experiment.

Split the class into two groups:

* One group that has to compare themselves to the average college student. This group gets put into a big breakout session containing all students of that group. Send them this link : `https://www.soscisurvey.de/YOURSURVEYNAME/?g=1`
* One group that has to compare themselves to another person. This group gets split into seperate breakout sessions, each containing two students. Send them this link: `https://www.soscisurvey.de/YOURSURVEYNAME`


Now wait for all students to finish taking the presented survey.

### Analysing the data and presenting the results

Download the data from soSci with the below settings:

Rename the file to `data.csv`, place it in the same folder as the analysis script and run the analysis in R Studio.

## Authors
* Adrian Steffan [adriansteffan](https://github.com/adriansteffan) [website](https://adriansteffan.com/)
