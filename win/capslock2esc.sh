#!/bin/sh

VERSION="0.2.2"

if [ ! -f "uncap.exe" ]; then
	echo "downloading uncap.exe"
	curl -L -o uncap.exe  https://github.com/susam/uncap/releases/download/$VERSION/uncap.exe
	chmod 755 uncap.exe
fi

echo "calling uncap (stop with 'cygstart uncap -k') ..."
cygstart uncap.exe
exit $?
