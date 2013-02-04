reset
set term postscript eps 20 enhanced color
set encoding utf8
set key right top
#set format y "10^{%L}"
set title "Distribuição de Acessos por Dia"
set boxwidth 0.6
set yrange [0:2152838]
set style fill solid
set xtics nomirror rotate by -45 font ",9"
set output "graphics/days.eps"
plot[][] "distributions/sections_by_day.data" using 1:3:xtic(2) title '' with boxes, \
         "distributions/sections_by_day.data" using 1:($3+30000):3 title ''  with labels font ",9"
