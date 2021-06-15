#!/bin/sh
curl "https://api.hh.ru/vacancies?text=data%20scientist" | jq '.'
