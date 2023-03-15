#!/bin/bash

# Use aria2c to download the world files
if [ $DL_SRC = "TORRENT" ]
then
    aria2c -d $DL_DIR \
        "magnet:?xt=urn:btih:9b2627acd06d63d7a6d2e181d093eee632a400ba&dn=SMPOnline&tr=udp%3a%2f%2ftracker.opentrackr.org%3a1337%2fannounce&tr=udp%3a%2f%2ftracker.coppersurfer.tk%3a6969%2fannounce&tr=udp%3a%2f%2ftracker.internetwarriors.net%3a1337%2fannounce" \
elif [ $DL_SRC = "ARCHIVE" ] || [ $DL_SRC = "" ]
then
    aria2c -i ./.sources/archive-org-src.txt -d $DL_DIR 
fi

# Sketchy way of extraction but I think it works
cd $DL_DIR/SMPOnline && \
unzip season2-events.zip -d ../smp/s2 && \
unzip season2.zip -d ../smp/s2 && \
unzip season1.zip -d ../smp/s1

# Cleanup
KEEP_TMP=false
if [ !$KEEP_TMP ]
then
    rm -r $DL_SRC
fi