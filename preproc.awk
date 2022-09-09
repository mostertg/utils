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
# | Utility to preprocess USSD statistics.                                                      |
# |                                                                                             |
# | USAGE: awk -f [PREPROC_PROG] [DATA]                                                         |
# |                                                                                             |
# |   or by chaining with Postprocessing Utility (in `utils/postproc.awk`)                      |
# |                                                                                             |
# |        awk -f [PREPROC_PROG] [DATA] | awk -f [POSTPROC_PROG] > [OUTPUT]                     |
# |                                                                                             |
# | VERSION: 0.9                                                                                |
# +---------------------------------------------------------------------------------------------+

BEGIN {
  FS=","
  OFS=","
}

{
  # create array with both WASPID and USSD_String, counting occurences
  count[$9,$10]++
  total[$9,$10] += $8
}

END {
  # iterate thru each entry in array
  for (i in count) {
    # split WASPID and USSD_String columns
    split(i, a, SUBSEP);
    print a[1], a[2], count[i], total[i];
  }
}
