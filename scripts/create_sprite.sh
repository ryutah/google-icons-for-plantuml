#!/usr/bin/env bash

cd $(dirname $0)/..
wd=$(pwd)

set -eu

gen_sprite_image() {
  inkscape -w 48 -h 48 source/$1/$1.svg -o dist/$1.png -b "#00000000"
}
export -f gen_sprite_image

gen_sprite() {
  java -jar $(which plantuml.jar) -encodesprite 16 dist/$1.png >dist/$1.puml
}
export -f gen_sprite

clear_dist() {
  rm -rf ./dist
  mkdir dist
}

resize_image() {
  find ./source |
    grep '.*\.svg' |
    sed -E 's/.*\/(.+)\.svg/\1/g' |
    xargs -I {} bash -c "gen_sprite_image {}"
}

create_puml() {
  find ./dist |
    grep '.*\.png' |
    sed -E 's/.*\/(.+)\.png/\1/g' | xargs -I {} bash -c "gen_sprite {}"
}

clear_dist
resize_image
create_puml
