reset
set term postscript eps 28 enhanced color
set encoding utf8
set key right bottom
#set format x "10^{%L}"
#set format y "10^{%L}"
set xlabel "acessos por usuário"
set ylabel "usuários (%)"
set xrange [:220]
#set yrange [0.001:]
set title "Acessos por Usuário"
#set log x
set log y
set output "graphics/users_views2.normal.dist.eps"
plot[][] "distributions/sections_by_users2.normal.data" using 1:2 title '' with linespoint lw 3
