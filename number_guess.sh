#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUM=$(( 1 + RANDOM % 1000 ))

# number of guesses:
NUM_GUESSES=0

# get user name
echo "Enter your username:"
read USERNAME

# check if username in database
USER=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")

# if user doesn't exist:
if [[ -z $USER ]]
then
  # insert user into database
  INSERTED_USER=$($PSQL "INSERT INTO users(username, total_games) VALUES('$USERNAME', 0)")
  echo -e "Welcome, $USERNAME! It looks like this is your first time here."
  TOTAL_GAMES=$($PSQL "SELECT total_games FROM users WHERE username='$USERNAME'")
else
  # echo output for existing user:
  TOTAL_GAMES=$($PSQL "SELECT total_games FROM users WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")
  echo -e "Welcome back, $USERNAME! You have played $TOTAL_GAMES games, and your best game took $BEST_GAME guesses."
fi

GUESS_NUMBER() {
  # echo statement provided to function and get guess
  echo $1
  read GUESS

  # increment guess counter
  NUM_GUESSES=$(( $NUM_GUESSES + 1 ))

  # if guess is not an integer
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    GUESS_NUMBER "That is not an integer, guess again:"
  fi 

  # if guess correct
  if [[ $GUESS == $RANDOM_NUM ]]
  then
    # update total_games
    TOTAL_GAMES=$(( $TOTAL_GAMES + 1 ))
    INCREMENT_TOTAL_GAMES=$($PSQL "UPDATE users SET total_games = $TOTAL_GAMES WHERE username='$USERNAME'")

    # update best_game if num_guesses lower or player has no best game score
    if [[ $NUM_GUESSES < $BEST_GAME || -z $BEST_GAME ]]
    then
      UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game = $NUM_GUESSES WHERE username='$USERNAME'")
    fi

    # echo output
    echo "You guessed it in $NUM_GUESSES tries. The secret number was $RANDOM_NUM. Nice job!"
  fi

  if [[ $GUESS -lt $RANDOM_NUM ]]
  then
    GUESS_NUMBER "It's higher than that, guess again:"
  fi

  if [[ $GUESS -gt $RANDOM_NUM ]]
  then
    GUESS_NUMBER "It's lower than that, guess again:"
  fi
}

GUESS_NUMBER "Guess the secret number between 1 and 1000:"