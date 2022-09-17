# USSD Statistics Workflow

Use the following code - in order - to generate aggregate statistics for USSD usage for the 
preceding month.

The following assumptions are made:
- Linux std utilities `find` and `join` is installed.
- `mawk` utility (faster version of GNU AWK `gawk`) is installed. This is installed by default on Debian/Ubuntu systems.
- data resides in folder `postpaid/cdr` or `prepaid/cdr`.


## Postpaid

The following produces usage counts and total billed amounts per USSD code and per USSD wasp Postpaid class of service. 

```sh
find postpaid/cdr -name "*.cdr" -exec cat {} + >> postpaid_data.csv
mawk -f count-by-code.awk postpaid_data.csv | sort -k 1 > count-by-code_post.csv
mawk -f sum-by-code.awk postpaid_data.csv | sort -k 1 > sum-by-code_post.csv
join -j 1 -t, count-by-code_post.csv sum-by-code_post.csv > postpaid-stats.csv
```


## Prepaid

The following produces usage counts and total billed amounts per USSD code and per USSD wasp for Prepaid class of service. 

```sh
find prepaid/cdr -name "*.cdr" -exec cat {} + >> prepaid_data.csv
mawk -f count-by-code.awk prepaid_data.csv | sort -k 1 > count-by-code_pre.csv
mawk -f sum-by-code.awk prepaid_data.csv | sort -k 1 > sum-by-code_pre.csv
join -j 1 -t, count-by-code_pre.csv sum-by-code_pre.csv > prepaid-stats.csv
```


# Steps Explained

1.  `find` command searches data folder for all files matching criteria specified. All files are then concatenated into a data file for further processing.
2.  `mawk` runs AWK script for usage counts
3.  `mawk` runs AWK scripts for billed amount
4.  `join` returns the combined data based on 1st column. Equivalent of SQL `JOIN` statement.
