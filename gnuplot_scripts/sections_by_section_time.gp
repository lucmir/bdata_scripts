reset
set term postscript eps 20 enhanced color
set encoding utf8
set key right bottom

set xrange[0:120]
set log y

set title "Session Duration Distribution"
set xlabel "session duration (minutes)"
set ylabel "ocurrences"


set output "../graphics/sections_by_section_time.eps"
plot[][] "../../outputs/distributions/sections_by_section_time.data" using 1:2 title '' with linespoint lw 3


set title "Session Duration Distribution"
set xlabel "session duration (minutes)"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_section_time_normal.eps"
plot[][] "../../outputs/distributions/sections_by_section_time.data.normal" using 1:2 title '' with linespoint lw 3


set title "Session Duration Distribution - CCDF"
set xlabel "session duration (minutes)"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_section_time_normal_ccdf.eps"
plot[][] "../../outputs/distributions/sections_by_section_time.data.normal.ccdf" using 1:2 title '' with linespoint lw 3