reset
set term postscript eps 20 enhanced color
set encoding utf8
set key right bottom

set log y
set log x

set title "Views by Video Distribution"
set xlabel "views by video"
set ylabel "ocurrences"

#set xrange[0:200]

set output "../graphics/sections_by_videos.eps"
plot[][] "../../outputs/distributions/sections_by_videos.data" using 1:2 title '' with linespoint lw 3


set title "Views by Video Distribution"
set xlabel "views by video"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_videos_normal.eps"
plot[][] "../../outputs/distributions/sections_by_videos.data.normal" using 1:2 title '' with linespoint lw 3


set title "Views by Video Distribution - CCDF"
set xlabel "views by video"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_videos_normal_ccdf.eps"
plot[][] "../../outputs/distributions/sections_by_videos.data.normal.ccdf" using 1:2 title '' with linespoint lw 3