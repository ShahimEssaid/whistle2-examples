cd "$DIR/.."

WHISTLE2=$(realpath "${DIR}/../whistle2-engine/bin/se-whistle2-cli")

EXAMPLE_NAME=$(basename "$0")
EXAMPLE_NAME=${EXAMPLE_NAME%%.*}

OUTPUT=$(realpath "$DIR/../outputs/${EXAMPLE_NAME}")
echo " OUTPUT: outputs/${EXAMPLE_NAME}"
CMD=()
CMD+=("$WHISTLE2" "-o" "$OUTPUT")

add_input_recursive() {
  while IFS= read -r -d '' file
  do
    echo "  INPUT: $file"
    CMD+=("-i" "$(realpath "$DIR/../$file")")
  done < <(find "inputs/$1/" -type f -name "*.json" -print0)
}

add_input() {
  while IFS= read -r -d '' file
  do
    echo "  INPUT: $file"
    CMD+=("-i" "$(realpath "$DIR/../$file")")
  done < <(find "inputs/$1/" -maxdepth 1 -type f -name "*.json" -print0)
}

mapping() {
  echo "MAPPING: $1"
  CMD+=("-m" "$(realpath "$DIR/../mappings/$1")")
}