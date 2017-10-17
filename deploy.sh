#!/bin/bash

export PORT=8000
export MIX_ENV=prod
DIR=$1

if [ ! -d "$DIR" ]; then
  printf "Usage: ./deploy.sh <path>\n"
  exit
fi

echo "Deploy to [$DIR]"

mix deps.get
mix release.init
(cd assets && ./node_modules/brunch/bin/brunch b -p)
mix phx.digest
mix release --env=prod
systemctl stop microblog
mix ecto.migrate
SRC=`pwd`
(cd $DIR && tar xzvf $SRC/_build/prod/rel/microblog/releases/0.0.1/microblog.tar.gz)
systemctl start  microblog
