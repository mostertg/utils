BEGIN {
  FS=OFS=","
  session_start=5;
  session_end=6;
  wasp_code=10
}

function dt2epoch(dt,    timestr) {
  timestr = substr(dt,1,4) " " substr(dt,5,2) " " substr(dt,7,2) " " substr(dt,9,2) " " substr(dt,11,2) " " substr(dt,13,2)
  return mktime(timestr) + (substr(dt,16,3)/1000)
}


function abs(n) {
  return n < 0 ? -1 * n : n
}

# function epoch2hms(e) {
#   # return strftime("%H:%M:%S", e, 1)
#   return strftime("%S.s", e, 2)
# }
#
# function epoch2dom(e) {
#   return strftime("%e", e)
# }
#
# function epoch2dayname(e) {
#   return strftime("%a", e)
# }
#
# function epoch2dayhour(e) {
#   return strftime("%H", e)
# }

{
  split($0, line, ",");
  session_len[$wasp_code] += abs(dt2epoch(line[6]) - dt2epoch(line[5]));
  # session_len[$wasp_code] += abs(dt2epoch(session_end) - dt2epoch(session_start));
  n[$wasp_code]++;
}

END {
  # for(code in session_len) print code, session_len[code] / n[code]
  for(code in session_len) print code, session_len[code] / n[code]
}
