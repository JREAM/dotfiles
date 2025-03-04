#!/bin/bash

# Load includes if they exise
INCLUDE_DIR="/home/jesse/.config/bash/includes"
if [ -d "$INCLUDE_DIR" ]; then
  find "$INCLUDE_DIR" -name "*.sh" -print0 | while IFS= read -r -d $'\0' file; do
    if [ -r "$file" ]; then
     . "$file"
    fi
  done

fi


fif() {
  local text="$1"
  if [ -z "$text" ]; then
    echo "Usage: fif <text_to_search>"
    return 1
  fi
  find . -type f -print0 | xargs -0 grep -i "$text"
}

alias find-in-file='fif'

# Define the mkhash function
function mkhash {
    # Multidimensional array containing hash types and their corresponding lengths
    local HASH_INFO=(
        "base64:any"
        "md5:32"
        "sha1:40"
        "sha256:64"
        "sha512:128"
        "uuid:36"
    )

    function list_hash_types {
        echo -e "[!] You must pass a type and string"
        echo -e " $(printf "%-2s" [Type]) \t$(printf "%12s" [Length])"
        for info in "${HASH_INFO[@]}"; do
            IFS=":" read -r HASH_TYPE LENGTH <<<"$info"
            echo -e " - $(printf "%-8s" "$HASH_TYPE") \t$(printf "%12s" "$LENGTH")" # Right-aligned length
        done
        echo -e "\n"
        return
    }

    # List types and lengths
    if [[ -z "$1" ]]; then
        list_hash_types
        return
    fi

    local HASH_TYPE="$1"
    local STRING="$2"
    local VALID_HASH_TYPE=false
    for info in "${HASH_INFO[@]}"; do
        IFS=":" read -r HASH_TYPE_CHECK _ <<<"$info"
        if [[ "$HASH_TYPE_CHECK" == "$HASH_TYPE" ]]; then
            VALID_HASH_TYPE=true
            break
        fi
    done

    if [[ "$VALID_HASH_TYPE" == false ]]; then
        echo -e "\n[!] Invalid hash type!"
        list_hash_types
        return 1
    fi
    # Check if uuid is passed with a second argument
    if [[ "$HASH_TYPE" == "uuid" && -n "$STRING" ]]; then
        echo "[!] The 'uuid' type does not accept a second argument"
        return 1
    fi

    # Ensure string is provided if the hash type is not uuid
    if [[ "$HASH_TYPE" != "uuid" && -z "$STRING" ]]; then
        echo "[!] You must provide a string to hash, eg: $ mkhash <type> <string>"
        return 1
    fi

    # Perform the hashing based on the type
    case "$HASH_TYPE" in
    base64)
        echo -n "$STRING" | base64
        ;;
    md5)
        echo -n "$STRING" | md5sum | awk '{print $1}'
        ;;
    sha1)
        echo -n "$STRING" | sha1sum | awk '{print $1}'
        ;;
    sha256)
        echo -n "$STRING" | sha256sum | awk '{print $1}'
        ;;
    sha512)
        echo -n "$STRING" | sha512sum | awk '{print $1}'
        ;;
    uuid)
        uuidgen
        ;;
    *)
        echo "[!] Invalid hash type. Available options are:"
        list_hash_types
        return
        ;;
    esac
}
