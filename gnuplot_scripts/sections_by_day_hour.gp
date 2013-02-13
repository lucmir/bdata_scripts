reset
set term postscript eps 20 enhanced color
set encoding utf8
set key right bottom
set xrange [0:23]
set xtics 2

set title "Views by Time of Day"
set xlabel "time"
set ylabel "views"

set output "../graphics/sections_by_day_hour.eps"
plot[][] "../../outputs/distributions/sections_by_day_hour.data" using 1:2 title '' with linespoint lw 3


set title "Views by Time of Day"
set xlabel "time"
set ylabel "views (%)"

set output "../graphics/sections_by_day_hour_normal.eps"
plot[][] "../../outputs/distributions/sections_by_day_hour.data.normal" using 1:2 title '' with linespoint lw 3