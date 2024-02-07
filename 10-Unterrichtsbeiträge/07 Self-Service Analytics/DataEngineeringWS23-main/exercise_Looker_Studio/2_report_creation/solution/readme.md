## create report solution

#### Solution

  1. Create a new Report
       1. Log into [Google Looker Studio](https://lookerstudio.google.com/).
        > signed into google account
       2. Create a new report and select the data source that was prepared in exercise `../1_data_setup`.
           > Click on "Create" and select "Report" in [Google Looker Studio](https://lookerstudio.google.com/)
           > 
           > a new report is shown in the Google Looker Studio [Report Menu](https://lookerstudio.google.com/navigation/reporting)
       3. Adjust the auto-generated table to show the lego set theme its count of lego sets.
           > Add the dimension "themes" and the metric "Record Count" or "set_count" to the table
  2. Add "control" widgets.
       1. Add a "drop-down list" that allows you to choose the lego theme.
           > Click on "Add a control", select "drop-down list" and place it on the grid. Make sure "theme" is the added Control Field
       2. Add a "Slider" to select a range of the lego set retail price.
           > Click on "Add a control", select "Slider" and place it on the grid. Make sure the conrol field is set to the dimension representing the retail price
       3. Which lego themes have lego sets that cost more than 450$?
           > Set the slider from 450 to max. The table will now list all themes that have lego sets that cost more than 450$
           >
           > "Star wars, Serious Play, Icons, Harry Potter, Technic, Marvel Super Heroes"
  3. Add "chart" widgets.
       1. Add two "scorecards". One that displays the average price per piece and one that shows the average count of lego pieces in a lego set
           > Click on "Add a chart", select "scorecard" and place it on the grid. Make sure the metric is set to "average" and to the "price_per_piece" field
       2. What is the average price per piece for lego sets with the theme "star wars"
           > Select "star wars" in the drop down list control widget. read the result of the price per piece scorecard
           >
           > "0,13" 
       3. Add a "time series chart" that shows the lego themes released over the years.
           > Click on "Add a chart", select "time series chart" and place it on the grid. Make sure the dimension is set to your formatted year field, breakdown dimension is set to "theme" and the metric is set to "Record Count" or "Set Count"
        4. In which year were the most Lego Technic sets launched on the market? In which year did Lego Star Wars release more sets than Lego Technic
            > use the drop down list control and select the theme "technic". You can deduce the year from the time series chart.
            >
            > Most Lego Technis Sets -> "1999"
            >
            > More Lego Star Wars Sets than Lego Technic -> "2001"
        5. Add a "table" that gives you information about:
            - lego set id
            - lego set name
            - lego theme
            - lego theme group
            - lego mini figure count
            - lego pieces
            - retail price
            - price_per_piece
            - year

            > Click on "Add a chart", select "table" and place it on the grid. Make sure it includes following dimensions:
            > - set_id
            > - name
            > - theme
            > - theme Group
            > - minifigs
            > - pieces
            > - retail_price
            > - retail_per_price
            > - year

#### Links to a possible solution:

Example of a report after exercise 3.5: [link to shared resource](https://lookerstudio.google.com/reporting/bd3ca623-7501-42e3-9d8e-1501228a6988)
