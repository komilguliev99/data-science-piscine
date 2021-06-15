#!/bin/sh
echo "\"id\",\"created_at\",\"name\",\"has_test\",\"alternate_url\"" > hh.csv
./filter.jq >> hh.csv
