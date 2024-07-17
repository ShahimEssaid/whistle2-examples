#!/usr/bin/env bash
#set -x
set -e
set -u
set -o pipefail
set -o noclobber

# https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
shopt -s nullglob

# stack overflow #59895
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
    DIR="$(cd -P "$(dirname "$SOURCE")" && pwd)"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$(cd -P "$(dirname "$SOURCE")" && pwd)"
. "$DIR/.env.sh"

# Specify the main Whistle file here, relative to the top /mappings folder
mapping 'main-uscore_311_to_omop53.wstl'

# Specify the relative input directory relative to the top /inputs folder. *.json files, recursively,
# will be loaded as input files.
# This can be repeated as needed to include multiple input directories but make sure the file names
# have unique names across all included directories since they will all be placed in the same output
# directory and will overwrite each other if they have identical file names.
add_input_recursive "fhir_r4_uscore_3.1.1"

# Use this version to only load *.json files directly under the hello directory (unlike the recursive version above).
#add_input "hello"

# The output files will be located in a directory under the top /outputs directory.
# The output folder name will match this script's name (without the .sh extension)

# This runs the Whistle engine with options based on the above inputs and the main .wstl file.
"${CMD[@]}"

