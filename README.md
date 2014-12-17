merge-nar
=========

... is a /bin/sh shell script for CYGWIN environments to merge EMC VNX/CX NAR files into a single NAR archive using naviseccli

* assumes EMC naviseccli.exe installed 
* use to upload more easily into other EMC tools
* make sure not to combine NAR data from both SP's... you'll get duplicated performance stats

Installation and Usage
======================

* install mergenar.sh into ~/bin or some such convenient location
* edit mergenar.sh to verify paths to installed components

1. first cd to the subdirectory where the NAR files are located
2. execute ~/mergenar.sh
3. mergenar.sh will open VI to allow you to edit the list of files to be included in the merged archive
4. provide a name for the final merged file (ending in .nar, please)


