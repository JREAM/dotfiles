#!/bin/bash

 file_list=()
 while IFS= read -d $"\0" -r file ; do
     file_list=("${file_list[@]}" "$file")
 done < <(find . -print0)

 echo "${file_list[@]}"
