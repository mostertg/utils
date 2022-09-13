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

{
  # for each CSV line, split line into AWK array
  split($0, line, ",");

  # do stuff with individual columns
  sessionid=line[3];
  startts=substr(line[5],1,4)"-"substr(line[5],5,2)"-"substr(line[5],7,2)" "substr(line[5],9,2)":"substr(line[5],11,2)":"substr(line[5],13,6);
  endts=substr(line[6],1,4)"-"substr(line[6],5,2)"-"substr(line[6],7,2)" "substr(line[6],9,2)":"substr(line[6],11,2)":"substr(line[6],13,6);
  numexch=line[7];
  bill=line[8];
  waspid=line[9];
  waspcode=line[10];
  
  # print sessionid FS sclass FS startts FS endts FS sesslen FS daymonth FS dayname FS dayhour FS numexch FS bill FS billnad FS waspid FS waspcode
  print sessionid FS sclass FS startts FS endts FS numexch FS bill FS waspid FS waspcode
}
