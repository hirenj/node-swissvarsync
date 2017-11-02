#!/bin/bash

taxids=$1

if [ ! -e dist ]; then
	mkdir dist;
fi

if [ ! -e sources/swissvar.tsv ]; then
	curl 'http://swissvar.expasy.org/cgi-bin/swissvar/result?format=tab' > sources/swissvar.tsv
	if [ $? -gt 0 ]; then
		exit 1
	fi
fi
runrecipe --input sources --output json --env version="$TARGETVERSION" --env git="$GIT_STATUS" --env timestamp="$(date -u +%FT%TZ)" --env taxid="9606"
mv json/sources_swissvar.json dist/swissvar-9606.json
done