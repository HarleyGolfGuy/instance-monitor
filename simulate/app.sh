for i in $(seq 1 24);
do
       /bin/bash ./run.sh $i &
       #echo $i
       sleep 1
done
