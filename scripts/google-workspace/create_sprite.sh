#!/usr/bin/env bash

cd $(dirname $0)
source ./variables.sh

set -eu

out_file_name() {
  echo $1 | sed -E 's/.*\/logo_([^_]+)_.*\.png/\1/g'
}
export -f out_file_name

gen_sprite_image() {
  target_file_path=$1
  dist_file_name=$(bash -c "out_file_name ${target_file_path}")

  convert ${target_file_path} \
    -fuzz 25% \
    -fill none \
    -draw "matte 0,0 floodfill" \
    -background white \
    -flatten ${dist_dir_path}/${dist_file_name}.png
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
  find ${source_icon_path} |
    grep '.*48dp\.png' |
    sed -E 's/\.\/(.+)/\1/g' |
    xargs -I {} bash -c "gen_sprite_image {}"
  # xargs -I {} echo {}
}

create_puml() {
  find ${dist_dir_path} |
    grep '.*\.png' |
    sed -E 's/.*\/(.+)\.png/\1/g' |
    xargs -I {} bash -c "gen_sprite {}"
}

clear_dist_dir
resize_image
create_puml
