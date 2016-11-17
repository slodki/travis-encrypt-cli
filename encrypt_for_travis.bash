#!/usr/bin/env bash
openssl rsautl -encrypt -pubin -inkey <(
  re='"key":"([^"]+)"'
  [[ "$(curl --silent "https://api.travis-ci.org/repos/$1/key")" =~ $re ]]
  echo -en "${BASH_REMATCH[1]:?Travis pub RSA key not found for repo \"$1\"}"
) | openssl base64 -A
