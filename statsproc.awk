#!/usr/bin/awk -f

# Utility to correct date format for USSD CDR data.
# The APACHE License (APACHE)
#
# Copyright (c) 2022 Giovanni Mostert. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# +---------------------------------------------------------------------------------------------+
# | Utility to process USSD CDR for analysis in OLAP database.                                  |
# |                                                                                             |
# | USAGE: awk -f [PROGNAME]  [DATA]                                                            |
# |                                                                                             |
# | VERSION: 1.0                                                                                |
# +---------------------------------------------------------------------------------------------+



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
