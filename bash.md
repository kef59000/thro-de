
# Setup
Install Docker Desktop on your local machine. Then, run the following code block: 

    docker pull ubuntu
    docker run -it ubuntu bash

# Basics
## Basic Commands
In the running container, try the following statements. What are they doing?

| Command    | Description |
| -------- | ------- |
| ps  | Determine your shell type    |
| date | Displays the current date     |
| pwd    | Displays the present working directory    |
| ls    | Lists the contents of the current directory    |
| echo    | Prints a string of text, or value of a variable to the terminal    |

## Shebang
    #!/bin/bash
    which bash


# Creating your first bash script
Install the text editor **vim**.

    apt-get update
    apt-get install vim

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

Here are some examples of valid variable names in Bash:

    name
    count
    _var
    myVar
    MY_VAR

And here are some examples of invalid variable names:

    2ndvar (variable name starts with a number)
    my var (variable name contains a space)
    my-var (variable name contains a hyphen)



























# References
[Bash Scripting Tutorial – Linux Shell Script and Command Line for Beginners](https://www.freecodecamp.org/news/bash-scripting-tutorial-linux-shell-script-and-command-line-for-beginners)
