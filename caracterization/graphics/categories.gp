reset
set term postscript eps 20 enhanced color
set encoding utf8
set key right top
set title "Distribuição de Visualizações por Categorias"
set boxwidth 0.6
set yrange [0:622838]
set style fill solid
set xtics nomirror rotate by -45 font ",9"
set output "graphics/categories.eps"
plot[][] "categories.dist" using 1:3:xtic(2) title '' with boxes, \
         "categories.dist" using 1:($3+10000):3 title ''  with labels font ",9"
