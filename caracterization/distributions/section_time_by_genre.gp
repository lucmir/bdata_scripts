reset
set term postscript eps 22 enhanced color
set encoding utf8
set key right bottom
#set format x "10^{%L}"
#set format y "10^{%L}"
set xlabel "tempo de sessão (minutos)"
set ylabel "acessos"
set xrange [:1600]
#set yrange [1e-07:]
set log x
#set log y

set title "Acessos por Tempo de Sessão - COMEDY"
set output "graphics/sections_by_genre_and_section_time/COMEDY.eps"
plot[][] "distributions/sections_by_genre_and_section_time/GENDER_KEY_COMEDY.data" using 1:2 title '' with linespoint lw 3 \

set title "Acessos por Tempo de Sessão - FILM"
set output "graphics/sections_by_genre_and_section_time/FILM.eps"
plot[][] "distributions/sections_by_genre_and_section_time/GENDER_KEY_FILM.data" using 1:2 title '' with linespoint lw 3 \

set title "Acessos por Tempo de Sessão - ENTERTAINMENT"
set output "graphics/sections_by_genre_and_section_time/ENTERTAINMENT.eps"
plot[][] "distributions/sections_by_genre_and_section_time/GENDER_KEY_ENTERTAINMENT.data" using 1:2 title '' with linespoint lw 3 \

set title "Acessos por Tempo de Sessão - MUSIC"
set output "graphics/sections_by_genre_and_section_time/MUSIC.eps"
plot[][] "distributions/sections_by_genre_and_section_time/GENDER_KEY_MUSIC.data" using 1:2 title '' with linespoint lw 3 \

set title "Acessos por Tempo de Sessão - PEOPLE"
set output "graphics/sections_by_genre_and_section_time/PEOPLE.eps"
plot[][] "distributions/sections_by_genre_and_section_time/GENDER_KEY_PEOPLE.data" using 1:2 title '' with linespoint lw 3 \

set title "Acessos por Tempo de Sessão - PETS"
set output "graphics/sections_by_genre_and_section_time/PETS.eps"
plot[][] "distributions/sections_by_genre_and_section_time/GENDER_KEY_PETS.data" using 1:2 title '' with linespoint lw 3 \

set title "Acessos por Tempo de Sessão - POLITICS"
set output "graphics/sections_by_genre_and_section_time/POLITICS.eps"
plot[][] "distributions/sections_by_genre_and_section_time/GENDER_KEY_POLITICS.data" using 1:2 title '' with linespoint lw 3 \

set title "Acessos por Tempo de Sessão - SCIENCE"
set output "graphics/sections_by_genre_and_section_time/SCIENCE.eps"
plot[][] "distributions/sections_by_genre_and_section_time/GENDER_KEY_SCIENCE.data" using 1:2 title '' with linespoint lw 3 \

set title "Acessos por Tempo de Sessão - SPORTS"
set output "graphics/sections_by_genre_and_section_time/SPORTS.eps"
plot[][] "distributions/sections_by_genre_and_section_time/GENDER_KEY_SPORTS.data" using 1:2 title '' with linespoint lw 3

