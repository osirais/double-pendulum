#!/bin/bash
set -e

cd "$(dirname "$0")"

dune build
dune exec double_pendulum
