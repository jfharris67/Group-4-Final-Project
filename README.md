# Group-4-Final-Project

# PRESENTATION TOPIC

# January 2020 Flight Delay Analysis:  Flight Delays, Best and Worst Airlines and Airports

## A.	Project Overview
1.	Predictive Problem:  Predict the arrival of flight delays with real world data
2.	Determine the Best and Worst Airlines for flight delay arrivals and departures
3.	Determine the Best and Worst Airports for flight delay arrivals and departures

## B.	Why we chose this topic?
1.	We thought the topic would be interesting.
2.	Flight delays are prevalent and a hot topic in all news cycles.
3.	The purpose of this project is to use exploratory data analysis and to build machine learning models to predict flight delay arrivals for airlines and airports in the United States.
4.	A flight is considered delayed if it arrived at (or departed) the gate 15 minutes or more after the scheduled arrival (or departure) time as reflected in the airline carriers’ Computerized Reservation System.
5.	We wanted to share our results and provide top 10 lists of the Best and Worst Airlines and Airports for flight delay arrivals and departures.

## C.	Data Exploration Phase of Project

### *Purpose:  To build machine learning models to predict flight delay arrivals for airlines and airports in the United States.

### Step 1:  Dataset
•	Found a dataset on Kaggle.com titled, “January Flight Delay Prediction.”  There were two sets of data for January 2019 and January 2020 flight delays and we used the January 2020 dataset.

### Step 2:	  Database
•	A database was setup using AWS
•	ER Diagrams were created using Quick DBD (picture below)
•	PgAdmin – Postgress SQL Database Management tool (screen shot below)
•	Created Flight Delay Database Query Tables (listed below)

#### ER Diagrams
![image](https://github.com/jfharris67/Group-4-Final-Project/assets/114943747/c9dadf3d-a457-494c-a28b-305bfaf930a1)

#### PgAdmin
![image](https://github.com/jfharris67/Group-4-Final-Project/assets/114943747/46076eda-ae6c-401b-8f69-8a9522df8839)

#### Flight Delay Database Query Tables

##### Table 1: 
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

##### Table 2:
CREATE TABLE Arrival_Airports (
    airport varchar PRIMARY KEY,
    airport_name varchar
);

##### Table 3:
CREATE TABLE Departure_Airports (
    airport varchar PRIMARY KEY,
    airport_name varchar
);

##### Table 4:
CREATE TABLE Airlines (
    carrier varchar PRIMARY KEY,
    carrier_name varchar
);

##### The Foreign Key Constraints:
ALTER TABLE Flights
ADD FOREIGN KEY (DEST) REFERENCES Arrival_Airports(airport);ALTER TABLE Flights
ADD FOREIGN KEY (ORIGIN) REFERENCES Departure_Airports(airport);ALTER TABLE Flights
ADD FOREIGN KEY (OP_UNIQUE_CARRIER) REFERENCES Airlines(carrier);



### Step 3: Machine Learning Model 

#### Classification Model:
•	Logistic Regression Model:
•	Training Accuracy: 93.21%
•	Testing Accuracy: 93.14%
•	Precision (weighted average): 93%
•	Recall (weighted average): 93%
•	F1-Score (weighted average): 93%

#### Random Forest Classifier:
•	Training Accuracy: 90.78%
•	Testing Accuracy: 89.69%
•	Precision (weighted average): 90%
•	Recall (weighted average): 90%
•	F1-Score (weighted average): 87%

#### Gradient Boosting Classifier:
•	Training Accuracy: 93.21%
•	Testing Accuracy: 93.21%
•	Precision (weighted average): 93%
•	Recall (weighted average): 93%
•	F1-Score (weighted average): 93%

#### Best Model for our Project:

It has the highest testing accuracy (93.21%) among the three models, which shows it works well with unseen data. It has a strong balance between precision, recall,
and F1-score, indicating that it performs well across different metrics. 

The model is not only good at identifying true positives but also at minimizing false positives and false negatives, making it the most reliable choice. We believe
this will be the best model for our final project. While our model was very accurate overall, there was a gap between each class (on time and delayed) for the precision, recall, and F1-Score. I believe the model was fine-tuned very well. The issue was a lack of needed features such as weather and other variables that could cause delays. I can say the model predicted delays fairly well, but additional data would have helped thin the gap.

### Machine Learning Model Visuals
<img width="468" alt="image" src="https://github.com/jfharris67/Group-4-Final-Project/assets/114943747/6dc1741c-b237-4832-acd4-c68df4dbc3b7">

<img width="468" alt="image" src="https://github.com/jfharris67/Group-4-Final-Project/assets/114943747/61bd90b4-ecc9-42b3-8569-65faaebee7bb">

<img width="468" alt="image" src="https://github.com/jfharris67/Group-4-Final-Project/assets/114943747/795f797a-c364-4726-adc4-bcdfa7719552">

<img width="468" alt="image" src="https://github.com/jfharris67/Group-4-Final-Project/assets/114943747/8c09d6e6-9a46-40ab-9d37-546c90ff5d8e">

## D.	Technologies, languages, tools and algorithms used throughout the project

•	Python technologies used within the machine learning model:
•	Gradient Boosting Classifier
•	Numpy
•	Panda
•	Skylearn
•	Sqlalchemy
•	Jupyter Notebook
•	Tableau
•	 CSV Editor
•	PgAdmin
•	Quick DBD
•	Canva 
•	PowerPoint
•	Github
•	AWS

## E.	Results of the Analysis

### Analysis of Flight Delays

#### Time of Day
- The hour of departure plays a role in the on time arrival of flights.
- Early AM flights from 4 AM to 9 AM show the best on-time performance. This may be due to less traffic and the fact that severe weather is less likely.
- Late night flights have the highest delay rates. This could be caused by less resources during this time of day and the impact of delays accumulated during the day.

#### Airlines
- The performance of airlines varies greatly.
- Southwest Airlines seems to manage their schedule the best, with the lowest percentage of delayed flights. 
- Airlines like PSA Airlines and Alaska Airlines have a high percentage of delays, potential issues with the way they manage operations, scheduling, or their routes

#### Airports
- The efficiency of airports also contributes to delayed flights.
- Airports, such as Owensboro Daviess County Regional and Quincy Regional-Baldwin Field, effectively manage departures, resulting in no delayed flights. These are small airports, which have less risk of high air traffic volume and less operational challenges.
- Airports like Adak Island, Pago Pago International, and Ogden-Hinckley have very high rate of delayed departures. These airports could be facing challenges such as weather, resources, or logistical problems.

#### Predictive Modeling
- The Gradient Boosting Classifier resulted in strong performance for predicting delays. Precision, recall, and accuracy are high, which shows that the model is reliable and could be useful when used against real world datasets.
- The model is more accurate in predicting on-time flights, it provides reasonable predictions for delayed flights. Further tuning could improve this.
- With the impact of flight delays on passengers and airlines, a model like this could be valuable for improved scheduling, customer satisfaction, and reduced cost by improving delay rates.

### Please find below additional visuals of our analysis results:

![image](https://github.com/jfharris67/Group-4-Final-Project/assets/114943747/ad37679e-2cbb-4c20-a4f2-e61284cad32a)

![image](https://github.com/jfharris67/Group-4-Final-Project/assets/114943747/f7906f25-0774-445c-a1fd-0ac8eca9d680)

![image](https://github.com/jfharris67/Group-4-Final-Project/assets/114943747/c013ed88-c7f9-403d-afbf-d44843c5b430)

![image](https://github.com/jfharris67/Group-4-Final-Project/assets/114943747/98193d27-22d1-44b7-9b2e-9344bc43d6d0)

##### BEST AIRLINES

![image](https://github.com/jfharris67/Group-4-Final-Project/assets/114943747/9b295d63-50f5-4b66-a431-e5096a0e5cba)

##### WORST AIRLINES

![image](https://github.com/jfharris67/Group-4-Final-Project/assets/114943747/f990058d-97ac-4eaf-90e3-9ec7aaef725b)

## F.	Visualization Dashboard
•	Tableau 
•	Working Tableau dashboard link:
https://public.tableau.com/app/profile/kennan.foust/viz/ProjectTableau_16832615644700/Dashboard1?publish=yes

![image](https://github.com/jfharris67/Group-4-Final-Project/assets/114943747/945adf5a-b169-486e-81c7-e96f3f4df98e)

## G.	Future Analysis Recommendations
1.	 Impact of Weather:  If weather data is available, investigate the impact of weather conditions on flight delays.  This would reveal how different weather conditions affect flight punctuality. 
2.	Predicting Flight Cancellations:  Build a model to predict flight cancellations.  This could help passengers and airlines better anticipate and manage cancellations.
3.	Route Analysis:  Analyze specific routes to identify which ones are more prone to delays or cancellations.
4.	Other machine learning models worth considering:
-  Support Vector Machines (SVM)
-  XGBoost – Could be more efficient and perform better than the Gradient Booster Classifier

## H.	What we would have done differently if we had more time?
1.	Present additional data on the best and worst hours for on-time arrivals.
2.	Screen shots of data below

![image](https://github.com/jfharris67/Group-4-Final-Project/assets/114943747/ec438c20-6459-4c0d-b4d4-2d92fdf52907)

![image](https://github.com/jfharris67/Group-4-Final-Project/assets/114943747/add47e2a-8e20-4393-822a-988259d2e8c5)

## I.	PowerPoint Presentation 

### Group 4 FINAL Presentation 
1.	The presentation can be found in the main branch.
2.	File title is “Final Group 4 Presentation”

#### PLEASE NOTE:  The PowerPoint file was too big to download so I saved it as a PDF.


