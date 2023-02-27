#!/usr/bin/env bash

JEKYLL_ENV=production jekyll build

aws s3 sync _site/ s3://aegis.ist/
# Sync with alternate site too until S3 redirection rules propagate to all origins.
aws s3 sync _site/ s3://aegis.ist/

aws cloudfront create-invalidation --distribution-id EZFGMY32S3BBS --paths "/*"