#!/bin/bash

read -p "Enter File Id: "  fileid
read -e -p "Enter File Dir: "  "path_to_download_dir"  dir #replce with your download dir path ~/Downloads

cd  ~/$dir

echo "File will be downloaded in dir: ~/{$dir}"

curl -c ./$fileid -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./$fileid "https://drive.google.com/uc?export=download&confirm=`awk \
'/download/ {print $NF}' \
./$fileid`&id=${fileid}" -O -J -L

if [ -f ./$fileid ] ; then
    rm -rf ./$fileid
    echo "cookie file deleted successfully"
fi

echo "File downloaded in dir: ~/{$dir}"
