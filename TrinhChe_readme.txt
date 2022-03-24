1. What is a variable?
A variable is a core language concept when we're working with computer code. Variables are how we store and manipulate information and data.
Or, variable could be thought of as a bucket and/or memory, which will be assigned a name and a value, and then used for data manipulation.

2. What is a vector?
A vector is a sequential data type that can hold series of numbers or series of strings or other kinds of information.
Or, we can think of it as boxes in memory, with boxes being assigned names and posited right after one another.
Example how to assign values to vector v with a series of numbers: v <- c(1,3,5,7,9)

3. What is a data frame?
Data frame is a data type and/or a list of vectors. The key is vectors must have the same length.
It looks a lot like a spreadsheet, with many and columns are named and have specific data types within.
We can either create a data frame or read data in existing Excel (saved as csv file). 

Example of creating a data frame: df <- dataframe(Apple=c(1,3,5,7), Orange=c(2,4,6,8), ...)
Example of reading existing csv file like what we did in assignments: df <- read.csv("[name of csv file]")

4. What is a CSV file?
CSV file means 'comma seperated value' file, in which the actual text compiles of column headers and correspoding data separated by commas.
We can save an Excel file under csv format.

5. What are the steps you have to take to read a CSV file and compute the mean of the first column of data?

*Step 1: Read the data from existing csv file by using read.csv formula and assigning it as a data frame.
> df <- read.csv("[name of CSV file]")

*Step 2: Read all the columns in the file
> print(names(df)) 				#comment: this will allow us to see all the available columns (in such order; the first one being the 1st column)

Example of step 2's result: "column 1" "column 2" "column 3"

*Step 3: Print out the mean of 1st column. There are 2 methods.
Method 1 > print(mean(df$"column 1")			
						#comment: the $ and [[ ]] are to access the column as a vector
Method 2 > print(mean(df[['column 1']]))