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
# +------------------------------------------------------------+
# | A simple statistics utility.                               |
# |                                                            |
# | USAGE: awk -f [PROGNAME] -v code=[USSD-STRING] [DATA]      |
# |                                                            |
# | VERSION: 0.9                                               |
# +------------------------------------------------------------+
BEGIN {
	FS = OFS = ","
}

{
	count[$10]++
}

END {
	for (ussdstr in count) {
		print ussdstr, count[ussdstr]
	}
}

