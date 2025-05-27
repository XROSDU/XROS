#!/bin/sh

version=$(cat module.prop | grep 'version=' | awk -F '=' '{print $2}' | sed 's/ (.*//')

version='v'$(grep '^version =' ../../xros/Cargo.toml | cut -d '"' -f 2)

if [ -z "$version" ]; then
    echo "Error: 版本号不存在."
    exit 1
fi

filename="xros_magisk_${version}.zip"
echo $version  


if [ -f "./xros-core" ] && [ -f "./xros-cli" ] && [ -f "./xros-web" ]; then
    zip -r -o -X "$filename" ./ -x '.git/*' -x '.github/*' -x 'folder/*' -x 'build.sh' -x 'magisk_update.json'
else
    wget -O "xros_last.zip" https://github.com/XROS/XROS/releases/download/"$version"/xros-linux-aarch64-"$version".zip
    unzip -o xros_last.zip -d ./
    mv ./xros-linux-aarch64/* ./
    rm -rf ./xros_last.zip
    rm -rf ./xros-linux-aarch64
    zip -r -o -X "$filename" ./ -x '.git/*' -x '.github/*' -x 'folder/*' -x 'build.sh' -x 'magisk_update.json'
fi