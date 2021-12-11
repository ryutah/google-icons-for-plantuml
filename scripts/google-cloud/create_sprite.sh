#!/usr/bin/env bash

cd $(dirname $0)
source ./variables.sh

set -eu

gen_sprite_image() {
  inkscape -w 48 -h 48 ${source_dir_path}/$1/$1.svg -o ${dist_dir_path}/$1.png -b "#00000000"
}
export -f gen_sprite_image

gen_sprite() {
  java -jar $(which plantuml.jar) -encodesprite 16 ${dist_dir_path}/$1.png | ${wd}/scripts/generate_puml.py $1 >${dist_dir_path}/$1.puml
}
export -f gen_sprite

clear_dist_dir() {
  rm -rf ${dist_dir_path}
  mkdir ${dist_dir_path}
}

resize_image() {
  find ${source_dir_path} |
    grep '.*\.svg' |
    sed -E 's/.*\/(.+)\.svg/\1/g' |
    xargs -I {} bash -c "gen_sprite_image {}"
}

create_puml() {
  find ${dist_dir_path} |
    grep '.*\.png' |
    sed -E 's/.*\/(.+)\.png/\1/g' | xargs -I {} bash -c "gen_sprite {}"
}

clear_dist_dir
resize_image
create_puml
