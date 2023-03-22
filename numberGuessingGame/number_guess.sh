#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read userName

userNameResult=$($PSQL "select * from info where name='$userName'")
gamesplayed=0

if [[ -z $userNameResult ]]
then
  insertUserResult=$($PSQL "insert into info (name) values ('$userName')")
  echo "Welcome, $userName! It looks like this is your first time here."
else
  gamesplayed=$($PSQL "select gamesplayed from info where name='$userName'")
  bestgame=$($PSQL "select bestgame from info where name='$userName'")

  echo "Welcome back, $userName! You have played $gamesplayed games, and your best game took $bestgame guesses."
fi

secretNumber=$((1 + RANDOM % 1000))

echo "Guess the secret number between 1 and 1000:"
read guess

isCorrect=false
numberOfTries=0

while [ $isCorrect = false ] 
do
  numberOfTries=$((numberOfTries + 1))
  if [[ ! $guess =~ ^[0-9]+ ]]
  then
    echo "That is not an integer, guess again:"
    read guess
  elif (( guess <  secretNumber ));
  then
    echo "It's higher than that, guess again:"
    read guess
  elif (( guess > secretNumber ));
  then
    echo "It's lower than that, guess again:"
    read guess
  else
    echo "You guessed it in $numberOfTries tries. The secret number was $secretNumber. Nice job!"
    isCorrect=true
    fi
done

#update database
gamesplayed=$((gamesplayed + 1))
gamesUpdateResult=$($PSQL "update info set gamesplayed = $gamesplayed where name = '$userName'")

if (( bestgame > numberOfTries )) || [ -z $bestgame ]
then
  numberOfTriesUpdateResult=$($PSQL "update info set bestgame=$numberOfTries where name='$userName'")
fi
