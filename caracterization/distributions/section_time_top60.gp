reset
set term postscript eps 22 enhanced color
set encoding utf8
set key right bottom
#set format x "10^{%L}"
#set format y "10^{%L}"
set xlabel "tempo de sessão (minutos)"
set ylabel "acessos"
#set xrange [:1600]
#set yrange [1e-07:]
set title "Acessos por Tempo de Sessão (Primeiros 60 minutos)"
#set log x
set log y
set xtics 5
set output "graphics/section_time_first_60.eps"
plot[][] "distributions/sections_by_section_time_top60.data" using 1:2 title '' with linespoint lw 3
