#!/usr/bin/env bash

cd $(dirname $0)/..
wd=$(pwd)

set -eu

# clear source dir
rm -rf ./source/*

# download icons
curl -sL -o ./source/google-cloud-icons.zip \
  'https://cloud.google.com/icons/files/google-cloud-icons.zip'

# unzip icon
unzip ./source/google-cloud-icons.zip -d source
