#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

MAIN() {
  #Check for arguments
  if [[ -z $1 ]]
  then
    #If there are no arguments
    echo "Please provide an element as an argument."

  else 
    if [[ $1 =~ ^[0-9]+$ ]]
    then 
      #Is an atomic number
      ATOMIC_NUMBER=$1

    else
      #Is a symbol or a name
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name='$1' OR symbol='$1';")
    fi

    if [[ -z $ATOMIC_NUMBER ]]
    then
      #The input doesn't exist in the data base
      echo -e "I could not find that element in the database."

    else
      ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$ATOMIC_NUMBER;")
      ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$ATOMIC_NUMBER;")
      ELEMENT_TYPE=$($PSQL "SELECT types.type FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$ATOMIC_NUMBER;")
      ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ATOMIC_NUMBER;")
      ELEMENT_MELTING=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER;")
      ELEMENT_BOILING=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER;")

      echo -e "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ATOMIC_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MELTING celsius and a boiling point of $ELEMENT_BOILING celsius."
    fi
  fi
}

MAIN $1