#!/bin/sh
# SPDX-License-Identifier: GPL-3.0-or-later
#
# code2pdf -- convert code to pdf
# Copyright (C) 2024  Jacob Koziej <jacobkoziej@gmail.com>

test -z "$1" && echo "usage: $0 INPUT [OUTPUT]" && exit 1

TMPDIR=$(mktemp -d)
trap 'rm -rf '"$TMPDIR"'; exit 1' HUP INT TERM

INPUT="$1"
BASENAME="$(basename "${INPUT%%.*}")"
BASEDIR="$(dirname "$INPUT")"
TITLEFILE="$TMPDIR/title"
TEXOUTPUT="$TMPDIR/$BASENAME.tex"
PDFOUTPUT="$TMPDIR/$BASENAME.pdf"
OUTPUT="${2:-$BASEDIR/$BASENAME.pdf}"

die()
{
	rm -rf "$TMPDIR"
	exit 1
}

echo "$INPUT" > "$TITLEFILE"

pygmentize \
	"$INPUT" \
	-P full=true \
	-P linenos=true \
	-P preamble='\usepackage[margin=2cm,paper=letterpaper]{geometry}' \
	-P title="\\vspace{-1em}\\VerbatimInput{$TITLEFILE}" \
	-o "$TEXOUTPUT" ||
	die

lualatex \
	--halt-on-error \
	--output-directory="$TMPDIR" \
	"$TEXOUTPUT" ||
	die

mv "$PDFOUTPUT" "$OUTPUT"
rm -rf "$TMPDIR"
