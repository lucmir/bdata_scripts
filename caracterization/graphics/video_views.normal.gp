reset
set term postscript eps 28 enhanced color
set encoding utf8
set key right bottom
#set format x "10^{%L}"
#set format y "10^{%L}"
set xlabel "visualizações por video"
set ylabel "videos (%)"
#set xrange [:]
#set yrange [0.001:]
set title "Distribuição de Visualizações por Video"
set log x
#set log y
set output "graphics/video_views.normal.dist.eps"
plot[][] "video_views.normal.dist" using 1:2 title '' with linespoint lw 3
