
# Setup
There are multiple ways to have a "clean" Python installation. Basically you can
1. Install Python on your local machine
2. Run Python in a Docker container
3. Run Python on a (remote) virtual machine (VM)

This semester, without any specific reason, we will proceed with Option #1, i.e., we will install Python on our local machine.

## Option 1: Install Python on you local machine
1. Install Visual Studio Code from [here](https://code.visualstudio.com/).
2. **Install Python from [here](https://www.python.org/).**
    - Windows:
        1. Do not add Python to PATH
        2. Create a folder on your local machine where you install the selected version of Python (e.g., "C:\Users\F.Kellner\pyver\py_031008")
        3. Opt for Custom Installation and install Python to this folder.
        4. Create a folder for your project.
        5. In this folder, set up a Virtual Environment (venv) [Instructions](https://docs.python.org/3/library/venv.html).
            - \your\python\path\python -m venv venv
            - e.g., "C:\Users\admin\pyver\py383\python -m venv venv"
        6. Activate the virtual environment
            - e.g., Windows: venv\Scripts\activate
            - e.g., Mac/Linux: source venv/bin/activate
        7. Optional: Deactivate the virtual environment: deactivate
    - Mac (see also [here](https://www.youtube.com/watch?v=31WU0Dhw4sk))
        1. Install [Homebrew](https://brew.sh/)
        2. Then, type: brew update, brew install pyenv
        3. Install the Python version desired: pyenv install 3.9.7 (for instance)
        4. Create a folder for your project
        5. In this folder, type
            - pyenv local 3.9.7
            - python3 -m venv venv
        6. Active your venv: source .venv/bin/activate


## Option 2: Run Python in a Docker container
1. Install Visual Studio Code from [here](https://code.visualstudio.com/).
2. **Follow the instructions presented in [this video](https://www.youtube.com/watch?v=3JU7Pjwk4s0).**
3. Create a folder for your project.
4. In this folder, set up a Virtual Environment (venv) [Instructions](https://docs.python.org/3/library/venv.html).
5. Activate the virtual environment: source venv/bin/activate
6. Optional: Deactivate the virtual environment: deactivate

# Exercise 1: Loading Data
## Loading Data from PostgreSQL
Install the required packages. When doing this, make sure that you are in the virtual environment.

    pip install psycopg2
    pip install SQLAlchemy
    pip install pandas

Then, try to understand [this source code](<./01 Load Data.py>).

## Loading Data from Other sources
### CSV

    plant = pd.read_csv('../thro_shpm_csv/plant.csv', sep=';', encoding='latin1')
    plant

### Text File

    f = open("demofile.txt", "r")
    print(f.read())

    content = read_file("demofile.txt")
    content

### JSON

    import json
  
    f = open('data.json')    
    data = json.load(f)
    
    for i in data['emp_details']:
        print(i)
    
    f.close()


    df = pd.read_json('data.json')
    print(df.to_string()) 

# Exercise 2: Python (without Pandas)
Python has the following data types built-in by default, in these categories:

| Parameter         | Value                         |
| --------          | -------                       |
| Text Type         | str                           |
| Numeric Types     | int, float, complex           |
| Sequence Types    | list, tuple, range            |
| Mapping Type      | dict                          |
| Set Types         | set, frozenset                |
| Boolean Type      | bool                          |
| Binary Types      | bytes, bytearray, memoryview  |
| None Type         | NoneType                      |

And here some examples:

| Example	                                        | Data Type	|
| --------	                                        | --------	| 
| x = "Hello World"	                                | str	    | 
| x = 20	                                        | int	    | 
| x = 20.5	                                        | float	    | 
| x = 1j	                                        | complex	| 
| x = ["apple", "banana", "cherry"]	                | list	    | 
| x = ("apple", "banana", "cherry")	                | tuple	    | 
| x = range(6)	                                    | range	    | 
| x = {"name" : "John", "age" : 36}	                | dict	    | 
| x = {"apple", "banana", "cherry"}	                | set	    | 
| x = frozenset({"apple", "banana", "cherry"})      | frozenset | 	
| x = True	                                        | bool	    | 
| x = b"Hello"	                                    | bytes	    | 
| x = bytearray(5)	                                | bytearray | 	
| x = memoryview(bytes(5))	                        | memoryview| 	
| x = None	                                        | NoneType  | 


Try [these code snippets](<./02 Python Basics.py>).


# Exercise 3: Python with Pandas
## Series
A Pandas Series is like a column in a table. It is a one-dimensional array holding data of any type.

    import pandas as pd

    a = [1, 7, 2]
    myvar = pd.Series(a)    
    print(myvar)
    print(myvar[0])

    a = [1, 7, 2]
    myvar = pd.Series(a, index = ["x", "y", "z"])
    print(myvar)
    print(myvar["y"])

    calories = {"day1": 420, "day2": 380, "day3": 390}
    myvar = pd.Series(calories, index = ["day1", "day2"])
    print(myvar)

## DataFrames
A Pandas DataFrame is a 2 dimensional data structure, like a 2 dimensional array, or a table with rows and columns. Series is like a column, a DataFrame is the whole table.

    import pandas as pd

    data = {
    "calories": [420, 380, 390],
    "duration": [50, 40, 45]
    }

    df = pd.DataFrame(data)
    print(df)
    print(df.loc[0])
    print(df.loc[[0, 1]])

    data = {
    "calories": [420, 380, 390],
    "duration": [50, 40, 45]
    }
    df = pd.DataFrame(data, index = ["day1", "day2", "day3"])
    print(df.loc["day2"])

print(df)

## Analyzing and Cleaning Data
### Analysis

    df.head(10)
    df.tail()
    df.info()
    df.describe()

### Cleaning Data
Load the dataset called **datacleaning.txt**.

    import pandas as pd
    df = pd.read_csv('datacleaning.txt')

#### Cleaning Empty Cells
##### Remove Rows

    new_df = df.dropna()
    print(new_df.to_string())

By default, the dropna() method returns a new DataFrame, and will not change the original. If you want to change the original DataFrame, use the inplace = True argument:

    df.dropna(inplace = True)
    print(df.to_string())

##### Replace Empty Values

    df.fillna(130, inplace = True)
    df["Calories"].fillna(130, inplace = True)
    ---
    x = df["Calories"].mean()
    df["Calories"].fillna(x, inplace = True)
    ---
    x = df["Calories"].median()
    df["Calories"].fillna(x, inplace = True)
    ---
    x = df["Calories"].mode()[0]
    df["Calories"].fillna(x, inplace = True)

#### Data of Wrong Format

    df['Date'] = pd.to_datetime(df['Date'])
    print(df.to_string())
    ---
    df.dropna(subset=['Date'], inplace = True)

#### Wrong Data

    df.loc[7, 'Duration'] = 45
    ===
    for x in df.index:
        if df.loc[x, "Duration"] > 120:
            df.loc[x, "Duration"] = 120
    ===
    for x in df.index:
        if df.loc[x, "Duration"] > 120:
            df.drop(x, inplace = True)

#### Removing Duplicates

    print(df.duplicated())
    ===
    df.drop_duplicates(inplace = True)

## Plotting

    import pandas as pd
    import matplotlib.pyplot as plt

    df.plot()
    plt.show()
    ===
    df.plot(kind = 'scatter', x = 'Duration', y = 'Calories')
    plt.show()
    ===
    df.plot(kind = 'scatter', x = 'Duration', y = 'Maxpulse')
    plt.show()
    ===
    df["Duration"].plot(kind = 'hist')


Try [these code snippets](<./03 Pandas.py>).

# References
- [Develop Python in Docker](https://www.youtube.com/watch?v=3JU7Pjwk4s0)
- [Python Tutorial](https://www.w3schools.com/python/default.asp)
