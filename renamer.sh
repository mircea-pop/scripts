#!/bin/bash

# Rename mkv and srt/sub files in all the subdirectories of the given folder. Delete everything which is not mkv, sub or srt

if [ $# -eq 0 ]
then
  echo "Please provide folder to be processed"
  exit;
fi

folder=$1;

cd $folder

dirs=$(ls);

for i in $dirs
 do
  echo
  echo "processing folder $i"
  cd $i
  files=$(ls);
  filename=$i
  for f in $files
   do
    echo "processing file $f"
    extension=$(echo $f | rev | cut -d"." -f1 | rev);
    echo "current extension: $extension"
    if [[ $extension == "srt" || $extension == "sub" || $extension == "mkv" ]]
      then
        echo "File to be renamed found: $f. I will rename it..." 
        mv $f $filename.$extension
      else
       echo "found unuseful file $f which could be deleted";
       #rm -rf $f;
    fi
   done;
  cd ..
 done;
