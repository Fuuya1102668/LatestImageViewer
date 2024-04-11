#! /usr/bin/bash

cd txt2img-images/ 
folderPath=`ls -t | head -n 1`
cd "$folderPath"
echo $folderPath

newestFile=`ls -t | head -n 1`
eog "$newestFile" &
lastNewestFile=""

trap 'echo "Ctrl+C pressed, exiting..."; exit' INT

while true; do
    newestFile=`ls -t | head -n 1`
    if [ "${newestFile}" != "${lastNewestFile}" ]; then
        echo "open $newestFile"
        eog -w "$newestFile" &
        lastNewestFile=${newestFile}
    fi
    sleep 1
done
