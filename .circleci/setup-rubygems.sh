#!/usr/bin/env bash

mkdir -p ~/.gem
CREDS=~/.gem/credentials

if [ ! -v RUBYGEMS_API_KEY ]; then
  echo "Error: The ENV variable RUBYGEMS_API_KEY is required"
  exit 1
fi

if [ -f $CREDS ]; then
  echo "Error: Existing credentials '$CREDS' will not be overwritten"
  exit 1
else
  echo -e "---\r\n:rubygems_api_key: $RUBYGEMS_API_KEY" > $CREDS
  chmod 0600 $CREDS
fi
