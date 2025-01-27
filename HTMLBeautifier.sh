#!/bin/bash

  if [ -z "$1" ]; then
  echo "Please specify an HTML file."
  exit 1
  fi
  if [[ -f "$1" ]]; then
    old_code=$(cat "$1")
  else
    old_code="$1"
  fi

  arr=("area" "base" "br" "col" "embed" "hr" "img" "input" "link" "meta" "source" "track" "wbr" "param" "!DOCTYPE" "!--")
  old_code=$(echo "$old_code" | sed -e 's/^[ \t]*//')
  old_code=$(echo "$old_code" | sed -e 's/[ \t]*$//')
  old_code=$(echo "$old_code" | sed -e 's/[[:space:]]\+/ /g')
  old_code=$(echo "$old_code" | sed -e ':a;N;$!ba;s/\n//g')
  old_code=$(echo "$old_code" | sed 's/>[[:space:]]</></')
  nr_of_tabs=0
  modified_code=""

  while [[ $old_code =~ ^\<[^\>]*\> ]] || [[ $old_code =~ [^\<]* ]]; do     #moving on the tags
    tag="${BASH_REMATCH[0]}"				                                        #saving everything between < and > in "tag"
    old_code="${old_code#${BASH_REMATCH[0]}}"		                            #erase the selected tag so I don't reselect it again
    modtag=$(echo "$tag" | grep -oP '(?<=\<)[^ /\>]+')
    if [[ "$tag" =~ ^\<[^/]*$ ]]; then		                                  #if it is an open tag
      found=false
      for elem in "${arr[@]}"; do                                           #I check if the key-word for my tag is a self-closing tag
    	if [[ "$elem" == "$modtag" ]]; then
        	found=true
		      break
    	fi
      done
      if [[ "$found" == true ]]; then
	        modified_code+="$(printf '%*s' $((nr_of_tabs * 4)) '')$tag "
      else
	        modified_code+="$(printf '%*s' $((nr_of_tabs * 4)) '')$tag "
          ((nr_of_tabs++))
      fi
    elif [[ "$tag" =~ ^\</[^\>]*\>$ ]]; then		                            #if it is a closing tag
        ((nr_of_tabs--))					
        modified_code+="$(printf '%*s' $((nr_of_tabs * 4)) '')$tag "	
    else						                                                        #else it is content and we don't need to modify the number of tabs
      	modified_code+="$(printf '%*s' $((nr_of_tabs * 4)) '')$tag "
    fi
        modified_code+="$(printf '%*s')\n"

    if [[ -z "$old_code" ]]; then
      break
    fi
done
  #for a proper aspect, if the content is too long, I section it in more lines
  modified_code=$(echo "$modified_code" | sed 's/>[[:space:]]*</>\\n</g')	
  echo -e "$modified_code"    