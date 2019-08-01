#!/usr/bin/env bash

# Requirements:
# * jq https://stedolan.github.io/jq/

# Returns the path where ngrok is running
function getNgrokPath {
  echo '🔎 Verify that ngrok is running'

  NGROK_PATH=$(curl http://localhost:4040/api/tunnels | jq -r '.tunnels[0].public_url')

  if [[ -z ${NGROK_PATH} ]]; then
    echo '😟 ngrok is not running'
    return 0
  fi

  echo "🚇 ngrok running at ${NGROK_PATH}"

  return ${NGROK_PATH}
}

