# #! /bin/bash

# if [[ $1 == "test" ]]
# then
#   PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
# else
#   PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
# fi

# # Do not change code above this line. Use the PSQL variable above to query your database.
# echo $($PSQL "TRUNCATE TABLE games,teams")

# #year, round, winner, opponent, winner_goals,opponent_goals

# cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_G OPPONENT_G
# do
#   echo $YEAR, $ROUND, $WINNER
#   TEAMS=$($PSQL "SELECT name FROM teams WHERE name='$WINNER'")
#   if [[ $WINNER != 'winner' ]]
#    then
#    if [[ -z $TEAMS ]] 
#     then
#     INSERT_TEAM=$($PSQL "INSERT INTO teams (name) VALUES ('$WINNER') ")
#      if [ [ $INSERT_TEAM == " INSERT 0 1 " ] ]
#      then
#       echo "Inserted into teams: $WINNER"
#       fi
#     fi
#   fi
#   TEAMS2=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT'")
#   if [[ $OPPONENT != 'opponent' ]]
#    then
#    if [[ -z $TEAMS2 ]] 
#     then
#     INSERT_TEAM2=$($PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT') ")
#      if [[ $INSERT_TEAM2 == "INSERT 0 1" ]]
#      then
#       echo "Inserted into teams: $OPPONENT"
#       fi
#     fi
#   fi
  
#   TEAM_ID_W=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
#   TEAM_ID_O=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

#   if [[ -n $TEAM_ID_W || -n $TEAM_ID_O ]]  
#   then
#    if [[ $YEAR != 'year' ]]   
#    then
#     INSERT_GAMES=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPO_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
#     if [[ $INSERT_GAMES == "INSERT 0 1" ]]
#     then 
#      echo "Inserted into games: $YEAR"
#   fi
# fi
# fi

# done
#!/bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Truncate tables
echo $($PSQL "TRUNCATE TABLE games, teams")

# Read data from CSV and insert into database
cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_G OPPONENT_G
do
  echo "Processing: $YEAR, $ROUND, $WINNER, $OPPONENT, $WINNER_G, $OPPONENT_G"

  # Insert teams if they do not exist
  for TEAM in "$WINNER" "$OPPONENT"; do
    TEAM_EXISTS=$($PSQL "SELECT name FROM teams WHERE name='$TEAM'")
    if [[ $TEAM != 'winner' && $TEAM != 'opponent' && -z $TEAM_EXISTS ]]; then
      INSERT_TEAM=$($PSQL "INSERT INTO teams (name) VALUES ('$TEAM')")
      if [[ $INSERT_TEAM == "INSERT 0 1" ]]; then
        echo "Inserted into teams: $TEAM"
      fi
    fi
  done

  # Get team IDs
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

  if [[ -n $WINNER_ID && -n $OPPONENT_ID ]]; then
    if [[ $YEAR != 'year' ]]; then
      INSERT_GAMES=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_G, $OPPONENT_G)")
      if [[ $INSERT_GAMES == "INSERT 0 1" ]]; then
        echo "Inserted into games: $YEAR"
      fi
    fi
  fi
done

