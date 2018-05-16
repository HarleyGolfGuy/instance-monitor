num=$1
#
name="instance-$num"
echo "Starting up instance #$num"
# start up not running
curl -H "Content-Type: application/json" -X POST -d "{\"name\": \"$name\",\"isRunning\": 1, \"isWorking\": 0, \"id\": ${num}}" http://localhost:8888/instance
#
#
# -- Generate a random number
random_num () {
   FLOOR=5
   RANGE=10
   number=$1
   while [ "$number" -le $FLOOR ]
   do
     number=$RANDOM
     let "number %= $RANGE"  # Scales $number down within $RANGE.
   done
   echo "Random number between $FLOOR and $RANGE ---  $number"
   echo
}
#
# run the instances
#
while true
do 
    name="instance-$num"
    sleep_num=$( random_num 1 )
    # start up not running
    curl -H "Content-Type: application/json" -X POST -d "{\"name\": \"$name\",\"isRunning\": 1, \"isWorking\": 0, \"id\": ${num}}" http://localhost:8888/instance
    sleep 1
    # start up not running
    curl -H "Content-Type: application/json" -X POST -d "{\"name\": \"$name\",\"isRunning\": 1, \"isWorking\": 1, \"id\": ${num}}" http://localhost:8888/instance
    sleep $sleep_num
done
