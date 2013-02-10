reset
set term postscript eps 20 enhanced color
set encoding utf8
set key right bottom
#set format x "10^{%L}"
#set format y "10^{%L}"
set xlabel "horas"
set ylabel "acessos (%)"
#set xrange [:220]
#set yrange [0.001:]
#set log x
#set log y
set xtics 10

set title "Acessos Nas Primeiras 120 Horas Pós Publicação - COMEDY"
set output "graphics/sections_by_genre_and_hours_after_publishing/COMEDY.eps"
plot[][] "distributions/sections_by_genre_and_hours_after_publishing/GENDER_KEY_COMEDY.data" using 1:2 title '' with linespoint lw 3 \

set title "Acessos Nas Primeiras 120 Horas Pós Publicação - FILM"
set output "graphics/sections_by_genre_and_hours_after_publishing/FILM.eps"
plot[][] "distributions/sections_by_genre_and_hours_after_publishing/GENDER_KEY_FILM.data" using 1:2 title '' with linespoint lw 3 \

set title "Acessos Nas Primeiras 120 Horas Pós Publicação - ENTERTAINMENT"
set output "graphics/sections_by_genre_and_hours_after_publishing/ENTERTAINMENT.eps"
plot[][] "distributions/sections_by_genre_and_hours_after_publishing/GENDER_KEY_ENTERTAINMENT.data" using 1:2 title '' with linespoint lw 3 \

set title "Acessos Nas Primeiras 120 Horas Pós Publicação - MUSIC"
set output "graphics/sections_by_genre_and_hours_after_publishing/MUSIC.eps"
plot[][] "distributions/sections_by_genre_and_hours_after_publishing/GENDER_KEY_MUSIC.data" using 1:2 title '' with linespoint lw 3 \

set title "Acessos Nas Primeiras 120 Horas Pós Publicação - PEOPLE"
set output "graphics/sections_by_genre_and_hours_after_publishing/PEOPLE.eps"
plot[][] "distributions/sections_by_genre_and_hours_after_publishing/GENDER_KEY_PEOPLE.data" using 1:2 title '' with linespoint lw 3 \

set title "Acessos Nas Primeiras 120 Horas Pós Publicação - PETS"
set output "graphics/sections_by_genre_and_hours_after_publishing/PETS.eps"
plot[][] "distributions/sections_by_genre_and_hours_after_publishing/GENDER_KEY_PETS.data" using 1:2 title '' with linespoint lw 3 \

set title "Acessos Nas Primeiras 120 Horas Pós Publicação - POLITICS"
set output "graphics/sections_by_genre_and_hours_after_publishing/POLITICS.eps"
plot[][] "distributions/sections_by_genre_and_hours_after_publishing/GENDER_KEY_POLITICS.data" using 1:2 title '' with linespoint lw 3 \

set title "Acessos Nas Primeiras 120 Horas Pós Publicação - SCIENCE"
set output "graphics/sections_by_genre_and_hours_after_publishing/SCIENCE.eps"
plot[][] "distributions/sections_by_genre_and_hours_after_publishing/GENDER_KEY_SCIENCE.data" using 1:2 title '' with linespoint lw 3 \

set title "Acessos Nas Primeiras 120 Horas Pós Publicação - SPORTS"
set output "graphics/sections_by_genre_and_hours_after_publishing/SPORTS.eps"
plot[][] "distributions/sections_by_genre_and_hours_after_publishing/GENDER_KEY_SPORTS.data" using 1:2 title '' with linespoint lw 3

