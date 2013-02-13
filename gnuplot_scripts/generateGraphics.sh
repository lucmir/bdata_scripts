#!/bin/bash

./runGenerateCCDFNormalDist.sh

for script in `ls -1 *.gp`; do
	gnuplot $script
done;