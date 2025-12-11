#!/usr/bin/env bash
set -euo pipefail

git -C rcheevos checkout "$1"
git add rcheevos
