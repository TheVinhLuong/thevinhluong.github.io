#flutter build web
#!/bin/sh

if [ -d ".docs" ]; then rm -Rf ".docs"; fi
pwd
cp -r ./build/web ./.docs
rm -Rf ./build/web