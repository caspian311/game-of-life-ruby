#!/bin/bash -e

RUBY_BIN=$(which ruby)

pushd $(dirname $(dirname $0)) &> /dev/null
   BASEDIR=$(pwd)
popd &> /dev/null

main_file=$(find $BASEDIR -name main.rb)

if [ "$#" -ne 2 ]
then
   echo "ERROR: Wrong number of parameters!"
   echo "Usage: gol <iteration> <path_to_seed_file>"
   exit 1
fi

if [ ! -e $2 ]
then
   echo "ERROR: Seed file does not exist"
   echo "Usage: gol <iteration> <path_to_seed_file>"
   exit 1
fi

export ITERATIONS=$1
export FILE=$2

echo "Starting Game of Life!"

$RUBY_BIN $main_file
