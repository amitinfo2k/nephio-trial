#!/bin/bash


#for var in $(kubectl get pods -A  | awk '{print $1" "$2}'); do

#    echo "kubectl logs -n $var | grep omec"

#done

#sleep 5

echo "------------------start--------------------" > dump.log


var1=$(kubectl get pods -A  | awk '{print $1" "$2}')

echo "$var1" | while IFS= read -r line ; 
do 
echo "---------------------$line------------------------------" >> dump.log
	kubectl logs -n $line | grep omec >> dump.logs ; 
echo "--------------------------------------------------------" >> dump.log
done

var1=$(kubectl get pods -A  | awk '/2\/2/ {print $1" "$2}')

echo "$var1" | while IFS= read -r line ; 
do 
echo "---------------------$line------------------------------" >> dump.log
	kubectl logs -n $line -c controller | grep omec >> dump.log ; 
echo "--------------------------------------------------------" >> dump.log

done

