#!/bin/bash
WORKDIR="./tmp"
LOBBY_DIR="./mc/lobby/"
S1_DIR="./mc/smp/s1" 
S2_DIR="./mc/smp/s2"

mkdir $WORKDIR && \
cd $WORKDIR

wget -i ./extras/lobby/lobby-plugins.txt -P $LOBBY_DIR/plugins
wget -i ./extras/s1/s1-plugins.txt -P $S1_DIR/plugins
wget -i ./extras/s2/s2-plugins.txt -P $S2_DIR/plugins
aria2c -d $WORKDIR "magnet:?xt=urn:btih:9b2627acd06d63d7a6d2e181d093eee632a400ba&dn=SMPOnline&tr=udp%3a%2f%2ftracker.opentrackr.org%3a1337%2fannounce&tr=udp%3a%2f%2ftracker.coppersurfer.tk%3a6969%2fannounce&tr=udp%3a%2f%2ftracker.internetwarriors.net%3a1337%2fannounce"

unzip season2-events.zip -d ..$S2_DIR &
unzip season2.zip -d ..$S2_DIR &
unzip season1.zip -d ..$S1_DIR &

# Cleanup
KEEP_TMP=false
if !KEEP_TMP
then
    rm -r $WORKDIR
fi