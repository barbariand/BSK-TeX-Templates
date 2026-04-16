#!/usr/bin/env bash

mkdir -p ./out/pdf ./out/aux

rm -f ./out/pdf/*
rm -f ./out/aux/*
rm -f ./latex_log.txt

latexmk -pdf -quiet\
  -interaction=nonstopmode \
  -recorder \
  -bibtex- \
  -e '$max_repeat=5;' \
  -auxdir=./out/aux \
  -outdir=./out/pdf \
  main.tex

if [ -f "./out/aux/main.log" ]; then
    cp ./out/aux/main.log ./latex_log.txt
fi

echo "Compilation finished. PDF is in ./out/pdf/main.pdf"
