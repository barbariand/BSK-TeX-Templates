#! /usr/bin/env bash
latexmk -outdir=./out/aux/ -out2dir=./out/pdf/
mv ./out/aux/main.log ./latex.log
