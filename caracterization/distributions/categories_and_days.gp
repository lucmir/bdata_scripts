reset
set term postscript eps 20 enhanced color
set encoding utf8
set key right top
#set format y "10^{%L}"
set boxwidth 0.6
#set yrange [0:5592838]
set style fill solid
set xtics nomirror font ",9"

set title "Distribuição de Acessos Categoria NONE"
set output "graphics/genre_and_date/none.eps"
plot[][] "distributions/sections_by_genre_and_date.data" using 1:2:xtic(1) title '' with boxes

set title "Distribuição de Acessos Categoria SCIENCE"
set output "graphics/genre_and_date/science.eps"
plot[][] "distributions/sections_by_genre_and_date.data" using 1:3:xtic(1) title '' with boxes

set title "Distribuição de Acessos Categoria FILM"
set output "graphics/genre_and_date/film.eps"
plot[][] "distributions/sections_by_genre_and_date.data" using 1:4:xtic(1) title '' with boxes

set title "Distribuição de Acessos Categoria MUSIC"
set output "graphics/genre_and_date/music.eps"
plot[][] "distributions/sections_by_genre_and_date.data" using 1:5:xtic(1) title '' with boxes

set title "Distribuição de Acessos Categoria COMEDY"
set output "graphics/genre_and_date/comedy.eps"
plot[][] "distributions/sections_by_genre_and_date.data" using 1:7:xtic(1) title '' with boxes

set title "Distribuição de Acessos Categoria PEOPLE"
set output "graphics/genre_and_date/people.eps"
plot[][] "distributions/sections_by_genre_and_date.data" using 1:8:xtic(1) title '' with boxes

set title "Distribuição de Acessos Categoria SPORTS"
set output "graphics/genre_and_date/sports.eps"
plot[][] "distributions/sections_by_genre_and_date.data" using 1:9:xtic(1) title '' with boxes

set title "Distribuição de Acessos Categoria PETS"
set output "graphics/genre_and_date/pets.eps"
plot[][] "distributions/sections_by_genre_and_date.data" using 1:10:xtic(1) title '' with boxes

set title "Distribuição de Acessos Categoria ENTERTAINMENT"
set output "graphics/genre_and_date/entertainment.eps"
plot[][] "distributions/sections_by_genre_and_date.data" using 1:12:xtic(1) title '' with boxes

set title "Distribuição de Acessos Categoria POLITICS"
set output "graphics/genre_and_date/politics.eps"
plot[][] "distributions/sections_by_genre_and_date.data" using 1:13:xtic(1) title '' with boxes

