reset
set term postscript eps 20 enhanced color
set encoding utf8
set key right bottom

set xtics 0.1
set log y

set title "Retention Distribution"
set xlabel "retention"
set ylabel "ocurrences"

set output "../graphics/sections_by_retention.eps"
plot[][] "../../outputs/distributions/sections_by_retention.data" using 1:2 title '' with linespoint lw 3


set title "Retention Distribution"
set xlabel "retention"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_retention_normal.eps"
plot[][] "../../outputs/distributions/sections_by_retention.data.normal" using 1:2 title '' with linespoint lw 3


unset log y
set title "Retention Distribution - CCDF"
set xlabel "retention"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_retention_normal_ccdf.eps"
plot[][] "../../outputs/distributions/sections_by_retention.data.normal.ccdf" using 1:2 title '' with linespoint lw 3