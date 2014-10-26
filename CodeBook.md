# Code Book

tidy.csv is a comma-separated CSV file.

The content is organized in columns:
- Subject is the opaque id provided by the raw set
- Activity is a human readable activity label related to the raw set
- measures are the desired measures extracted from the raw set (561 vector) and organized in columns, each measure has its own column. All measures positioned at index 1 in the 561 vector are gathered in the same column.

It is a reshaped version of https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

