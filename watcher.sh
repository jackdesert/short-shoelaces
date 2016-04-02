#! /bin/bash

watchmedo shell-command --pattern '*.slim' --command 'plimc index.slim > generatedndex.html; echo "${watch_src_path}"'
