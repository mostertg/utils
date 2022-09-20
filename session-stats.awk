#!/usr/bin/mawk -f
# USAGE: ./session-stats.awk -v serv_class=[1,6]
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

BEGIN {
  FS=OFS=","
  exch=7;
  bill=8;
  wasp_code=10
}

function abs(n) {
  return n < 0 ? -1 * n : n
}

function dt2epoch(dt,    timestr) {
  timestr = substr(dt,1,4) " " substr(dt,5,2) " " substr(dt,7,2) " " substr(dt,9,2) " " substr(dt,11,2) " " substr(dt,13,2)
  return mktime(timestr) + (substr(dt,16,3)/1000)
}

{
  # print $10, $9, dtfmt($5), dtfmt($6), abs(dt2epoch($6) - dt2epoch($5))
  # g_wasp[$wasp_code]
  s_exch[$wasp_code] += $exch
  s_bill[$wasp_code] += ($bill / 100.0);
  s_len[$wasp_code] += abs(dt2epoch($6) - dt2epoch($5));
  s_count[$wasp_code]++;
}

END {
  for(code in s_len) {
    print serv_class, code, s_count[code], s_bill[code], s_exch[code] / s_count[code], s_len[code], s_len[code] / s_count[code]
  }
}
