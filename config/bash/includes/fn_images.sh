#!/bin/bash
#!/bin/bash
# ┌─────────────────────────────────────────────────────────────────┐
# │ includes/fn 																										│
# └─────────────────────────────────────────────────────────────────┘

# Multiple Utilities
# ──────────────────────────────────────────────────────────────────

# Function to resize an image by percentage, maintaining aspect ratio.
# Arguments:
#   $1: Input image file path
#   $2: Output image file path
#   $3: Resize percentage (e.g., 50 for 50%)
resize_by_percent() {
  local input_file="$1"
  local output_file="$2"
  local percentage="$3"

  if [ ! -f "$input_file" ]; then
    echo "Error: Input file '$input_file' not found." >&2
    return 1
  fi
  if [[ ! "$percentage" =~ ^[0-9]+$ ]]; then #Basic check for integer
      echo "Error: Percentage must be a number." >&2
      return 1
  fi


  convert "$input_file" -resize "$percentage%" "$output_file"

  if [ $? -eq 0 ]; then
    echo "Image resized by $percentage% and saved to $output_file"
  else
    echo "Error: Failed to resize image." >&2
    return 1
  fi
}

# Function to resize an image by pixel width, maintaining aspect ratio.
# Arguments:
#   $1: Input image file path
#   $2: Output image file path
#   $3: Desired width in pixels
resize_by_width() {
  local input_file="$1"
  local output_file="$2"
  local width="$3"

  if [ ! -f "$input_file" ]; then
    echo "Error: Input file '$input_file' not found." >&2
    return 1
  fi
    if [[ ! "$width" =~ ^[0-9]+$ ]]; then #Basic check for integer
      echo "Error: Width must be a number." >&2
      return 1
  fi

  convert "$input_file" -resize "$width"x "$output_file"

  if [ $? -eq 0 ]; then
    echo "Image resized to width $width and saved to $output_file"
  else
    echo "Error: Failed to resize image." >&2
    return 1
  fi
}

# Function to resize an image by pixel height, maintaining aspect ratio.
# Arguments:
#   $1: Input image file path
#   $2: Output image file path
#   $3: Desired height in pixels
resize_by_height() {
  local input_file="$1"
  local output_file="$2"
  local height="$3"

  if [ ! -f "$input_file" ]; then
    echo "Error: Input file '$input_file' not found." >&2
    return 1
  fi
    if [[ ! "$height" =~ ^[0-9]+$ ]]; then #Basic check for integer
      echo "Error: Height must be a number." >&2
      return 1
  fi

  convert "$input_file" -resize x"$height" "$output_file"

  if [ $? -eq 0 ]; then
    echo "Image resized to height $height and saved to $output_file"
  else
    echo "Error: Failed to resize image." >&2
    return 1
  fi
}

# Function to reduce image file size (quality) using ImageMagick's -quality option.
# Arguments:
#   $1: Input image file path
#   $2: Output image file path
#   $3: Quality level (0-100, where 100 is best quality and largest file size)
reduce_image_size() {
  local input_file="$1"
  local output_file="$2"
  local quality="$3"

  if [ ! -f "$input_file" ]; then
    echo "Error: Input file '$input_file' not found." >&2
    return 1
  fi

  if [[ ! "$quality" =~ ^[0-9]+$ ]] || [[ "$quality" -lt 0 ]] || [[ "$quality" -gt 100 ]]; then
    echo "Error: Quality must be a number between 0 and 100." >&2
    return 1
  fi


  convert "$input_file" -quality "$quality" "$output_file"

  if [ $? -eq 0 ]; then
    echo "Image quality reduced to $quality and saved to $output_file"
  else
    echo "Error: Failed to reduce image size." >&2
    return 1
  fi
}

# Function to convert an image to a different format.
# Arguments:
#   $1: Input image file path
#   $2: Desired output format (e.g., jpg, png, gif, webp)
#   $3: Output image file name (without extension, it will use $2's value)
convert_image_format() {
  local input_file="$1"
  local output_format="$2"
  local output_file_name="$3"

  if [ ! -f "$input_file" ]; then
    echo "Error: Input file '$input_file' not found." >&2
    return 1
  fi

  # Basic format validation (this could be expanded for more robust checking)
  case "$output_format" in
    jpg|jpeg|png|gif|webp|tif|tiff|bmp|svg) ;;
    *)
      echo "Error: Unsupported output format '$output_format'." >&2
      return 1
      ;;
  esac

  local output_file="$output_file_name.$output_format"

  convert "$input_file" "$output_file"

  if [ $? -eq 0 ]; then
    echo "Image converted to $output_format and saved to $output_file"
  else
    echo "Error: Failed to convert image format." >&2
    return 1
  fi
}
