#!/usr/bin/env bash

cd $(dirname $0)
source ./variables.sh

set -v

# clear source dir
rm -rf ${source_dir_path}/*
mkdir -p ${source_dir_path}

unzip ${GOOGLE_WORKSPACE_ICON_ZIP_FILE_PATH} -d ${source_dir_path}
