#!/usr/bin/env bash

# Verifies that Docker is running
function isDockerRunning {
  echo '🧐 Verify that Docker is running'

  docker info > /dev/null 2>&1
  DOCKER_INFO=$?

  if [[ ${DOCKER_INFO} -gt 0 ]]; then
    echo '😓 Docker is not running'
    return 1
  fi

  echo '🐳 Docker is running'
  return 0
}
