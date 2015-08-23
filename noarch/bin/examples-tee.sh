#!/bin/bash

command > >(tee stdout.log) 2> >(tee stderr.log >&2)
command 2>&1 | tee stdout.log
