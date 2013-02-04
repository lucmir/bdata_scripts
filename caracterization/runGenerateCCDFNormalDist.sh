#!/bin/bash

INFILE=$1 #distributions/distributions/sections_by_days_after_publishing2

./generateCCDFNormalDist.sh $INFILE.data $INFILE.normal.data 1
./generateCCDFNormalDist.sh $INFILE.data $INFILE.ccdf.data 2
./generateCCDFNormalDist.sh $INFILE.data $INFILE.ccdf.normal.data 3


