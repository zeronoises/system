#!/bin/bash

config_file='/home/zero/.config/qtile/config.py'
keys_file='/home/zero/.config/zero/qtile_kb.txt'
bindings='/home/zero/.config/zero/bindings.txt'

sed -n '/KEY_START/,/KEY_END/p' $config_file | grep '[mod]' > $keys_file

sed -i s/desc=// $keys_file
sed -i s/\"//g $keys_file
sed -i s/\'//g $keys_file
sed -i s/\(//g $keys_file
sed -i s/\)//g $keys_file
sed -i s/\]//g $keys_file

awk -F "," '{ if(NF<6) {printf "Mod +" $2  $4 "\n"} else {printf "Mod +"  $2 " +" $3 $5 "\n"}}' "$keys_file" > "$bindings"

gxmessage --file "$bindings"
