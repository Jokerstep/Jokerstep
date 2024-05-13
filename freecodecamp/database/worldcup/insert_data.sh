#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE TABLE games, teams;")
if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# 导入团队信息
teams=("Croatia" "France" "England" "Belgium" "Russia" "Sweden" "Brazil" "Uruguay" "Colombia" "Switzerland" "Japan" "Mexico" "Denmark" "Spain" "Portugal" "Argentina" "Germany" "Netherlands" "Costa Rica" "Chile" "Nigeria" "Algeria" "Greece" "United States")

for team in "${teams[@]}"
do
    $PSQL "INSERT INTO teams (name) SELECT '$team' WHERE NOT EXISTS (SELECT 1 FROM teams WHERE name = '$team');"
done

# 导入比赛信息
tail -n +2 games.csv | while IFS=',' read -r year round winner opponent winner_goals opponent_goals
do
    winner_id=$($PSQL "SELECT team_id FROM teams WHERE name = '$winner';")
    opponent_id=$($PSQL "SELECT team_id FROM teams WHERE name = '$opponent';")
    $PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ('$year', '$round', '$winner_id', '$opponent_id', '$winner_goals', '$opponent_goals');"
done