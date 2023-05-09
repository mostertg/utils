# The APACHE License (APACHE)
#
# Copyright (c) 2022 Giovanni. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# 	http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


# CDR paths
POST_PATH := /mnt/c/CoreVAS/Tasks/USSD/USSD-CDR/cdrs/postpaid/cdr
PRE_PATH := /mnt/c/CoreVAS/Tasks/USSD/USSD-CDR/cdrs/prepaid/cdr

POST_DATA = postpaid_$(shell date -d '1 month ago' '+%b%Y').csv
PRE_DATA = prepaid_$(shell date -d '1 month ago' '+%b%Y').csv
OUTFILE = ussd_$(shell date -d '1 month ago' '+%b%Y').csv
STATS = session-stats_$(shell date -d '1 month ago' '+%b%Y').csv

FIND_POST := $(shell find ${POST_PATH} -maxdepth 1 -type f -name '*.cdr' -exec cat {} + >> ${POST_DATA} ;)
FIND_PRE := $(shell find ${PRE_PATH} -maxdepth 1 -type f -name '*.cdr' -exec cat {} + >> ${PRE_DATA} ;)

# all:
# 	merge-step stats-step

# merge-step:
# 	find ${POST} -maxdepth 1 -type f -name '*.cdr' -print0 -exec cat {} + >>outfile


all: postdata

proto:
	echo "Making test ..."
	touch ${OUTFILE}

postdata:
	${FIND_POST} 
	touch ${POST_DATA} 
	
predata:
	${FIND_PRE}
	touch ${PRE_DATA}
