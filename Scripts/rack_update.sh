#!/bin/bash

version=$1
base_url="https://vcvrack.com/downloads/"
rack_zip="Rack-${version}-lin.zip"
sdk_zip="Rack-SDK-${version}.zip"

curl "$base_url""$rack_zip" --output /mnt/Gog/Downloads/"$rack_zip"
curl "$base_url""$sdk_zip" --output /mnt/Gog/Downloads/"$sdk_zip"

unzip /mnt/Gog/Downloads/"$rack_zip" -d /mnt/Gog/Downloads
unzip /mnt/Gog/Downloads/"$sdk_zip" -d /mnt/Gog/Downloads

rm -r /opt/vcvrack
rm -r /mnt/Magog/Rack-SDK

mv /mnt/Gog/Downloads/Rack /opt/vcvrack
mv /mnt/Gog/Downloads/Rack-SDK /mnt/Magog/Rack-SDK

setcap cap_sys_nice=ep /opt/vcvrack/Rack
