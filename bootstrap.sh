#!/usr/bin/env bash

case "$(uname -s)" in
  Linux*) . linux/bootstrap.sh;;
  Darwin*) . darwin/bootstrap.sh;;
  *) echo "Unknown system $(uname -s)"
esac
