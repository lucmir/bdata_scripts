reset
set term postscript eps 24 enhanced color
set encoding utf8
set key right bottom
#set format x "10^{%L}"
#set format y "10^{%L}"
set xlabel "horas"
set ylabel "acessos (%)"
#set xrange [:220]
#set yrange [0.001:]
set title "Acessos Nas Primeiras 120 Horas Pós Publicação"
#set log x
#set log y
set xtics 2
set output "graphics/120_hours_after_publishing.eps"
plot[][] "distributions/sections_by_hours_after_publishing_top_120.data" using 1:2 title '' with linespoint lw 3
