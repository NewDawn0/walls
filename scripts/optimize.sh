#!/usr/bin/env bash
for f in "$1/"*.png; do
    goptimize "$f"
done
