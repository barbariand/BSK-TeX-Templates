#!/usr/bin/env bash

# This script compiles main.tex and cleans up auxiliary files.

# Clean the output directories to ensure a fresh build
rm -f ./out/pdf/*
rm -f ./out/aux/*
rm -f ./latex.log

latexmk -pdf -f \
  -interaction=nonstopmode \
  -outdir=./out/aux \
  -out2dir=./out/pdf \
  main.tex

# Move the log file to a cleaner name and location for inspection.
mv ./out/aux/main.log ./latex.log

echo "Compilation finished. PDF is in ./out/pdf/main.pdf"
