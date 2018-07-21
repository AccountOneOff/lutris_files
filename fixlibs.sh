#!/bin/bash
###This script tries to find and preload other minor versions of the same library.
#eg if you need libcurl.so.5 but you system has libcurl.so.7 installed
_bin=<GAMEBIN>
_basedir="$(dirname "$(readlink -f "${0}")")"
_gamearch=$(file "$_bin"|cut -d ',' -f2)
_missinglibs=$(ldd $_bin|grep 'not found'|cut -d' ' -f1|tr -d '\t')
for _missinglib in $_missinglibs; do
    for _foundlib in $(find /usr/lib -name "${_missinglib/.so.*/.so}*"); do
        _libarch=$(file "$_foundlib"|cut -d ',' -f2)
        if [ "$_libarch" == "$_gamearch" ]; then
            if [ ! -f "$_basedir"/$_missinglib ]; then
                if [ ! -L "$_basedir"/$_missinglib ]; then
                    ln -sfv "$_foundlib" "$_basedir"/$_missinglib
                fi
            fi
        fi
    done
done
cd "$_basedir"
LD_LIBRARY_PATH="$_basedir:$LD_LIBRARY_PATH" exec "./$_bin" "$@"

