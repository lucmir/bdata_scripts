#!/bin/bash

mkdir -p ../graphics/sections_by_genre_and_day_hour
mkdir -p ../graphics/sections_by_genre_and_retention
mkdir -p ../graphics/sections_by_genre_and_section_time
mkdir -p ../graphics/sections_by_genre_and_hours_after_publishing

./runGenerateCCDFNormalDist.sh

for script in `ls -1 *.gp`; do
	gnuplot $script
done;