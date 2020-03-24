#!/bin/bash

printf "%+35s %-6s %-4s\n"             ----- ----- -----
printf  "%+31s %14s %-1s\n" '|' 'Bulk converter'  '|'
printf  "%+31s %-14s %-1s\n" '|'  'with ffmpeg'    '|'
printf "%+35s %-6s %-4s\n" ------ ---- -----

read -p "Continue ? " answer
cat << here
options: y/Y--continue to converter
          ?--continue to advancedMode(enRoute)

defaultTextFilePath=./convert.txt

if [ $answer = "y" -o $answer = "Y" ]
then

TextFilePath=$defaultTextFilePath

#Receive input as paths required and assign to variables
read -p "Enter path of files to convert: " filePath
read -p "Enter path of output directory: " filePath2

#why single redirector...to overwrite contents of file not append
ls -1  $filePath > $TextFilePath

#read line by line of text file
while read LINE
#assign read line values after trimming to a variable
do New_LINE=$(echo $LINE) 
#echo "$New_LINE "
convertLine=$(echo $New_LINE | cut -f1 -d ".")
#echo "$convertLine"
echo -e  $filePath\"$New_LINE\" $filePath2\"$convertLine.mp3\" |xargs ffmpeg -i 
done < $TextFilePath
else
exit
fi
|'#what I wanted was to include an instance wherby the user has a file
# list of relative paths to files to convert,for now append or recreate.Simple.haha
elif [ $answer = "?" ]

then

read -p "Enter path to text file containing relative paths of files to convert: " assignedTextFilePath

defaultTextFilePath=$assignedTextFilePath
TextFilePath=$defaultTextFilePath

read -p "Enter path of output directory: " filePath2


#read line by line of text file
while read LINE
#assign read line values after trimming to a variable
do New_LINE=$(echo $LINE) 
#echo "$New_LINE "
convertLine=$(echo $New_LINE | cut -f1 -d ".")
#echo "$convertLine"
echo -e  \"$New_LINE\" $filePath2\"$convertLine.mp3\" |xargs ffmpeg -i 
done < $TextFilePath
exit
fi'
