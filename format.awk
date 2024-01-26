#!/usr/bin/mawk -f

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
# | Utility to format USSD CDR dates.                                                           |
# |                                                                                             |
# | USAGE: {m}awk -f [PROGNAME] -v class=[1,3,6] [DATA]                                                            |
# |                                                                                             |
# | VERSION: 1.0                                                                                |
# +---------------------------------------------------------------------------------------------+


BEGIN {
  FS=","
  OFS=","
}

{
  if(length(class) != 0) {
    $1=class
  }
  # if(NR==1) {
  #   print $0
  # }
  else {
    $5=substr($5,1,4)"-"substr($5,5,2)"-"substr($5,7,2)" "substr($5,9,2)":"substr($5,11,2)":"substr($5,13,2)"."substr($5,16,3);
    $6=substr($6,1,4)"-"substr($6,5,2)"-"substr($6,7,2)" "substr($6,9,2)":"substr($6,11,2)":"substr($6,13,2)"."substr($6,16,3);
    print $0
  }
}

END {
}
