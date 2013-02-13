reset
set term postscript eps 20 enhanced color
set encoding utf8
set key right bottom

#set xtics 0.1
set log y

set title "Views by User Distribution"
set xlabel "views by users"
set ylabel "ocurrences"

set xrange[0:200]

set output "../graphics/sections_by_users.eps"
plot[][] "../../outputs/distributions/sections_by_users.data" using 1:2 title '' with linespoint lw 3


set title "Views by User Distribution"
set xlabel "views by user"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_users_normal.eps"
plot[][] "../../outputs/distributions/sections_by_users.data.normal" using 1:2 title '' with linespoint lw 3


set title "Views by User Distribution - CCDF"
set xlabel "views by user"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_users_normal_ccdf.eps"
plot[][] "../../outputs/distributions/sections_by_users.data.normal.ccdf" using 1:2 title '' with linespoint lw 3