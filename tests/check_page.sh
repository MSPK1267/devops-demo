#!/bin/bash
# Simple automatic checks for the web page.
# If any check fails, this script exits with an error and the pipeline turns red.

FILE="index.html"
FAILED=0

check() {
  # $1 = description, $2 = the command to run
  if eval "$2"; then
    echo "PASS: $1"
  else
    echo "FAIL: $1"
    FAILED=1
  fi
}

check "index.html exists and is not empty" "test -s $FILE"
check "page has a <title>" "grep -q '<title>' $FILE"
check "page contains the words 'Hello, DevOps'" "grep -q 'Hello, DevOps' $FILE"

if [ "$FAILED" -ne 0 ]; then
  echo "Some checks failed. The pipeline will stop here."
  exit 1
fi

echo "All checks passed."
