#!/bin/bash
WORKDIR="./tmp"
S1_DIR="/mc/smp/s1" 
S2_DIR="/mc/smp/s2"

mkdir $WORKDIR && \
cd $WORKDIR

aria2c "magnet:?xt=urn:btih:9b2627acd06d63d7a6d2e181d093eee632a400ba&dn=SMPOnline&tr=udp%3a%2f%2ftracker.opentrackr.org%3a1337%2fannounce&tr=udp%3a%2f%2ftracker.coppersurfer.tk%3a6969%2fannounce&tr=udp%3a%2f%2ftracker.internetwarriors.net%3a1337%2fannounce" && \

mkdir -p $S1_DIR/warps $S2_DIR/warps && \
cp -r warps-season1 ..$S1_DIR/warps && \
cp -r warps-season2 ..$S2_DIR/warps

unzip season2-events.zip -d ..$S2_DIR &
unzip season2.zip -d ..$S2_DIR &
unzip season1.zip -d ..$S1_DIR &


# Cleanup
KEEP_TMP=false
if !KEEP_TMP
then
    rm -r $WORKDIR
fi