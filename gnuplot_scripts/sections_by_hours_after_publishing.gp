reset
set term postscript eps 20 enhanced color
set encoding utf8
set key right bottom

set xrange[0:4800]
set log y

set title "Views By Hours After Publishing"
set xlabel "hours after publishing"
set ylabel "views"

set output "../graphics/sections_by_hours_after_publishing.eps"
plot[][] "../../outputs/distributions/sections_by_hours_after_publishing.data" using 1:2 title '' with linespoint lw 3


set title "Views By Hours After Publishing"
set xlabel "hours after publishing"
set ylabel "views (%)"

set output "../graphics/sections_by_hours_after_publishing_normal.eps"
plot[][] "../../outputs/distributions/sections_by_hours_after_publishing.data.normal" using 1:2 title '' with linespoint lw 3


set title "Views By Hours After Publishing - CCDF"
set xlabel "hours after publishing"
set ylabel "views (%)"

set output "../graphics/sections_by_hours_after_publishing_normal_ccdf.eps"
plot[][] "../../outputs/distributions/sections_by_hours_after_publishing.data.normal.ccdf" using 1:2 title '' with linespoint lw 3