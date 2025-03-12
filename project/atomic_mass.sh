#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

echo -e "\nStarting the process of removing all the trailing zeros in properties.atomic_mass"

cat atomic_mass.txt | while IFS=" | " read ATOMIC_NUMBER ATOMIC_MASS
do
  if [[ $ATOMIC_NUMBER != "atomic_number" ]]
  then
    UPDATE_ATOMIC_MASS_RESULT=$($PSQL "UPDATE properties SET atomic_mass=$ATOMIC_MASS WHERE atomic_number=$ATOMIC_NUMBER;")
    echo -e "UPDATE properties SET atomic_mass=$ATOMIC_MASS WHERE atomic_number=$ATOMIC_NUMBER;"
  fi
done

echo ------------------- done -----------------------------