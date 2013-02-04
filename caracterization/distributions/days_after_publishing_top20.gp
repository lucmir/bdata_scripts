reset
set term postscript eps 20 enhanced color
set encoding utf8
set key right bottom
#set format x "10^{%L}"
#set format y "10^{%L}"
set xlabel "dias"
set ylabel "acessos (%)"
#set xrange [:220]
#set yrange [0.001:]
set title "Acessos por Dias Pós Publicação (Top 20)"
#set log x
#set log y
set xtics 1
set output "graphics/days_after_publishing.top20.eps"
plot[][] "distributions/sections_by_days_after_publishing_top20.data" using 1:2 title '' with linespoint lw 3
