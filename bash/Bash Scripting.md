
# Setup
Install Docker Desktop on your local machine. Then, run the following code block: 

    docker pull ubuntu
    docker run -it ubuntu bash

Read more [here](./bash_01.sh) # It works!

# Basics
## Basic Commands
In the running container, try the following statements. What are they doing?

| Command    | Description |
| -------- | ------- |
| ps  | Determine your shell type    |
| date | Displays the current date     |
| pwd    | Displays the present working directory    |
| whoami    |     |
| ls    | Lists the contents of the current directory    |
| echo    | Prints a string of text, or value of a variable to the terminal    |

## Shebang
    #!/bin/bash
    which bash
    which $SHELL


# Creating your first bash script
Install the text editor **vim**.

    apt-get update
    apt-get install vim

Create a file named **run_all.sh** using the vim command (basically, you can use any editor of your choice  -e.g., nano).

    apt update
    apt install nano

In your terminal, run the following code:

    vim run_all.sh

---
#!/bin/bash

echo "Today is " \`date`

echo "Enter the path to directory"

read the_path

echo "Your path has the following files and folders: "

ls $the_path

---

    chmod u+x run_all.sh

- chmod modifies the ownership of a file for the current user :u.
- +x adds the execution rights to the current user. This means that the user who is the owner can now run the script.
- run_all.sh is the file we wish to run.

    sh run_all.sh
    bash run_all.sh
    ./run_all.sh


# Bash Scripting Basics
## Comments
    # This is an example comment
    # Both of these lines will be ignored by the interpreter


## Variables and data types in Bash

    username@host:~$ country=Germany
    username@host:~$ echo $country
    Germany
    username@host:~$ new_country=$country
    username@host:~$ echo $new_country
    Germany

## Input and output in Bash scripts
### Gathering input
#### 1. Reading the user input and storing it in a variable
We can read the user input using the **read** command.

    #!/bin/bash
    echo "What's your name"

    read my_name

    echo "Hello" $my_name

#### 2. Reading from a file
This code reads each line from a file named **input.txt** and prints it to the terminal. We'll study while loops later in this article.

    #!/bin/bash
    while read line
    do
        echo $line
    done < input.txt

#### 3. Command line arguments
In a bash script or function, **$1** denotes the initial argument passed, **$2** denotes the second argument passed, and so forth.

This script takes a name as a command-line argument and prints a personalized greeting.

    #!/bin/bash
    echo "Hello, $1!"

### Displaying output
#### 1. Printing to the terminal

    echo "Hello, World!"


#### 2. Writing to a file
This writes the text "This is some text." to a file named output.txt. Note that the >operator overwrites a file if it already has some content.

    echo "This is some text." > output.txt


#### 3. Appending to a file
This appends the text "More text." to the end of the file output.txt.

    echo "More text." >> output.txt


#### 4. Redirecting output
This lists the files in the current directory and writes the output to a file named files.txt. You can redirect output of any command to a file this way.

    ls > files.txt

## Basic Bash commands (echo, read, etc.)

| Command    | Description |
| -------- | ------- |
| cd        | Change the directory to a different location.    |
| ls        | List the contents of the current directory.     |
| mkdir     | Create a new directory.   |
| touch     | Create a new file.    |
| rm        | Remove a file or directory.   |
| cp        | Copy a file or directory.   |
| mv        | Move or rename a file or directory.   |
| echo    | Print text to the terminal.   |
| cat    | Concatenate and print the contents of a file.   |
| grep    | Search for a pattern in a file.   |
| chmod    | Change the permissions of a file or directory.   |
| sudo    | Run a command with administrative privileges.   |
| df    | Display the amount of disk space available.   |
| history    | Show a list of previously executed commands.   |
| ps    | Display information about running processes.   |
| head    | Displays the first rows of a file.   |
| tail    | Displays the last rows of a file.   |


## Conditional statements (if/else)
Expressions that produce a boolean result, either true or false, are called conditions. There are several ways to evaluate conditions, including if, if-else, if-elif-else, and nested conditionals.

Syntax:

    if [[ condition ]];
    then
        statement
    elif [[ condition ]]; then
        statement 
    else
        do this by default
    fi

We can use logical operators such as AND -a and OR -o to make comparisons that have more significance, e.g.,

    if [ $a -gt 60 -a $b -lt 100 ]

Example:

    #!/bin/bash

    echo "Please enter a number: "
    read num

    if [ $num -gt 0 ]; then
        echo "$num is positive"
    elif [ $num -lt 0 ]; then
        echo "$num is negative"
    else
        echo "$num is zero"
    fi

## Looping and Branching in Bash
### While loop

    #!/bin/bash
    i=1
    while [[ $i -le 10 ]] ; do
    echo "$i"
    (( i += 1 ))
    done


### For loop

    #!/bin/bash

    for i in {1..5}
    do
        echo $i
    done

### Case statements
In Bash, case statements are used to compare a given value against a list of patterns and execute a block of code based on the first pattern that matches. The syntax for a case statement in Bash is as follows:

    case expression in
        pattern1)
            # code to execute if expression matches pattern1
            ;;
        pattern2)
            # code to execute if expression matches pattern2
            ;;
        pattern3)
            # code to execute if expression matches pattern3
            ;;
        *)
            # code to execute if none of the above patterns match expression
            ;;
    esac

Here, "expression" is the value that we want to compare, and "pattern1", "pattern2", "pattern3", and so on are the patterns that we want to compare it against.

The double semicolon ";;" separates each block of code to execute for each pattern. The asterisk "*" represents the default case, which executes if none of the specified patterns match the expression.

Example:

    fruit="apple"

    case $fruit in
        "apple")
            echo "This is a red fruit."
            ;;
        "banana")
            echo "This is a yellow fruit."
            ;;
        "orange")
            echo "This is an orange fruit."
            ;;
        *)
            echo "Unknown fruit."
            ;;
    esac

## How to Schedule Scripts using cron
Cron is a powerful utility for job scheduling that is available in Unix-like operating systems. By configuring cron, you can set up automated jobs to run on a daily, weekly, monthly, or specific time basis. The automation capabilities provided by cron play a crucial role in Linux system administration.

Syntax:

    # Cron job example
    * * * * * sh /path/to/script.sh

Here, the *s represent minute(s) hour(s) day(s) month(s) weekday(s), respectively.

Below are some examples of scheduling cron jobs.

| Schedule    | Description | Example |
| -------- | ------- | ------- |
| 0 0 * * *     | Run a script at midnight every day | 0 0 * * * /path/to/script.sh |
| */5 * * * *   | Run a script every 5 minutes | */5 * * * * /path/to/script.sh |
| 0 6 * * 1-5   | Run a script at 6 am from Monday to Friday | 0 6 * * 1-5 /path/to/script.sh |
| 0 0 1-7 * *   | Run a script on the first 7 days of every month | 0 0 1-7 * * /path/to/script.sh |
| 0 12 1 * *    | Run a script on the first day of every month at noon | 0 12 1 * * /path/to/script.sh |


### Using crontab
The **crontab** utility is used to add and edit the cron jobs. **crontab -l** lists the already scheduled scripts for a particular user. You can add and edit the cron through **crontab -e**.


# How to Debug and Troubleshoot Bash Scripts
## Set the set -x option
One of the most useful techniques for debugging Bash scripts is to set the set -x option at the beginning of the script. This option enables debugging mode, which causes Bash to print each command that it executes to the terminal, preceded by a + sign. This can be incredibly helpful in identifying where errors are occurring in your script.

    #!/bin/bash

    set -x

    # Your script goes here


## Check the exit code
When Bash encounters an error, it sets an exit code that indicates the nature of the error. You can check the exit code of the most recent command using the $? variable. A value of 0 indicates success, while any other value indicates an error.

    #!/bin/bash

    # Your script goes here

    if [ $? -ne 0 ]; then
        echo "Error occurred."
    fi


## Use echo statements
Another useful technique for debugging Bash scripts is to insert echo statements throughout your code. This can help you identify where errors are occurring and what values are being passed to variables.

    #!/bin/bash

    # Your script goes here

    echo "Value of variable x is: $x"

    # More code goes here

## Use the set -e option
If you want your script to exit immediately when any command in the script fails, you can use the set -e option. This option will cause Bash to exit with an error if any command in the script fails, making it easier to identify and fix errors in your script.

    #!/bin/bash

    set -e

    # Your script goes here

## Troubleshooting crons by verifying logs
We can troubleshoot crons using the log files. Logs are maintained for all the scheduled jobs. You can check and verify in logs if a specific job ran as intended or not.

For Ubuntu/Debian, you can find cronlogs at:

    /var/log/syslog

A cron job log file can look like this:

    2022-03-11 00:00:01 Task started
    2022-03-11 00:00:02 Running script /path/to/script.sh
    2022-03-11 00:00:03 Script completed successfully
    2022-03-11 00:05:01 Task started
    2022-03-11 00:05:02 Running script /path/to/script.sh
    2022-03-11 00:05:03 Error: unable to connect to database
    2022-03-11 00:05:03 Script exited with error code 1
    2022-03-11 00:10:01 Task started
    2022-03-11 00:10:02 Running script /path/to/script.sh
    2022-03-11 00:10:03 Script completed successfully


# Various stuff

    #!/bin/bash

    echo "Hi"

    sleep 3

    echo "3 seconds have passed"

    ====

    #!/bin/bash

    # name="DE"

    # echo "What is your name?"
    # read name

    name=$1
    daytime=$2

    user=$(whoami)
    date=$(date)
    whereami=$(pwd)

    echo "Good $daytime $name!"
    sleep 1
    echo "You are looking good today $name!"
    sleep 1
    echo "That's amazing $name!"
    sleep 2

    echo "You are currently logge in as $user and you are in the directory $whereami. Also, today is: $date"

    ====

    echo "$PWD, $SHELL, $USER, $HOSTNAME"

    # environment variable (system wide)
    export my_var

    # make this permanent -> set it as permanent env variable
    #  store it in .bashrc

    # get hidden files
    ls -al

    nano .bashrc
    export my_var="Flo"


# Permissions

    touch de.sh
    ./de.sh

    ls -l

    chmod +x de.sh

    ls -l



# References
- [Bash Scripting Tutorial – Linux Shell Script and Command Line for Beginners](https://www.freecodecamp.org/news/bash-scripting-tutorial-linux-shell-script-and-command-line-for-beginners)
- [you need to learn BASH Scripting RIGHT NOW!! // EP 1](https://www.youtube.com/watch?v=SPwyp2NG-bE&t=167s)
- [chmod](https://www.shellbefehle.de/befehle/chmod/)