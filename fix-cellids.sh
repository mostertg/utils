#!/bin/bash

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
#
# USAGE: `fix-cellids.sh -i INFILE -o OUTFILE` 

while getopts i:o: flag
do
  case "${flag}" in
    i) infile=${OPTARG};;
    o) outfile=${OPTARG};;
  esac
done
# echo "INFILE: $infile";
# echo "OUTFILE: $outfile";

awk 'BEGIN {FS="-";OFS=","} (NR>1) {print $1 OFS $2 OFS $3}' $infile \
  | awk 'BEGIN {FS=OFS=","} {printf("%s,%d-%04x-%04x\n", $1,$3,$4,$5)}' > $outfile
