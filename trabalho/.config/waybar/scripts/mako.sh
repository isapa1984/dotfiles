#!/bin/bash

readonly ENABLED=""
readonly DISABLED=""

UNREAD_COUNT=$(makoctl list | jq -e '.data[] | length')
if [ $UNREAD_COUNT -eq 0 ]; then
	echo ""
else
	echo "!"
fi


