#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ The Bold Salon ~~~~~\n"

MAIN_MENU(){

  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo -e "\nWelcome to My Salon, how can I help you?"

  SERVICES_RESULT=$($PSQL "select service_id,name from services")
  echo "$SERVICES_RESULT" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  read SERVICE_ID_SELECTED

  SELECTION_RESULT=$($PSQL "select service_id from services where service_id=$SERVICE_ID_SELECTED")

  if [[ -z $SELECTION_RESULT ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
  else

  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  PHONE_RESULT=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")

  if [[ -z $PHONE_RESULT ]]
  then
    #create new customer
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    CREATE_CUSTOMER=$($PSQL "insert into customers (phone,name) values('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
  else
    NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
  fi

  echo -e "\nWhat time would you like your cut, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
  read SERVICE_TIME

  #create appointment
  CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
  APPOINTMENT_RESULT=$($PSQL "insert into appointments (customer_id,service_id,time) values($CUSTOMER_ID,$SELECTION_RESULT,'$SERVICE_TIME')")

  SERVICE_NAME=$($PSQL "select name from services where service_id=$SELECTION_RESULT")
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
  fi
}

MAIN_MENU
