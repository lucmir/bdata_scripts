reset
set term postscript eps 28 enhanced color
set encoding utf8
set key right bottom
#set format x "10^{%L}"
#set format y "10^{%L}"
set xlabel "visualizações por usuário"
set ylabel "usuários (%)"
#set xrange [:]
#set yrange [0.001:]
set title "Distribuição Acumulada de Visualizações por Usuário"
set log x
#set log y
set output "graphics/users_views.normal.ccdf.eps"
plot[][] "users_views.normal.ccdf.dist" using 1:2 title '' with linespoint lw 3
