#!/bin/bash
# ╔═════════════════════════════════════════════════════════════════╗
# ║ FN_IMAGES                                                       ║
# ╚═════════════════════════════════════════════════════════════════╝

# ┌─────────────────────────────────────────────────────────────────┐
# │ Image Manipulation Functions                                     │
# └─────────────────────────────────────────────────────────────────┘

# Common validation function for image operations
_validate_file_input() {
    [[ ! -f "$1" ]] && echo "Error: Input file '$1' not found." >&2 && return 1
    return 0
}

# Validate numeric input within optional range
_validate_number() {
    local num=$1 min=$2 max=$3
    [[ ! "$num" =~ ^[0-9]+$ ]] && echo "Error: Value must be a number." >&2 && return 1
    [[ -n "$min" && "$num" -lt "$min" ]] && echo "Error: Value must be >= $min." >&2 && return 1
    [[ -n "$max" && "$num" -gt "$max" ]] && echo "Error: Value must be <= $max." >&2 && return 1
    return 0
}

# Resize image by percentage
# Usage: resize_by_percent input_file output_file percentage
resize_by_percent() {
    local input_file="$1" output_file="$2" percentage="$3"

    _validate_file_input "$input_file" || return 1
    _validate_number "$percentage" || return 1

    convert "$input_file" -resize "$percentage%" "$output_file" &&
        echo "Image resized by $percentage% and saved to $output_file" ||
        { echo "Error: Failed to resize image." >&2; return 1; }
}

# Resize image by width
# Usage: resize_by_width input_file output_file width
resize_by_width() {
    local input_file="$1" output_file="$2" width="$3"

    _validate_file_input "$input_file" || return 1
    _validate_number "$width" || return 1

    convert "$input_file" -resize "$width"x "$output_file" &&
        echo "Image resized to width $width and saved to $output_file" ||
        { echo "Error: Failed to resize image." >&2; return 1; }
}

# Resize image by height
# Usage: resize_by_height input_file output_file height
resize_by_height() {
    local input_file="$1" output_file="$2" height="$3"

    _validate_file_input "$input_file" || return 1
    _validate_number "$height" || return 1

    convert "$input_file" -resize x"$height" "$output_file" &&
        echo "Image resized to height $height and saved to $output_file" ||
        { echo "Error: Failed to resize image." >&2; return 1; }
}

# Reduce image quality
# Usage: reduce_image_size input_file output_file quality(0-100)
reduce_image_size() {
    local input_file="$1" output_file="$2" quality="$3"

    _validate_file_input "$input_file" || return 1
    _validate_number "$quality" 0 100 || return 1

    convert "$input_file" -quality "$quality" "$output_file" &&
        echo "Image quality reduced to $quality and saved to $output_file" ||
        { echo "Error: Failed to reduce image size." >&2; return 1; }
}

# Convert image format
# Usage: convert_image_format input_file output_format output_filename
convert_image_format() {
    local input_file="$1" output_format="$2" output_file="$3.$2"
    local valid_formats="jpg|jpeg|png|gif|webp|tif|tiff|bmp|svg"

    _validate_file_input "$input_file" || return 1
    [[ ! "$output_format" =~ ^($valid_formats)$ ]] &&
        echo "Error: Unsupported output format '$output_format'." >&2 && return 1

    convert "$input_file" "$output_file" &&
        echo "Image converted to $output_format and saved to $output_file" ||
        { echo "Error: Failed to convert image format." >&2; return 1; }
}
