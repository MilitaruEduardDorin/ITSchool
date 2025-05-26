#! /bin/bash



while true; do
	
	if pgrep hello &> /dev/null; then
		sleep 5
		echo "hello.sh inca ruleaza"
	else 
		echo " Voi reporni hello.sh !"
		nohup ./hello.sh &
	fi
done
