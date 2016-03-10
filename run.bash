#!/bin/bash

if [[ ${PASSWORD} == "changeme" ]] {
  echo "sv_rcon_password $(pwgen -s 12 1)" >> /${GAME_TYPE}.cfg
else
  echo "sv_rcon_password ${PASSWORD}" >> /${GAME_TYPE}.cfg
}

cat /${GAME_TYPE}.cfg
exec /DDNet/DDNet-Server -f /${GAME_TYPE}.cfg
