reset
set term postscript eps 20 enhanced color
set encoding utf8
set key right bottom
set xrange [0:23]
set xtics 2

set title "Views by Time of Day"
set xlabel "time"
set ylabel "views"

set output "../graphics/sections_by_day_hour.eps"
plot[][] "../../outputs/distributions/sections_by_day_hour.data" using 1:2 title '' with linespoint lw 3


set title "Views by Time of Day"
set xlabel "time"
set ylabel "views (%)"

set output "../graphics/sections_by_day_hour_normal.eps"
plot[][] "../../outputs/distributions/sections_by_day_hour.data.normal" using 1:2 title '' with linespoint lw 3




set title "Views by Time of Day - COMEDY"
set xlabel "time"
set ylabel "views"

set output "../graphics/sections_by_genre_and_day_hour/GENDER_KEY_COMEDY.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_day_hour/GENDER_KEY_COMEDY.data" using 1:2 title '' with linespoint lw 3


set title "Views by Time of Day - COMEDY"
set xlabel "time"
set ylabel "views (%)"

set output "../graphics/sections_by_genre_and_day_hour/GENDER_KEY_COMEDY_normal.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_day_hour/GENDER_KEY_COMEDY.data.normal" using 1:2 title '' with linespoint lw 3

set title "Views by Time of Day - ENTERTAINMENT"
set xlabel "time"
set ylabel "views"

set output "../graphics/sections_by_genre_and_day_hour/GENDER_KEY_ENTERTAINMENT.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_day_hour/GENDER_KEY_ENTERTAINMENT.data" using 1:2 title '' with linespoint lw 3


set title "Views by Time of Day - ENTERTAINMENT"
set xlabel "time"
set ylabel "views (%)"

set output "../graphics/sections_by_genre_and_day_hour/GENDER_KEY_ENTERTAINMENT_normal.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_day_hour/GENDER_KEY_ENTERTAINMENT.data.normal" using 1:2 title '' with linespoint lw 3

set title "Views by Time of Day - FILM"
set xlabel "time"
set ylabel "views"

set output "../graphics/sections_by_genre_and_day_hour/GENDER_KEY_FILM.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_day_hour/GENDER_KEY_FILM.data" using 1:2 title '' with linespoint lw 3


set title "Views by Time of Day - FILM"
set xlabel "time"
set ylabel "views (%)"

set output "../graphics/sections_by_genre_and_day_hour/GENDER_KEY_FILM_normal.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_day_hour/GENDER_KEY_FILM.data.normal" using 1:2 title '' with linespoint lw 3

set title "Views by Time of Day - MUSIC"
set xlabel "time"
set ylabel "views"

set output "../graphics/sections_by_genre_and_day_hour/GENDER_KEY_MUSIC.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_day_hour/GENDER_KEY_MUSIC.data" using 1:2 title '' with linespoint lw 3


set title "Views by Time of Day - MUSIC"
set xlabel "time"
set ylabel "views (%)"

set output "../graphics/sections_by_genre_and_day_hour/GENDER_KEY_MUSIC_normal.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_day_hour/GENDER_KEY_MUSIC.data.normal" using 1:2 title '' with linespoint lw 3

set title "Views by Time of Day - PEOPLE"
set xlabel "time"
set ylabel "views"

set output "../graphics/sections_by_genre_and_day_hour/GENDER_KEY_PEOPLE.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_day_hour/GENDER_KEY_PEOPLE.data" using 1:2 title '' with linespoint lw 3


set title "Views by Time of Day - PEOPLE"
set xlabel "time"
set ylabel "views (%)"

set output "../graphics/sections_by_genre_and_day_hour/GENDER_KEY_PEOPLE_normal.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_day_hour/GENDER_KEY_PEOPLE.data.normal" using 1:2 title '' with linespoint lw 3

set title "Views by Time of Day - PETS"
set xlabel "time"
set ylabel "views"

set output "../graphics/sections_by_genre_and_day_hour/GENDER_KEY_PETS.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_day_hour/GENDER_KEY_PETS.data" using 1:2 title '' with linespoint lw 3


set title "Views by Time of Day - PETS"
set xlabel "time"
set ylabel "views (%)"

set output "../graphics/sections_by_genre_and_day_hour/GENDER_KEY_PETS_normal.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_day_hour/GENDER_KEY_PETS.data.normal" using 1:2 title '' with linespoint lw 3

set title "Views by Time of Day - POLITICS"
set xlabel "time"
set ylabel "views"

set output "../graphics/sections_by_genre_and_day_hour/GENDER_KEY_POLITICS.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_day_hour/GENDER_KEY_POLITICS.data" using 1:2 title '' with linespoint lw 3


set title "Views by Time of Day - POLITICS"
set xlabel "time"
set ylabel "views (%)"

set output "../graphics/sections_by_genre_and_day_hour/GENDER_KEY_POLITICS_normal.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_day_hour/GENDER_KEY_POLITICS.data.normal" using 1:2 title '' with linespoint lw 3

set title "Views by Time of Day - SCIENCE"
set xlabel "time"
set ylabel "views"

set output "../graphics/sections_by_genre_and_day_hour/GENDER_KEY_SCIENCE.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_day_hour/GENDER_KEY_SCIENCE.data" using 1:2 title '' with linespoint lw 3


set title "Views by Time of Day - SCIENCE"
set xlabel "time"
set ylabel "views (%)"

set output "../graphics/sections_by_genre_and_day_hour/GENDER_KEY_SCIENCE_normal.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_day_hour/GENDER_KEY_SCIENCE.data.normal" using 1:2 title '' with linespoint lw 3

set title "Views by Time of Day - SPORTS"
set xlabel "time"
set ylabel "views"

set output "../graphics/sections_by_genre_and_day_hour/GENDER_KEY_SPORTS.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_day_hour/GENDER_KEY_SPORTS.data" using 1:2 title '' with linespoint lw 3


set title "Views by Time of Day - SPORTS"
set xlabel "time"
set ylabel "views (%)"

set output "../graphics/sections_by_genre_and_day_hour/GENDER_KEY_SPORTS_normal.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_day_hour/GENDER_KEY_SPORTS.data.normal" using 1:2 title '' with linespoint lw 3

