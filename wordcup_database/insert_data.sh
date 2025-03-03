#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo "$($PSQL "TRUNCATE teams, games;")"

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $WINNER != "winner" ]]
  then
    TEAMS_ID_WINNER=$($PSQL "SELECT team_id FROM teams WHERE name ='$WINNER';")
    if [[ -z $TEAMS_ID_WINNER ]]
    then
      #insert winner name 
      INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $WINNER
      fi
      TEAMS_ID_WINNER=$($PSQL "SELECT team_id FROM teams WHERE name ='$WINNER';")
    fi

    TEAMS_ID_OPPONENT=$($PSQL "SELECT team_id FROM teams WHERE name ='$OPPONENT';")
    if [[ -z $TEAMS_ID_OPPONENT ]]
    then
      #insert opponent name
      INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $OPPONENT
      fi
      TEAMS_ID_OPPONENT=$($PSQL "SELECT team_id FROM teams WHERE name ='$OPPONENT';")
    fi
  fi
done

#insert game info
cat games.csv | while IFS="," read YEAR_G ROUND_G WINNER_G OPPONENT_G WINNER_GOALS_G OPPONENT_GOALS_G
do
  if [[ $WINNER_G != "winner" ]]
  then
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name ='$WINNER_G';")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name ='$OPPONENT_G';")
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR_G, '$ROUND_G', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS_G, $OPPONENT_GOALS_G)")
    if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into games, $YEAR_G, $ROUND_G, $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS_G, $OPPONENT_GOALS_G
    fi
  fi
done

