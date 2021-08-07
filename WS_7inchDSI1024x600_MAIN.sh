#Set up the script to run the interpreter
#!/bin/bash
Hardware_PATH="/proc/device-tree/model"
Hardware_Message(){

	if grep -q "Raspberry Pi 4" $Hardware_PATH ; then
		ret=1
	elif grep -q "Raspberry Pi Compute Module 4" $Hardware_PATH ; then
		ret=2
	elif grep -q "Raspberry Pi 3" $Hardware_PATH ; then
		ret=3
	elif grep -q "Raspberry Pi Compute Module 3" $Hardware_PATH ; then
		ret=4
	else
		ret=255
	fi
	
	echo ${ret}
}
 

Hardware_Message_Value=`Hardware_Message`


if [ $Hardware_Message_Value -eq 1 ]; then
	printf "pi4\n"
	cd ./pi4
elif [ $Hardware_Message_Value -eq 2 ]; then
	printf "CM4\n"
	cd ./pi4
elif [ $Hardware_Message_Value -eq 3 ]; then
	printf "pi3\n"
	cd ./pi3
elif [ $Hardware_Message_Value -eq 4 ]; then
	printf "CM3\n"
	cd ./pi3
else
	printf "The hardware version is not supported\n"
fi


if [ $Hardware_Message_Value -ne 255 ]; then
	sudo chmod 777 WS_7inchDSI1024x600.sh
	sudo ./WS_7inchDSI1024x600.sh
fi
 

