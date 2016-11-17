#!/usr/bin/env bash
openssl rsautl -encrypt -pubin -inkey <(
  # export HTTPS_PROXY='10.1.0.7:8080'   # uncomment to set proxy for curl
  [[ "$1" != *?/?* ]] && set -- # reset wrong parameter not suitable for API call
  re='"key":"([^"]+)"'
  [[ "$(curl --silent "https://api.travis-ci.org/repos/${1:?Need user/repo as parameter}/key")" =~ $re ]]
  key="${BASH_REMATCH[1]:?Travis pub RSA key not found for repo $1}"
  echo -e "${key//RSA PUBLIC KEY/PUBLIC KEY}" # | tee /dev/stderr   # uncomment to send key copy to stderr
) | openssl base64 -A # encode after encryption without splitting into multiple lines
echo # add newline at the end of encoded text
