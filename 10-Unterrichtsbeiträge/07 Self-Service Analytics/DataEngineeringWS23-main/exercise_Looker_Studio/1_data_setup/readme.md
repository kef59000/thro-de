## data setup
In this exercise you will create a new data source in Google Looker Studio and adjust its data model.

!["alt"](../../materials/screenshot/ExerciseOverview.jpg)

Looking at the exercise overview, this exercise section will focus on the Data Connector and Data Modelling.

#### Exercise

  1. Add a new data source.
     1. Log into [Google Looker Studio](https://lookerstudio.google.com/).
     2. Create a new data source, find a connector that is suitable to import the csv files and use it on the testdata located in `.testdata/lego_sets_1970_onwards.csv`.
     3. Which connector did you use? Look up how the connector works and briefly describe it.
  2. Adjust the data model.
     1. Open the newly generated data source in the [data source window](https://lookerstudio.google.com/navigation/datasources) and give the listed dimensions a suitable type.
     2. Rename dimension names that can be misleading for people accessing your report.
     3. Add an new field that gives you the price per lego piece.
     4. Add a new field that formats the date into date format.