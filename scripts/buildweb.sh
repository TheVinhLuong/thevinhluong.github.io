#!/bin/sh
fvm flutter build web
if [ -d ".docs" ]; then rm -Rf ".docs"; fi
pwd
cp -r ./build/web ./.docs
rm -Rf ./build/web