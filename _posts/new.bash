#! /usr/bin/env bash
filename="$(date -I)-news.md"

if [ -e ${filename} ]
then
  exit
fi

# create today's file
touch ${filename}

cat <<EOD >${filename}
---
title: $(date +%Y/%m/%d) ニュースとか
---

## 各種リリース

## ニュースとか

## そのた
EOD
