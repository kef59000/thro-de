## report creation
In this exercise you will create a new report in Google Looker Studio and use it to answer questions on the underlying data.

!["alt"](../../materials/screenshot/ExerciseOverview.jpg)

Looking at the exercise overview, this exercise section will focus on Data Visualisation.

#### Exercise
   1. Create a new Report
      1. Log into [Google Looker Studio](https://lookerstudio.google.com/).
      1. Create a new report and select the data source that was prepared in exercise `../1_data_setup`.
      2. Adjust the auto-generated table to show the lego set theme its count of lego sets.
   2. Add "control" widgets.
      1. Add a "drop-down list" that allows you to choose the lego theme.
      2. Add a "Slider" to select a range of the lego set retail price.
      1. Which lego themes have lego sets that cost more than 450$?
   3. Add "chart" widgets.
      1. Add two "scorecards". One that displays the average price per piece and one that shows the average count of lego pieces in a lego set
      2. What is the average price per piece for lego sets with the theme "star wars"
      3. Add a "time series chart" that shows the lego themes released over the years.
      4. In which year were the most Lego Technic sets launched on the market? In which year did Lego Star Wars release more sets than Lego Technic
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
