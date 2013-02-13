reset
set term postscript eps 20 enhanced color
set encoding utf8
set key right top
#set format y "10^{%L}"
set title "Views by Category"
set boxwidth 0.6
#set yrange [0:5592838]
set style fill solid
set xtics nomirror rotate by -45 font ",9"
set output "../graphics/sections_by_genre.eps"
plot[][] "../../outputs/distributions/sections_by_genre.data" using 1:3:xtic(2) title '' with boxes, \
         "../../outputs/distributions/sections_by_genre.data" using 1:($3+90000):3 title ''  with labels font ",9"
