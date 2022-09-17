#!/usr/bin/mawk -f
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
