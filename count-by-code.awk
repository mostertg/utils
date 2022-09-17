#!/usr/bin/mawk -f

BEGIN {
  FS=OFS=",";
  wasp_code=10;
}

# count
{
  aggr[$wasp_code]++
}

END {
  # count(*) grouped by wasp_code
  for(code in aggr) print code, aggr[code]
}
