BEGIN {
  FS=OFS=","
}

# date utility functions
function dt2epoch(date,    timestr) {
  timestr = substr(date,1,4) " " substr(date,5,2) " " substr(date,7,2) " " substr(date,9,2) " " substr(date,11,2) " " substr(date,13,2)
  return mktime(timestr)
}

# DEPRECATED: not used, to be removed
# function epoch2hms(e) {
#   return strftime("%H:%M:%S", e, 1)
# }

function abs(n) {
  return n < 0 ? -1 * n : n
}

function cents2dollar(cents) {
  return cents / 100.0
}

function epoch2dom(e) {
  return strftime("%e", e)
}

function epoch2dayname(e) {
  return strftime("%a", e)
}

function epoch2dayhour(e) {
  return strftime("%H", e)
}

{
  # for each CSV line, split line into AWK array
  split($0, line, ",");

  # do stuff with individual columns
  type=line[1];
  msisdn=line[2];
  sessionid=line[3];
  start_tmp=substr(line[5], 1, length(line[5])-4);
  starttime=substr(start_tmp,1,4)"-"substr(start_tmp,5,2)"-"substr(start_tmp,7,2)" "substr(start_tmp,9,2)":"substr(start_tmp,11,2)":"substr(start_tmp,13,6);
  end_tmp=substr(line[6], 1, length(line[6])-4);
  endtime=substr(end_tmp,1,4)"-"substr(end_tmp,5,2)"-"substr(end_tmp,7,2)" "substr(end_tmp,9,2)":"substr(end_tmp,11,2)":"substr(end_tmp,13,6);
  difftime="";
  # difftime=epoch2hms(abs(dt2epoch(line[6]) - dt2epoch(line[5])))
  numexch=line[7];
  charge=line[8];
  chargedollar=cents2dollar(line[8]);
  waspid=line[9];
  waspcode=line[10];
  imsi=line[11];
  daymonth=epoch2dom(dt2epoch(line[5]));
  dayname=epoch2dayname(dt2epoch(line[5]));
  dayhour=epoch2dayhour(dt2epoch(line[6]));
  
  print msisdn FS imsi FS sessionid FS starttime FS endtime FS difftime FS daymonth FS dayname FS dayhour FS numexch FS charge FS chargedollar FS waspid FS waspcode
}
