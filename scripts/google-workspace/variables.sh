#!/usr/bin/env bash

set -eu

cd ./../..
export wd=$(pwd)
export source_dir_path="$(pwd)/source/google-workspace"
export source_icon_path="${source_dir_path}/Google-Workspace-logos"
export dist_dir_path="$(pwd)/google-workspace"
