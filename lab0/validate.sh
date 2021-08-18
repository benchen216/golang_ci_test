#!/bin/bash

test_path="${BASH_SOURCE[0]}"
solution_path="$(realpath .)"
tmp_dir=$(mktemp -d -t lab0-XXXXXXXXXX)

echo "working directory: $tmp_dir"
cd $tmp_dir

#rm -rf *
cp $solution_path/helloworld.go .
result=$(go run helloworld.go 2>&1) ; ret=$?
if [ $ret -ne 0 ] ; then
  echo "\"./helloworld.go\" fails ; NO POINT"
else
  echo "\"./helloworld.go helloworld.go\" output: \"$result\""
  if [ "hello world" != "$(echo $result)" ] ; then
    echo "wrong number ; NO POINT"
  else
    echo "GET POINT 1"
  fi
fi

echo "deleting working directory $tmp_dir"
rm -rf $tmp_dir

exit 0