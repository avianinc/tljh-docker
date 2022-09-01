#!/bin/bash
set -e
curl -L https://tljh.jupyter.org/bootstrap.py \
 | sudo python3 - --show-progress-page $*
