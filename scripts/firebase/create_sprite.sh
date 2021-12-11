#!/usr/bin/env bash

cd $(dirname $0)
source ./variables.sh

set -eu

out_file_name() {
  base_dir_raplace=$(echo ${source_dir_path} | sed -E 's/\//\\\//g' | sed -E 's/\./\\./g')
  echo $1 | sed -E "s/${base_dir_raplace}\/([^\/]+).+/\1/g" | sed -E 's/\s/_/g' | tr '[A-Z]' '[a-z]'
}
export -f out_file_name

gen_sprite_image() {
  target_file_path=$1
  dist_file_name=$(bash -c "out_file_name '${target_file_path}'")
  set -x
  inkscape -w 48 -h 48 "${target_file_path}" -o "${dist_dir_path}/${dist_file_name}.png" -b "#00000000"
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
    grep '.(1- Icon, Dark).svg' |
    sed -E 's/\.\/(.+)/\1/g' |
    xargs -I {} bash -c "gen_sprite_image '{}'"
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
