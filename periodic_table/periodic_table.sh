#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

CONDITION=''
if [[ $1 =~ [0-9] ]]
then
CONDITION="atomic_number=$1"
elif [[ $1 =~ ^[A-Z][a-z]{0,1}$ ]]
then
CONDITION="symbol='$1'"
elif [[ $1 =~ [A-Z][a-z]+ ]]
then
CONDITION="name='$1'"
else
echo Please provide an element as an argument.
fi

if [[ ! -z $CONDITION ]]
then
 RESULT=$($PSQL "select atomic_number,types.type,atomic_mass,melting_point_celsius,boiling_point_celsius,symbol,name from elements join properties using(atomic_number) join types using(type_id) where $CONDITION")
if [[ -z $RESULT ]]
then
echo I could not find that element in the database.
else
 echo $RESULT | while IFS=" |" read ATOMIC_NUMBER TYPE MASS MELTING_POINT BOILING_POINT SYMBOL NAME
do
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
done
fi
fi
