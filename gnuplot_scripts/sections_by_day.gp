reset
set term postscript eps 20 enhanced color
set encoding utf8
set key right top
#set format y "10^{%L}"
set title "Views by Day"
set boxwidth 0.6
#set yrange [0:2152838]
set style fill solid
set xtics nomirror rotate by -45 font ",9"
set output "../graphics/sections_by_days.eps"
plot[][] "../../outputs/distributions/sections_by_day.data" using 1:3:xtic(2) title '' with boxes, \
         "../../outputs/distributions/sections_by_day.data" using 1:($3+30000):3 title ''  with labels font ",9"
