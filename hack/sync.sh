#!/usr/bin/env bash

aws s3 sync _site/ s3://aegis.z2h.dev/

aws cloudfront create-invalidation --distribution-id E3MLHQAOCB8LIM --paths "/*"