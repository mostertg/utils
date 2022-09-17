#!/usr/bin/mawk -f

BEGIN {
  FS=OFS=",";
  wasp_id=9;
}

# count
{
  aggr[$wasp_id]++;
}

END {
  # count(*) grouped by wasp_id
  for(wasp in aggr) print wasp, aggr[wasp]
}
