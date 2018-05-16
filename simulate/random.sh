# Combine above two techniques to retrieve random number between two limits.
number=0   #initialize
FLOOR=5
RANGE=10
#
print_something () {
   number=$1
   while [ "$number" -le $FLOOR ]
   do
     number=$RANDOM
     let "number %= $RANGE"  # Scales $number down within $RANGE.
   done
   echo "Random number between $FLOOR and $RANGE ---  $number"
   echo
}
print_something 1
print_something 1
print_something 1
