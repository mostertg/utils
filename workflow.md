# Postpaid
```sh
find postpaid/cdr -name "*.cdr" -exec cat {} + >> postpaid_data.csv
mawk -f count-by-code.awk postpaid.csv | sort -k 1 > count-by-code_post.csv
mawk -f sum-by-code.awk postpaid.csv | sort -k 1 > sum-by-code_post.csv
join -j 1 -t, count-by-code_post.csv sum-by-code_post.csv > postpaid-stats.csv
```

# Prepaid
```sh
find prepaid/cdr -name "*.cdr" -exec cat {} + >> prepaid_data.csv
mawk -f count-by-code.awk prepaid.csv | sort -k 1 > count-by-code_pre.csv
mawk -f sum-by-code.awk prepaid.csv | sort -k 1 > sum-by-code_pre.csv
join -j 1 -t, count-by-code_pre.csv sum-by-code_pre.csv > prepaid-stats.csv
```
