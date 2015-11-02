#!/usr/bin/bash

#too lazy to find the id of the device
idvar=$(xinput list | grep 'Synaptics')
echo $idvar | grep '^id='
id=$(echo $idvar | cut -c 39-40)

#echo $id

test=$(xinput list-props 13 | grep 'Device Enabled')
test=$(echo $test|awk '{print substr($0,length($0),1)}')

if [ $test == 0 ]
then
	xinput set-prop $id "Device Enabled" 1
else
	xinput set-prop $id "Device Enabled" 0
fi