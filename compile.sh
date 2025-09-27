#! /usr/bin/env bash
latexmk -pdf -outdir=./out/aux/ -out2dir=./out/pdf/ main.tex
mv ./out/aux/main.log ./latex.log
