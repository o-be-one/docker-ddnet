#!/bin/bash

if [[ ${PASSWORD} == "changeme" ]] {
  echo "sv_rcon_password $(pwgen -s 12 1)" >> /${GAME_TYPE}.cfg
else
  echo "sv_rcon_password ${PASSWORD}" >> /${GAME_TYPE}.cfg
}

echo "sv_name \"${GAME_NAME}\"" >> /${GAME_TYPE}.cfg
echo "sv_max_clients ${MAX_CLIENTS}" >> /${GAME_TYPE}.cfg
echo "sv_map \"${GAME_MAP}\"" >> /${GAME_TYPE}.cfg

cat /${GAME_TYPE}.cfg
exec /DDNet/DDNet-Server -f /${GAME_TYPE}.cfg
