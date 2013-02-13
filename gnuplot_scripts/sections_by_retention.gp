reset
set term postscript eps 20 enhanced color
set encoding utf8
set key right bottom

set xtics 0.1
set log y

set title "Retention Distribution"
set xlabel "retention"
set ylabel "ocurrences"

set output "../graphics/sections_by_retention.eps"
plot[][] "../../outputs/distributions/sections_by_retention.data" using 1:2 title '' with linespoint lw 3


set title "Retention Distribution"
set xlabel "retention"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_retention_normal.eps"
plot[][] "../../outputs/distributions/sections_by_retention.data.normal" using 1:2 title '' with linespoint lw 3


unset log y
set title "Retention Distribution - CCDF"
set xlabel "retention"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_retention_normal_ccdf.eps"
plot[][] "../../outputs/distributions/sections_by_retention.data.normal.ccdf" using 1:2 title '' with linespoint lw 3






set title "Retention Distribution - COMEDY"
set xlabel "retention"
set ylabel "ocurrences"

set output "../graphics/sections_by_genre_and_retention/GENDER_KEY_COMEDY.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_retention/GENDER_KEY_COMEDY.data" using 1:2 title '' with linespoint lw 3


set title "Retention Distribution - COMEDY"
set xlabel "retention"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_genre_and_retention/GENDER_KEY_COMEDY_normal.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_retention/GENDER_KEY_COMEDY.data.normal" using 1:2 title '' with linespoint lw 3


unset log y
set title "Retention Distribution - COMEDY - CCDF"
set xlabel "retention"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_genre_and_retention/GENDER_KEY_COMEDY_normal_ccdf.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_retention/GENDER_KEY_COMEDY.data.normal.ccdf" using 1:2 title '' with linespoint lw 3

set title "Retention Distribution - ENTERTAINMENT"
set xlabel "retention"
set ylabel "ocurrences"

set output "../graphics/sections_by_genre_and_retention/GENDER_KEY_ENTERTAINMENT.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_retention/GENDER_KEY_ENTERTAINMENT.data" using 1:2 title '' with linespoint lw 3


set title "Retention Distribution - ENTERTAINMENT"
set xlabel "retention"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_genre_and_retention/GENDER_KEY_ENTERTAINMENT_normal.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_retention/GENDER_KEY_ENTERTAINMENT.data.normal" using 1:2 title '' with linespoint lw 3


unset log y
set title "Retention Distribution - ENTERTAINMENT - CCDF"
set xlabel "retention"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_genre_and_retention/GENDER_KEY_ENTERTAINMENT_normal_ccdf.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_retention/GENDER_KEY_ENTERTAINMENT.data.normal.ccdf" using 1:2 title '' with linespoint lw 3

set title "Retention Distribution - FILM"
set xlabel "retention"
set ylabel "ocurrences"

set output "../graphics/sections_by_genre_and_retention/GENDER_KEY_FILM.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_retention/GENDER_KEY_FILM.data" using 1:2 title '' with linespoint lw 3


set title "Retention Distribution - FILM"
set xlabel "retention"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_genre_and_retention/GENDER_KEY_FILM_normal.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_retention/GENDER_KEY_FILM.data.normal" using 1:2 title '' with linespoint lw 3


unset log y
set title "Retention Distribution - FILM - CCDF"
set xlabel "retention"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_genre_and_retention/GENDER_KEY_FILM_normal_ccdf.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_retention/GENDER_KEY_FILM.data.normal.ccdf" using 1:2 title '' with linespoint lw 3

set title "Retention Distribution - MUSIC"
set xlabel "retention"
set ylabel "ocurrences"

set output "../graphics/sections_by_genre_and_retention/GENDER_KEY_MUSIC.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_retention/GENDER_KEY_MUSIC.data" using 1:2 title '' with linespoint lw 3


set title "Retention Distribution - MUSIC"
set xlabel "retention"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_genre_and_retention/GENDER_KEY_MUSIC_normal.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_retention/GENDER_KEY_MUSIC.data.normal" using 1:2 title '' with linespoint lw 3


unset log y
set title "Retention Distribution - MUSIC - CCDF"
set xlabel "retention"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_genre_and_retention/GENDER_KEY_MUSIC_normal_ccdf.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_retention/GENDER_KEY_MUSIC.data.normal.ccdf" using 1:2 title '' with linespoint lw 3

set title "Retention Distribution - PEOPLE"
set xlabel "retention"
set ylabel "ocurrences"

set output "../graphics/sections_by_genre_and_retention/GENDER_KEY_PEOPLE.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_retention/GENDER_KEY_PEOPLE.data" using 1:2 title '' with linespoint lw 3


set title "Retention Distribution - PEOPLE"
set xlabel "retention"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_genre_and_retention/GENDER_KEY_PEOPLE_normal.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_retention/GENDER_KEY_PEOPLE.data.normal" using 1:2 title '' with linespoint lw 3


unset log y
set title "Retention Distribution - PEOPLE - CCDF"
set xlabel "retention"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_genre_and_retention/GENDER_KEY_PEOPLE_normal_ccdf.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_retention/GENDER_KEY_PEOPLE.data.normal.ccdf" using 1:2 title '' with linespoint lw 3

set title "Retention Distribution - PETS"
set xlabel "retention"
set ylabel "ocurrences"

set output "../graphics/sections_by_genre_and_retention/GENDER_KEY_PETS.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_retention/GENDER_KEY_PETS.data" using 1:2 title '' with linespoint lw 3


set title "Retention Distribution - PETS"
set xlabel "retention"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_genre_and_retention/GENDER_KEY_PETS_normal.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_retention/GENDER_KEY_PETS.data.normal" using 1:2 title '' with linespoint lw 3


unset log y
set title "Retention Distribution - PETS - CCDF"
set xlabel "retention"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_genre_and_retention/GENDER_KEY_PETS_normal_ccdf.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_retention/GENDER_KEY_PETS.data.normal.ccdf" using 1:2 title '' with linespoint lw 3

set title "Retention Distribution - POLITICS"
set xlabel "retention"
set ylabel "ocurrences"

set output "../graphics/sections_by_genre_and_retention/GENDER_KEY_POLITICS.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_retention/GENDER_KEY_POLITICS.data" using 1:2 title '' with linespoint lw 3


set title "Retention Distribution - POLITICS"
set xlabel "retention"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_genre_and_retention/GENDER_KEY_POLITICS_normal.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_retention/GENDER_KEY_POLITICS.data.normal" using 1:2 title '' with linespoint lw 3


unset log y
set title "Retention Distribution - POLITICS - CCDF"
set xlabel "retention"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_genre_and_retention/GENDER_KEY_POLITICS_normal_ccdf.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_retention/GENDER_KEY_POLITICS.data.normal.ccdf" using 1:2 title '' with linespoint lw 3

set title "Retention Distribution - SCIENCE"
set xlabel "retention"
set ylabel "ocurrences"

set output "../graphics/sections_by_genre_and_retention/GENDER_KEY_SCIENCE.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_retention/GENDER_KEY_SCIENCE.data" using 1:2 title '' with linespoint lw 3


set title "Retention Distribution - SCIENCE"
set xlabel "retention"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_genre_and_retention/GENDER_KEY_SCIENCE_normal.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_retention/GENDER_KEY_SCIENCE.data.normal" using 1:2 title '' with linespoint lw 3


unset log y
set title "Retention Distribution - SCIENCE - CCDF"
set xlabel "retention"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_genre_and_retention/GENDER_KEY_SCIENCE_normal_ccdf.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_retention/GENDER_KEY_SCIENCE.data.normal.ccdf" using 1:2 title '' with linespoint lw 3

set title "Retention Distribution - SPORTS"
set xlabel "retention"
set ylabel "ocurrences"

set output "../graphics/sections_by_genre_and_retention/GENDER_KEY_SPORTS.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_retention/GENDER_KEY_SPORTS.data" using 1:2 title '' with linespoint lw 3


set title "Retention Distribution - SPORTS"
set xlabel "retention"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_genre_and_retention/GENDER_KEY_SPORTS_normal.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_retention/GENDER_KEY_SPORTS.data.normal" using 1:2 title '' with linespoint lw 3


unset log y
set title "Retention Distribution - SPORTS - CCDF"
set xlabel "retention"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_genre_and_retention/GENDER_KEY_SPORTS_normal_ccdf.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_retention/GENDER_KEY_SPORTS.data.normal.ccdf" using 1:2 title '' with linespoint lw 3