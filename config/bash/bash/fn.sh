#!/bin/bash
# ╔═════════════════════════════════════════════════════════════════╗
# ║ FUNCTIONS                                                       ║
# ╚═════════════════════════════════════════════════════════════════╝

# ┌─────────────────────────────────────────────────────────────────┐
# │ Include Management                                              │
# └─────────────────────────────────────────────────────────────────┘
# Load includes if they exise
INCLUDE_DIR="/home/jesse/.config/bash/includes"
if [ -d "$INCLUDE_DIR" ]; then
  mapfile -d $'\0' -t files < <(find "$INCLUDE_DIR" -name "*.sh" -print0)
  for file in "${files[@]}"; do
    [[ -r "$file" ]] && . "$file"
  done
fi

# ┌─────────────────────────────────────────────────────────────────┐
# │ Hash Generation Functions                                       │
# └─────────────────────────────────────────────────────────────────┘
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

# ┌─────────────────────────────────────────────────────────────────┐
# │ Mouse Movement Functions                                        │
# └─────────────────────────────────────────────────────────────────┘
# Usage: mm
mm() {
	LENGTH=1
	DELAY=5

	# Show rotating indicator while running
	echo "Mouse movement active... Press Ctrl+C to stop"

	while true; do
		for ANGLE in 0 90 180 270; do
			xdotool mousemove_relative --polar $ANGLE $LENGTH
			# Show rotating indicator with circular animation
			case $ANGLE in
				0)   echo -ne "\r•     ' '" ;;
				90)  echo -ne "\r '•    '" ;;
				180) echo -ne "\r '  •  '" ;;
				270) echo -ne "\r '    •'" ;;
			esac
			sleep $DELAY
		done
	done
}

# ┌─────────────────────────────────────────────────────────────────┐
# │ File Renaming Functions                                         │
# └─────────────────────────────────────────────────────────────────┘
# Rename Files
# ──────────────────────────────────────────────────────────────────
# Usage: rn lower <files>
rename_files() {
	local transform="$1"
	shift # Remove the first argument (transform type)

	if [[ -z "$1" ]]; then
		echo "Usage: $transform <file|folder|folder/*|*.ext>"
		return 1
	fi

	for file in "$@"; do
		if [[ ! -e "$file" ]]; then
			echo "Error: '$file' does not exist."
			continue
		fi

		if [[ -d "$file" && "$file" != *'/'* ]]; then
			continue # Skip renaming folders unless explicitly selected
		fi

		dir=$(dirname -- "$file")
		base=$(basename -- "$file")

		# Apply the selected transformation
		case "$transform" in
		lower) new_name=$(echo "$base" | tr '[:upper:]' '[:lower:]') ;;
		upper) new_name=$(echo "$base" | tr '[:lower:]' '[:upper:]') ;;
		dasherize)
			new_name=$(echo "$base" | tr '[:upper:]' '[:lower:]' | sed -E 's/[ _]+/-/g')
			;;
		snakeify)
			new_name=$(echo "$base" | tr '[:upper:]' '[:lower:]' | sed -E 's/[- _]+/_/g')
			;;
		spacify)
			new_name=$(echo "$base" | tr '[:upper:]' '[:lower:]' | sed -E 's/[-_]+/ /g')
			;;
		ucwords)
			# Uppercase first letter of each word (words split by space, underscore, or dash)
			new_name=$(echo "$base" | sed -E 's/([[:lower:]])([[:space:]]|[_\-])/\1\U\2/g')
			new_name=$(echo "$new_name" | sed -E 's/([[:space:]]|[_\-])([[:lower:]])/\1\U\2/g')
			;;
		*)
			echo "Unknown transformation: $transform"
			return 1
			;;
		esac

		if [[ "$base" != "$new_name" ]]; then
			mv -- "$file" "$dir/$new_name"
		fi
	done
}

# Transform Functions
lower() { rename_files lower "$@"; }
upper() { rename_files upper "$@"; }
dasherize() { rename_files dasherize "$@"; }
snakeify() { rename_files snakeify "$@"; }
spacify() { rename_files spacify "$@"; }
ucwords() { rename_files ucwords "$@"; }

# Generic rename function that can call any of the methods
rn() {
	if [[ "$1" == "-h" || "$1" == "--help" ]]; then
		echo "Usage: rn <method> <file|folder|folder/*|*.ext>"
		echo
		echo "Available transformations:"
		echo "  lower      - Convert filename to lowercase"
		echo "  upper      - Convert filename to uppercase"
		echo "  dasherize  - Convert spaces, underscores, and multiple dashes to a single dash (-) and lowercase"
		echo "  snakeify   - Convert spaces, dashes, and underscores to underscores (_) and lowercase"
		echo "  spacify    - Convert spaces, underscores, and dashes to spaces and lowercase"
		echo "  ucwords    - Uppercase the first letter of each word (split by spaces, dashes, or underscores)"
		echo
		echo "Examples:"
		echo "  rn lower *.txt        # Apply lowercase to all .txt files"
		echo "  rn ucwords folder/*   # Capitalize first letter of each word in all files inside folder/"
		return 0
	fi

	if [[ -z "$1" || -z "$2" ]]; then
		echo "Usage: rn <method> <file|folder|folder/*|*.ext>"
		return 1
	fi

	local method="$1"
	shift
	case "$method" in
	lower | upper | dasherize | snakeify | spacify | ucwords)
		rename_files "$method" "$@"
		;;
	*)
		echo "Invalid method. Valid methods are: lower, upper, dasherize, snakeify, spacify, ucwords."
		return 1
		;;
	esac
}

# ┌─────────────────────────────────────────────────────────────────┐
# │ Compression Function                                            │
# └─────────────────────────────────────────────────────────────────┘
compress() {
  local path="$1"
  local output_file

  [[ -z "$path" ]] && { echo "Usage: compress <path>" >&2; return 1; }
  [[ ! -e "$path" ]] && { echo "Error: Path '$path' does not exist." >&2; return 1; }

  # Set output filename based on input path
  output_file=$(basename "$path")
  [[ ! -f "$path" && ! -d "$path" ]] && { echo "Error: '$path' is neither a file nor a directory." >&2; return 1; }

  # Compression format selection
  echo "Select compression format:"
  select format in zip tar.gz tar gzip xz; do
    case $format in
      zip)
        output_file="${output_file}.zip"
        zip -r "$output_file" "$path"
        ;;
      tar.gz)
        output_file="${output_file}.tar.gz"
        tar -czvf "$output_file" "$path"
        ;;
      tar)
        output_file="${output_file}.tar"
        tar -cvf "$output_file" "$path"
        ;;
      gzip|xz)
        if [[ -d "$path" ]]; then
          echo "Error: ${format} can only compress single files, not directories. Use tar.gz instead." >&2
          return 1
        fi
        output_file="${output_file}.${format}"
        "${format}" -k "$path"  # -k keeps the original file
        mv "${path}.${format}" "$output_file"
        ;;
      *)
        echo "Invalid choice." >&2
        return 1
        ;;
    esac
    break
  done

  [[ $? -eq 0 ]] && echo "Compressed '$path' to '$output_file'" || { echo "Error: Compression failed." >&2; return 1; }
}

# ┌─────────────────────────────────────────────────────────────────┐
# │ Extraction Function                                             │
# └─────────────────────────────────────────────────────────────────┘
extract() {
  local file="$1"

  [[ -z "$file" ]] && { echo "Usage: decompress <file>" >&2; return 1; }
  [[ ! -f "$file" ]] && { echo "Error: File '$file' not found." >&2; return 1; }

  # Extract based on file extension
  case "$file" in
    *.zip)     unzip "$file" ;;
    *.tar.gz|*.tgz)  tar -xzvf "$file" ;;
    *.tar.bz2|*.tbz2) tar -xjvf "$file" ;;
    *.tar.xz|*.txz)   tar -xJvf "$file" ;;
    *.tar)     tar -xvf "$file" ;;
    *.gz)      gunzip "$file" ;;
    *.xz)      unxz "$file" ;;
    *)         echo "Error: Unsupported compression format for '$file'." >&2; return 1 ;;
  esac

  [[ $? -eq 0 ]] && echo "Decompressed '$file'" || { echo "Error: Decompression failed." >&2; return 1; }
}

alias bashfiles="cd ${XDG_CONFIG_HOME}/bash"

bashedit() {
  local files
  local selected_file
  local editor="${EDITOR:-vim}"
  local bash_config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/bash"

  # Get files from the bash config directory
  local config_files=$(find "$bash_config_dir" -type f -name "*.sh" 2>/dev/null | sort)

  # Add ~/.bashrc to the list, handling the case where it doesn't exist
  local bashrc_file="$HOME/.bashrc"
  if [[ -f "$bashrc_file" ]]; then
    files="$bashrc_file"
    if [[ -n "$config_files" ]]; then # Only append if there were files
      files+=$'\n'"$config_files"
    fi
  else
      files="$config_files" # only other files, bashrc doesn't exists
      if [[ -z "$files" ]]; then # no files found at all
        echo "No .sh files found in $bash_config_dir and ~/.bashrc does not exist."
        return 1
      fi
  fi

  if command -v fzf &> /dev/null; then
    selected_file=$(echo "$files" | fzf --height 40% --layout=reverse --border --prompt="Select a Bash Dotfile to edit > ")

    if [[ -n "$selected_file" ]]; then
      "$editor" "$selected_file"
    fi
  else
    echo "fzf is not installed. Please install fzf for interactive file selection."
    echo "Files found:"
    echo "$files"
    echo "Please select a file to edit and manually open it with $EDITOR."
    return 1
  fi
}

backup_dotfiles() {
  local target_dir="$HOME/dotfiles"
  local config_dir="$target_dir/config"
  local source_config_dir="${XDG_CONFIG_HOME:-$HOME/.config}"

  # Prompt for confirmation
  read -r -p "This will overwrite files in $target_dir. Continue? (y/N) " response
  case "$response" in
    [yY]*)
      # Proceed with the backup
      ;;
    *)
      echo "Operation cancelled."
      return 1
      ;;
  esac

  # Create the target directories if they don't exist
  mkdir -p "$target_dir" "$config_dir"

  # --- Copy ~/.bashrc to the root of dotfiles ---
  local bashrc_source="$HOME/.bashrc"
  local bashrc_target="$target_dir/.bashrc"

  if [[ -f "$bashrc_source" ]]; then
    cp -f "$bashrc_source" "$bashrc_target"  # Force overwrite
    echo "Copied: $bashrc_source -> $bashrc_target"
  else
    echo "Warning: $bashrc_source does not exist."
  fi


  # --- Copy directories from $XDG_CONFIG_HOME ---
  local dirs=(bash git vim terminator bash_completion docker readline wgetrc X11)
  local source_dir
  local target_dir_specific

  for dir in "${dirs[@]}"; do
    source_dir="$source_config_dir/$dir"
    target_dir_specific="$config_dir/$dir"

    if [[ -d "$source_dir" ]]; then
      # -r for recursive, -f to force overwrite, -p to preserve timestamps/permissions
      cp -rfp "$source_dir" "$target_dir_specific"
      echo "Copied: $source_dir -> $target_dir_specific"
    elif [[ -f "$source_dir" ]]; then
      # If it is a file, not a directory.
      mkdir -p "$target_dir_specific" # ensures the parent directory is created.
      cp -fp "$source_dir" "$target_dir_specific"
      echo "Copied: $source_dir -> $target_dir_specific"
    else
      echo "Warning: $source_dir does not exist."
    fi
  done

    # --- Commit changes to Git ---
    if [[ -d "$target_dir/.git" ]]; then  # Check if it's a Git repository
        cd "$target_dir" || { echo "Failed to cd into $target_dir"; return 1; }
        git add .
        git commit -m "Automatic dotfiles backup"
        echo "Changes committed to Git repository in $target_dir"
        cd - &> /dev/null || return 1 # go back to previous dir, and handle error

    else
        echo "Warning: $target_dir is not a Git repository.  Changes were not committed."
    fi

  echo "Dotfiles backup complete."
}
