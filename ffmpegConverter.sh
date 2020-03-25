#!/bin/bash

printf "%+35s %-8s %-4s\n"             ----- ----- -----
printf  "%+31s %18s %-1s\n" '|' 'Batch Mp3converter'  '|'
printf  "%+31s %-18s %-1s\n" '|'  ' @traplab'    '|'
printf "%+35s %-8s %-4s\n" ----- ---- -----


cat << here
options: y/Y--continue to converter
          ?--continue to advancedMode(enRoute)
          n/N--quit
here

read -p "Continue ? " answer
echo ""
defaultTextFilePath=./convert.txt

if [ $answer = "y" -o $answer = "Y" ]
then
#check for net
cat << here
install ffmpeg
here

for package in ffmpeg ;
do dpkg -s "$package" > /dev/null 2>&1 &&  echo "$package is installed"  ||
if ping -c 2 -q -W 3 google.com > /dev/null 2>&1 ;
then
echo "Downloading packages" && if [ "$EUID" -ne 0 ] ;
then sudo apt-get install $package
else
apt-get install $package
fi
else
echo "My guy, hauna net.This is as far as  we can go"
exit
fi
done

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
elif [ $answer = "n" -o $answer = "N" ]
then 
exit
elif [ $answer = "?" ]
then echo "chill"
else
echo "wrong input"
exit
fi
: '#what I wanted was to include an instance wherby the user has a file
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
