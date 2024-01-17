## data setup solution

#### Solution

  1. Create a new data source
     1. Log into [Google Looker Studio](https://lookerstudio.google.com/)
        > signed into google account
     2. Add a new data source, find a connector that is suitable to import the csv files and use it on the testdata located in `.testdata/lego_sets_1970_onwards.csv`
        > a new data source can be seen in the [data source window](https://lookerstudio.google.com/navigation/datasources) named "lego_sets_1970_onwards"
     3. Which connector did you use? Look up how the connector works and briefly describe it.
        > used connector: "File Upload" by Google
        > 
        > !["ERROR"](../../../materials/screenshot/Exercise1Solution1.jpg)
        >
        > Uploaded data is stored in Google Cloud Storage as "data set" and accessed as source there. There are many benefits to this including the ability to manage access to your data from the cloud or to easily use other Google Cloud services with your data.
  2. Adjust the data model
     1. Open the newly generated data source in the [data source window](https://lookerstudio.google.com/navigation/datasources) and give the listed dimensions a suitable type.
        > - agerange_min -> Number
        > - minifigs -> Number
        > - pieces -> Number
        > - US_retailPrice -> Number
     2. Rename dimension names that can be misleading for people accessing your report
        > - agerange_min -> min_age
        > - minifigs -> figure_count
        > - year -> unformatted_year
        > - Record Count -> set_count
     3. Add an new field that gives you the price per lego piece
        > - new calculated field "price_per_piece" with formula: 
            >> retail_price/pieces
     4. Add a new field that formats the date into date format
        > - new calculated field "year" with formula: 
            >>YEAR(unformatted_year, "%Y")

#### Links to a possible solution:

- New created data source with the "file upload" connector after exercise 1.3: [link to shared resource](https://lookerstudio.google.com/datasources/5388b609-3d47-437f-95f6-d28462a8f34a)
- Data source after adjustments in the data modelling layer after exercise 2.4: [link to shared resource](https://lookerstudio.google.com/datasources/a2e75544-fbcd-483f-90a3-1599966f0357)
