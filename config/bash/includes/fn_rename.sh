#!/bin/bash
# ┌─────────────────────────────────────────────────────────────────┐
# │ includes/fn 																										│
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

# Define the functions
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
