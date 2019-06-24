#! /bin/sh

docker run -it --env-file=.env -e "CONFIG=$(cat substrate.json | jq -r tostring)" algolia/docsearch-scraper
