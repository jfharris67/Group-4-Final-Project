# Group-4-Final-Project

# Title:  January 2020 Flight Predictions: Flight Delays, Best and Worst Airports and Airlines

# I.	SEGMENT 2 DELIVERABLES:  COMPLETED

## A.	Project Overview 
*Finalize projects idea including what is your dataset, what are the problems you’re solving, and what will be the predictive problem you will solve.

As a collective, Group 4 decided to do the following:

January 2020 Flight Predictions:
1.	Predictive Problem:  Flight Delays for the total flights in January 2020
2.	Determine the Best and Worst Airlines for flight delays
3.	Determine the Best and Worst Airports for flight delays

## B.	Machine Learning Model – First Attempt
*First attempt of a machine learning model, including a confusion matrix and accuracy score

### Classification Model:
•	Logistic Regression Model:
•	Training Accuracy: 93.21%
•	Testing Accuracy: 93.14%
•	Precision (weighted average): 93%
•	Recall (weighted average): 93%
•	F1-Score (weighted average): 93%

### Random Forest Classifier:
•	Training Accuracy: 90.78%
•	Testing Accuracy: 89.69%
•	Precision (weighted average): 90%
•	Recall (weighted average): 90%
•	F1-Score (weighted average): 87%

### Gradient Boosting Classifier:
•	Training Accuracy: 93.21%
•	Testing Accuracy: 93.21%
•	Precision (weighted average): 93%
•	Recall (weighted average): 93%
•	F1-Score (weighted average): 93%

### Best Model for our Project:

It has the highest testing accuracy (93.21%) among the three models, which shows it works well with unseen data. It has a strong balance between precision, recall,
and F1-score, indicating that it performs well across different metrics. 

The model is not only good at identifying true positives but also at minimizing false positives and false negatives, making it the most reliable choice. We believe
this will be the best model for our final project.

### Machine Learning Model Visuals
<img width="468" alt="image" src="https://github.com/jfharris67/Group-4-Final-Project/assets/114943747/6dc1741c-b237-4832-acd4-c68df4dbc3b7">

<img width="468" alt="image" src="https://github.com/jfharris67/Group-4-Final-Project/assets/114943747/61bd90b4-ecc9-42b3-8569-65faaebee7bb">

<img width="468" alt="image" src="https://github.com/jfharris67/Group-4-Final-Project/assets/114943747/795f797a-c364-4726-adc4-bcdfa7719552">

<img width="468" alt="image" src="https://github.com/jfharris67/Group-4-Final-Project/assets/114943747/8c09d6e6-9a46-40ab-9d37-546c90ff5d8e">


## C.	Visualization Board - First Attempt
*First attempt of a working dashboard

### 1.	Working Tableau dashboard link:
https://public.tableau.com/app/profile/kennan.foust/viz/ProjectTableau_16832615644700/Dashboard1?publish=yes

### 2.	Tableau Dashboard - Draft 1:
<img width="468" alt="image" src="https://github.com/jfharris67/Group-4-Final-Project/assets/114943747/13b4651f-4f19-4cdf-af47-63963931df60">

## D.	Database 
*Database that stores data for the project (if applicable)

### 1.	The database was setup using AWS.  
Link to database is below:
http://flightdelay.cqtoprenvzmu.us-east-2.rds.amazonaws.com

### 2.	ER Diagrams were created using Quick DBD (pictured below)

<img width="403" alt="image" src="https://github.com/jfharris67/Group-4-Final-Project/assets/114943747/4d120c00-ea21-4fa0-bb87-e1642fd07314">

### 3.	PgAdmin – (screen shot pictured below)

<img width="257" alt="image" src="https://github.com/jfharris67/Group-4-Final-Project/assets/114943747/0c889988-b842-4a73-a521-8068c479f4e9">

### 4.  Flight Delay Database Query Tables:

### Table 1:
CREATE TABLE Flights (
    DAY_OF_MONTH int,
    DAY_OF_WEEK int,
    OP_UNIQUE_CARRIER varchar,
    OP_CARRIER_AIRLINE_ID int,
    OP_CARRIER varchar,
    TAIL_NUM varchar,
    OP_CARRIER_FL_NUM int,
    ORIGIN_AIRPORT_ID int,
    ORIGIN_AIRPORT_SEQ_ID int,
    ORIGIN varchar,
    DEST_AIRPORT_ID int,
    DEST_AIRPORT_SEQ_ID int,
    DEST varchar,
    DEP_TIME float,
    DEP_DEL15 float,
    DEP_TIME_BLK varchar,
    ARR_TIME float,
    ARR_DEL15 float,
    CANCELLED float,
    DIVERTED float,
    DISTANCE float
);

### Table 2:
CREATE TABLE Arrival_Airports (
    airport varchar PRIMARY KEY,
    airport_name varchar
    );

### Table 3:
CREATE TABLE Departure_Airports (
    airport varchar PRIMARY KEY,
    airport_name varchar
    );

### Table 4:
CREATE TABLE Airlines (
    carrier varchar PRIMARY KEY,
    carrier_name varchar
    );

### Foreign Key Constraints:
ALTER TABLE Flights
ADD FOREIGN KEY (DEST) REFERENCES Arrival_Airports(airport);ALTER TABLE Flights
ADD FOREIGN KEY (ORIGIN) REFERENCES Departure_Airports(airport);ALTER TABLE Flights
ADD FOREIGN KEY (OP_UNIQUE_CARRIER) REFERENCES Airlines(carrier);

## E.	E.	Group 4 Presentation – Draft
*Draft of presentation 

### 1.	Link to PowerPoint presentation flie is in the main branch.  

File title is "Group 4 Final Project Draft 1"

#### PLEASE NOTE:  The PowerPoint file was too big to download and will have to be downloaded in order to view.


