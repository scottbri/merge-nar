#!/bin/sh

winPath="`cygpath -w $PWD`"
toolPath="/cygdrive/c/Program Files (x86)/EMC/Navisphere CLI/"
commandName="naviseccli.exe"
inputFile="listofnars"
outputFile="merged-nars-final.nar"

echo "Opening vi with list of NAR files.  Edit to select NARs to merge."
echo "DON'T MERGE SPA WITH SPB DATA!!  Will result in duplicate data points."
read PROMPT
ls *.nar > $inputFile 2>/dev/null
ls *.NAR >> $inputFile 2>/dev/null
vi $inputFile

echo ; echo "What output filename would you like to use?:"
read outputFile

count=1
mergeFile="mergenar.$count"
prevMergeFile="$mergeFile"

for args in `cat $inputFile`
do
	if [[ $count -eq 1 ]]; then
		echo "Processing $args  File count = $count"
		cp $args $mergeFile
	else
		echo "Merging $args with $prevMergeFile  File count = $count"
		"$toolPath"/$commandName analyzer -archivemerge -data "$args" "$prevMergeFile" -out "$mergeFile" -overwrite y
		rm $prevMergeFile
	fi

	let count++
	prevMergeFile="$mergeFile"
	mergeFile="mergenar.$count"

done

mv $prevMergeFile $outputFile
rm $inputFile
"$toolPath"/$commandName analyzer -archivedump -stats $outputFile
