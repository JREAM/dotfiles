#!/bin/bash
# ┌─────────────────────────────────────────────────────────────────┐
# │ includes/fn 																										│
# └─────────────────────────────────────────────────────────────────┘

# Compress Files
# ──────────────────────────────────────────────────────────────────
# Function to compress files or directories

compress() {
  local path="$1"
  local output_file

  if [ -z "$path" ]; then
    echo "Usage: compress <path>" >&2
    return 1
  fi

  if [ ! -e "$path" ]; then
    echo "Error: Path '$path' does not exist." >&2
    return 1
  fi

  # Determine if it's a file or directory for the default output filename
  if [ -f "$path" ]; then
    output_file=$(basename "$path")
  elif [ -d "$path" ]; then
    output_file=$(basename "$path")
  else
    echo "Error: '$path' is neither a file nor a directory." >&2
    return 1
  fi

  echo "Select compression format:"
  select format in zip tar.gz tar gzip xz; do
    case $format in
      zip)
        output_file="${output_file}.zip"
        zip -r "$output_file" "$path"
        break
        ;;
      tar.gz)
        output_file="${output_file}.tar.gz"
        tar -czvf "$output_file" "$path"
        break
        ;;
      tar)
        output_file="${output_file}.tar"
        tar -cvf "$output_file" "$path"
        break
        ;;
      gzip)
        if [ -d "$path" ]; then
           echo "Error: gzip can only compress single files, not directories.  Use tar.gz for directories." >&2
           return 1
        fi
        output_file="${output_file}.gz"
        gzip -k "$path"  # -k keeps the original file
        mv "${path}.gz" "$output_file" #Rename to user's desired output name.
        break
        ;;
      xz)
          if [ -d "$path" ]; then
           echo "Error: xz can only compress single files, not directories.  Use tar with xz compression (-J)." >&2
           return 1
        fi
        output_file="${output_file}.xz"
        xz -k "$path"  # -k keeps the original file
        mv "${path}.xz" "$output_file"
        break
        ;;

      *)
        echo "Invalid choice." >&2
        return 1  # Exit the function on invalid input
        ;;
    esac
  done

  if [ $? -eq 0 ]; then
    echo "Compressed '$path' to '$output_file'"
  else
    echo "Error: Compression failed." >&2
    return 1
  fi
}


# Function to decompress files
decompress() {
  local file="$1"

  if [ -z "$file" ]; then
    echo "Usage: decompress <file>" >&2
    return 1
  fi

  if [ ! -f "$file" ]; then
    echo "Error: File '$file' not found." >&2
    return 1
  fi

  case "$file" in
    *.zip)
      unzip "$file"
      ;;
    *.tar.gz|*.tgz)
      tar -xzvf "$file"
      ;;
    *.tar.bz2|*.tbz2)
      tar -xjvf "$file"
      ;;
    *.tar.xz|*.txz)
      tar -xJvf "$file"
      ;;
    *.tar)
      tar -xvf "$file"
      ;;
    *.gz)
      gunzip "$file"
      ;;
    *.xz)
      unxz "$file"
      ;;
    *)
      echo "Error: Unsupported compression format for '$file'." >&2
      return 1
      ;;
  esac

  if [ $? -eq 0 ]; then
    echo "Decompressed '$file'"
  else
    echo "Error: Decompression failed." >&2
    return 1
  fi
}
