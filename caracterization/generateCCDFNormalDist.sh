#!/bin/bash

#
#   Script to generate a normal distribution
#   from a distribution 
#

INFILE=$1         # input file with the distribution
OUTFILE=$2        # output file with the generated distribution
MODE=$3           # mode: 1: normal; 2: CCDF; 3: CCDF normal

# get the total sum of values
TOTAL=`awk -F " " 'BEGIN {x=0} {x=x+$2} END { print x }' $INFILE`;
echo "Total sum of values: $TOTAL";

# generate the normal distribution
if [ $MODE = 1 ]; then
    awk -v total="$TOTAL" -F " " '{print $1" "($2/total)}' $INFILE > $OUTFILE;
fi;

# generate the CCDF distribution
if [ $MODE = 2 ]; then
    # generate the CCDF distribution
    awk -v total="$TOTAL" -F " " 'BEGIN{somaAnt=0;}{ print $1" "(total-somaAnt); somaAnt=somaAnt+$2;}' $INFILE > $OUTFILE;
fi;

# generate the CCDF normal distribution
if [ $MODE = 3 ]; then
    # generate the CCDF normal distribution
    awk -v total="$TOTAL" -F " " 'BEGIN{somaAnt=0;}{ print $1" "((total-somaAnt)/total); somaAnt=somaAnt+$2;}' $INFILE > $OUTFILE;
fi;

