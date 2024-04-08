#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'
set -o noclobber

has_bom() { head -c3 "$1" | grep -q $'\xef\xbb\xbf'; }

function validate_localization(){

	echo "--------------------------------------------------------------------------------------------------------------------------------"
	declare -i TOTAL=0
	declare -i GOOD=0
	declare -i BAD=0
	
	for f in ./localisation/*.yml
	do
		if [[ "$( has_bom "$f" && file -b --mime-encoding "$f")" = utf-8 ]];then
			# echo -e "${GREEN}{$f} encoding is good.${NC}"
			GOOD+=1
		else
			echo -e "${RED}{$f} encoding is wrong!${NC}"
			file -i $f
			BAD+=1
		fi
		TOTAL+=1
	done
	echo -e "\n		${GREEN}${GOOD}${NC}/${TOTAL} ${GREEN}localization files encoding validated.${NC}\n"
	if [[ $BAD > 0 ]]; then
		echo -e "\n		${RED}${BAD}${NC}/${TOTAL} ${RED}decicion files have a wrong or unknown encoding!${NC}\n"
		exit 1
	fi
}

function validate_events(){
	
	echo "--------------------------------------------------------------------------------------------------------------------------------"
	declare -i TOTAL=0
	declare -i GOOD=0
	declare -i NEUTRAL=0
	declare -i BAD=0
	
	for f in ./events/*.txt ./missions/*.txt
	do
		if [ "$(file -b --mime-encoding "$f")" = us-ascii ];then
			# echo -e "${GREEN}{$f} encoding is good.${NC}"
			GOOD+=1
		elif [ "$(file -b --mime-encoding "$f")" = iso-8859-1 ]; then
			# echo -e "${YELLOW}{$f} encoding is in european ascii!${NC}"
			GOOD+=1
			NEUTRAL+=1
		elif [ "$(file -b --mime-encoding "$f")" = unknown-8bit ]; then
			echo -e "${YELLOW}{$f} encoding is unknown!${NC}"
			file -i $f
			GOOD+=1
			NEUTRAL+=1
		else
			echo -e "${RED}{$f} encoding is wrong!${NC}"
			file -i $f
			BAD+=1
		fi
		TOTAL+=1
	done
	
	echo -e "\n		${GREEN}${GOOD}${NC}/${TOTAL} ${GREEN}files encoding validated.${NC}\n"
	if [[ $NEUTRAL > 0 ]]; then
		echo -e "\n		${YELLOW}${NEUTRAL}${NC}/${TOTAL} ${YELLOW}files encoding are in european ascii or unknown.${NC}\n"
	fi
	if [[ $BAD > 0 ]]; then
		echo -e "\n		${RED}${BAD}${NC}/${TOTAL} ${RED}files have a wrong encoding!${NC}\n"
		exit 1
	fi
}

function validate_decisions(){
	
	echo "--------------------------------------------------------------------------------------------------------------------------------"
	declare -i TOTAL=0
	declare -i GOOD=0
	declare -i NEUTRAL=0
	declare -i BAD=0
	
	for f in ./decisions/*.txt
	do
		if [ "$(file -b --mime-encoding "$f")" = us-ascii ];then
			# echo -e "${GREEN}{$f} encoding is good.${NC}"
			GOOD+=1
		elif [ "$(file -b --mime-encoding "$f")" = iso-8859-1 ]; then
			# echo -e "${YELLOW}{$f} encoding is in european ascii!${NC}"
			# file -i $f
			GOOD+=1
			NEUTRAL+=1
		elif [ "$(file -b --mime-encoding "$f")" = unknown-8bit ]; then
			echo -e "${YELLOW}{$f} encoding is unknown!${NC}"
			file -i $f
			GOOD+=1
			NEUTRAL+=1
		else
			echo -e "${RED}{$f} encoding is wrong!${NC}"
			file -i $f
			BAD+=1
		fi
		TOTAL+=1
	done
	
	echo -e "\n		${GREEN}${GOOD}${NC}/${TOTAL} ${GREEN}decision files encoding validated.${NC}\n"
	if [[ $NEUTRAL > 0 ]]; then
		echo -e "\n		${YELLOW}${NEUTRAL}${NC}/${TOTAL} ${YELLOW}decision files encoding are in european ascii or unknown.${NC}\n"
	fi
	if [[ $BAD > 0 ]]; then
		echo -e "\n		${RED}${BAD}${NC}/${TOTAL} ${RED}decision files have a wrong encoding!${NC}\n"
		exit 1
	fi
}

function validate_indentation(){
	echo "--------------------------------------------------------------------------------------------------------------------------------"
	
	declare -i GOOD=0
	declare -i BAD=0
	declare -i TOTAL=0
	
	for f in ./*/*.txt ./common/*/*.txt
	do
		LEFT=$(LC_ALL=windows-1252 grep -o '^[^#]*' "$f" | grep  -o '{' | wc -l)
		RIGHT=$(LC_ALL=windows-1252 grep -o '^[^#]*' "$f" | grep  -o '}' | wc -l)
		TOTAL+=1
		
		if [ $LEFT != $RIGHT ]; then
			echo "${f}"
			echo -e "${BLUE}${LEFT}${NC}/${CYAN}${RIGHT}${NC} ${RED}Broken syntax, inequal number of brackets.${NC}\n"
			BAD+=1
		else
			GOOD+=1
		fi
	done
	echo -e "\n		${GREEN}${GOOD}${NC}/${TOTAL} ${GREEN} files syntax validated.${NC}\n"
	if [[ $BAD > 0 ]]; then
		echo -e "\n		${RED}${BAD}${NC}/${TOTAL} ${RED} files syntax are wrong!${NC}\n"
		exit 1
	fi
}

function help_function()
{
	echo ""
	echo "Usage: $0 -e -l -d -u"
	echo -e "\t-e Check events and missions folder files encoding"
	echo -e "\t-l Check localization folder files encoding"
	echo -e "\t-d Check decisions folder files encoding"
	echo -e "\t-i Check text file for broken indentation(bracket counting)"
	exit 1
}

while getopts "eldi" opt
do
	case "$opt" in
		e ) validate_events ;;
		l ) validate_localization ;;
		d ) validate_decisions ;;
		i ) validate_indentation ;;
		: ) help_function ;;
		\? ) help_function ;;
	esac
done
