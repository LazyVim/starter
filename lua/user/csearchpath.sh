#!/usr/bin/env bash

#export CPPFLAGS=""
#export CFLAGS=-std=c99
#export CXXFLAGS=-Weffc++

function cdefines() {
	local regexp="^#include\s+(<|\")\.\.\.(>|\")\s+search\s+starts\s+here:$"

	while read -r line; do
		echo "$line"
	done <<<"$(${CXX} "${CPPFLAGS}" -xc++ -E -dM - </dev/null 2>&1)"
}

function csearchpaths() {
	local do_print=0
	local regexp="^#include\s+(<|\")\.\.\.(>|\")\s+search\s+starts\s+here:$"

	while read -r line; do
		if [[ "${line}" =~ $regexp ]]; then
			echo "${line}"
			do_print=1
			continue
		elif [ "End of search list." == "${line}" ]; then
			do_print=0
		else
			:
		fi
		if [ "${do_print}" == "1" ]; then
			echo "${line}"
		fi

	done <<<"$(${CXX} "${CPPFLAGS}" -xc++ -E -v - </dev/null 2>&1)"
}
