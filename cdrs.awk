#!/usr/bin/awk -f
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
#
# +---------------------------------------------------------------------------------------------+
# | Utility to process USSD CDRs. It accepts a variable for the USSD string                     |
# | being searched using the `-v` flag.                                                         |
# |                                                                                             |
# | USAGE: awk -f [PROGNAME] -v code=[USSD-STRING] [DATA]                                       |
# |                                                                                             |
# |   or by chaining `find` with `xargs`                                                        |
# |                                                                                             |
# |        find [PATH] -name [PATTERN] -type f | xargs awk -f [PROGNAME] -v code=[USSD-STRING]  |
# |                                                                                             |
# | VERSION: 0.9                                                                                |
# +---------------------------------------------------------------------------------------------+

BEGIN {
  FS=","
  OFS=","
}

{
  if (code == "") {
    print "\nUSAGE: awk -f [PROGNAME] -v code=[USSD-STRING] [DATA]"
    print "Required USSD-STRING `code` parameter missing!\n" > "/dev/stderr"
    exit 1
  }
  if ($10 == code) {
    $5=substr($5,1,length($5)-4);
    $5=substr($5,1,4)"-"substr($5,5,2)"-"substr($5,7,2)" "substr($5,9,2)":"substr($5,11,2)":"substr($5,13,6);
    $6=substr($6,1,length($6)-4);
    $6=substr($6,1,4)"-"substr($6,5,2)"-"substr($6,7,2)" "substr($6,9,2)":"substr($6,11,2)":"substr($6,13,6);
    print $0
  }
}

END {
}
