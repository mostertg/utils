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
# +----------------------------------------------------------------------------------------------------------------------------+
# | Utility to format USSD CDR dates.                                                                                          |
# |                                                                                                                            |
# | USAGE: {m}awk -f [PROGNAME] -v class=[1,3,6] [DATA]                                                                        |
# |                                                                                                                            |
# | TYPICAL USAGE (with `find`):                                                                                               |
# | time (find ../../postpaid/cdr -name '*.cdr' -type f -print | xargs -n 1 -P 4 awk -f ../../utils/format2.awk -v class=6)    |
# | time (find ../../prepaid/cdr -name '*.cdr' -type f -print | xargs -n 1 -P 4 awk -f ../../utils/format2.awk -v class=1)     |
# | time (find ../../push/cdr -name '*.cdr' -type f -print | xargs -n 1 -P 4 awk -f ../../utils/format2.awk -v class=3)        |
# |                                                                                                                            |
# | VERSION: 1.0                                                                                                               |
# +----------------------------------------------------------------------------------------------------------------------------+


BEGIN {
  FS=","
  OFS=","
}


function format_date(class, filename) {
  if (length(class) != 0) {
    $1=class
  }

  $5=substr($5,1,4)"-"substr($5,5,2)"-"substr($5,7,2)" "substr($5,9,2)":"substr($5,11,2)":"substr($5,13,2)"."substr($5,16,3);
  $6=substr($6,1,4)"-"substr($6,5,2)"-"substr($6,7,2)" "substr($6,9,2)":"substr($6,11,2)":"substr($6,13,2)"."substr($6,16,3);

  print $0 >> filename
}


{
  if ($9 == 6) { 
    filename = "ni_test.csv";
    format_date(class, filename);
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 7) {
    filename = "callme.csv";
    format_date(class, filename);
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 10) {
    filename = "yourmsisdn.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 11) {
    filename = "time.csv";
    format_date(class, filename);
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 16) {
    filename = "postpaid.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 23) {
    filename = "first_national_bank.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 28) {
    filename = "mydata.csv";
    format_date(class, filename);
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 29) {
    filename = "huawei_crbt.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 32) {
    filename = "bank_windhoek.csv";
    format_date(class, filename);
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 33) {
    filename = "bank_windhoek_test.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 36) {
    filename = "nammic.csv";
    format_date(class, filename);
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 45) {
    filename = "test_wasp_atp.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 51) {
    filename = "infobip.csv";
    format_date(class, filename);
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 52) {
    filename = "standardbank.csv";
    format_date(class, filename);
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 53) {
    filename = "grapevine.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 58) {
    filename = "ptmxxi.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 59) {
    filename = "connetit.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 67) {
    filename = "inhouse21.csv";
    format_date(class, filename);
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 72) {
    filename = "mobipay.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 73) {
    filename = "magnet.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 76) {
    filename = "patternm.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 82) {
    filename = "nedbank.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 83) {
    filename = "nedbankprod.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 84) {
    filename = "letshego.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 87) {
    filename = "dmsolution.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 88) {
    filename = "cellfind.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 98) {
    filename = "mobconaf.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 100) {
    filename = "letshegotest.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 102) {
    filename = "techsys.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 104) {
    filename = "vtstest.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 105) {
    filename = "ussd_mtc_it_system.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 106) {
    filename = "ussd_mtc_it_system_2.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 137) {
    filename = "ussd_mtc_it_system_3.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 140) {
    filename = "ussd_mtc_it_system_4.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 143) {
    filename = "vtsplay.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 146) {
    filename = "patternni.csv";
    format_date(class, filename);
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 149) {
    filename = "hyvemobile.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 150) {
    filename = "stdbankussd.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 152) {
    filename = "standardbanknam.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 156) {
    filename = "nampostfin.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 157) {
    filename = "airtimeadv.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 158) {
    filename = "ussd_reverse_billing.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 160) {
    filename = "airtimeadv_uat.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 161) {
    filename = "cellfindni.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 163) {
    filename = "connecttech.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 170) {
    filename = "inhousetest.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 172) {
    filename = "patternaws.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 173) {
    filename = "imsiquery.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 174) {
    filename = "patternnitest.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 176) {
    filename = "vtservices.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 177) {
    filename = "inhouse.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 179) {
    filename = "smscellular.csv";
    format_date(class, filename);
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 181) {
    filename = "ayoinfotech.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 182) {
    filename = "callme_vm-test.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 183) {
    filename = "mtcmfsdev.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else if ($9 == 184) {
    filename = "mtcmfsuat.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
  else {
    filename = "unknown_wasp.csv";
    format_date(class, filename); 
    # printf("Data written to %s\n", filename);
  }
}

END {
  # print "CDR extraction complete.\n"
}
