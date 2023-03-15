#!/bin/bash

# These variables may be moved to the .env file soon
WORKDIR="./tmp"
LOBBY_DIR="./mc/lobby/"
S1_DIR="./mc/smp/s1" 
S2_DIR="./mc/smp/s2"

# Create and set temporary work directory
mkdir $WORKDIR && \
cd $WORKDIR

# Download server plugins
wget -i ./extras/lobby/lobby-plugins.txt -P $LOBBY_DIR/plugins
wget -i ./extras/s1/s1-plugins.txt -P $S1_DIR/plugins
wget -i ./extras/s2/s2-plugins.txt -P $S2_DIR/plugins

# World(s) Download
if [ $DL_SRC = "TORRENT" ]
then
    aria2c -d $WORKDIR "magnet:?xt=urn:btih:9b2627acd06d63d7a6d2e181d093eee632a400ba&dn=SMPOnline&tr=udp%3a%2f%2ftracker.opentrackr.org%3a1337%2fannounce&tr=udp%3a%2f%2ftracker.coppersurfer.tk%3a6969%2fannounce&tr=udp%3a%2f%2ftracker.internetwarriors.net%3a1337%2fannounce"
elif [ $DL_SRC = "ARCHIVE" ] || [$DL_SRC = ""]
then
    wget -i ./.sources/archive-org-src.txt $WORKDIR
fi

# Extract World(s)
unzip season2-events.zip -d ..$S2_DIR &
unzip season2.zip -d ..$S2_DIR &
unzip season1.zip -d ..$S1_DIR

# Post-download Cleanup
if [ !$KEEP_TMP ]
then
    rm -r $WORKDIR
fi