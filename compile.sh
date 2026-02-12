#!/usr/bin/env bash

# Skapa kataloger om de inte finns
mkdir -p ./out/pdf ./out/aux

# Rensa gamla filer
rm -f ./out/pdf/*
rm -f ./out/aux/*
rm -f ./latex_log.txt

# Kör latexmk
# Vi använder -e för att sätta interna Perl-variabler som saknar egna flaggor
latexmk -pdf -f \
  -interaction=nonstopmode \
  -recorder \
  -bibtex- \
  -e '$max_repeat=5;' \
  -auxdir=./out/aux \
  -outdir=./out/pdf \
  main.tex

# Kopiera loggfilen för enklare inspektion
if [ -f "./out/aux/main.log" ]; then
    cp ./out/aux/main.log ./latex_log.txt
fi

echo "Compilation finished. PDF is in ./out/pdf/main.pdf"
