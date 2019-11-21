#!/bin/sh

for test in tests/*.exp ; do
(
  set -x
  set -e
  expect $test
)
done
