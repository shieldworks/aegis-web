#!/usr/bin/env bash

JEKYLL_ENV=production jekyll build

aws s3 sync _site/ s3://aegis.z2h.dev/

aws cloudfront create-invalidation --distribution-id E3LC16VB3C88K6 --paths "/*"