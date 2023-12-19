#! /bin/bash
#Declare start and stop ranges
echo "starting with variables declaration"
START_RANGE=150
STOP_RANGE=150

#Running curl command using pokemon api start and stop range
echo "running curl command"
curl -sL "https://pokeapi.co/api/v2/pokemon/?offset=$START_RANGE&limit=$STOP_RANGE" \
| jq ".results[].name" -r | wc -l
POKEMON_COUNT=$(curl -sL "https://pokeapi.co/api/v2/pokemon/?offset=$START_RANGE&limit=$STOP_RANGE" | jq ".results[].name" -r | wc -l)