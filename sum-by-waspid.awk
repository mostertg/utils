#!/usr/bin/mawk -f

BEGIN {
  FS=OFS=",";
  bill=8;
  wasp_id=9;
  # wasp_code=10;
}

# sum of charges
{
  aggr[$wasp_id] += ($bill / 100.0);
}

END {
  # bill (N$) grouped by wasp_id
  for(wasp in aggr) print wasp, aggr[wasp]
}
