reset
set term postscript eps 20 enhanced color
set encoding utf8
set key right bottom

set xrange[0:120]
set log y

set title "Session Duration Distribution"
set xlabel "session duration (minutes)"
set ylabel "ocurrences"

set output "../graphics/sections_by_section_time.eps"
plot[][] "../../outputs/distributions/sections_by_section_time.data" using 1:2 title '' with linespoint lw 3


set title "Session Duration Distribution"
set xlabel "session duration (minutes)"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_section_time_normal.eps"
plot[][] "../../outputs/distributions/sections_by_section_time.data.normal" using 1:2 title '' with linespoint lw 3


set title "Session Duration Distribution - CCDF"
set xlabel "session duration (minutes)"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_section_time_normal_ccdf.eps"
plot[][] "../../outputs/distributions/sections_by_section_time.data.normal.ccdf" using 1:2 title '' with linespoint lw 3






set title "Session Duration Distribution - COMEDY"
set xlabel "session duration (minutes)"
set ylabel "ocurrences"

set output "../graphics/sections_by_genre_and_section_time/GENDER_KEY_COMEDY.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_section_time/GENDER_KEY_COMEDY.data" using 1:2 title '' with linespoint lw 3


set title "Session Duration Distribution - COMEDY"
set xlabel "session duration (minutes)"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_genre_and_section_time/GENDER_KEY_COMEDY_normal.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_section_time/GENDER_KEY_COMEDY.data.normal" using 1:2 title '' with linespoint lw 3


set title "Session Duration Distribution - COMEDY - CCDF"
set xlabel "session duration (minutes)"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_genre_and_section_time/GENDER_KEY_COMEDY_normal_ccdf.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_section_time/GENDER_KEY_COMEDY.data.normal.ccdf" using 1:2 title '' with linespoint lw 3

set title "Session Duration Distribution - ENTERTAINMENT"
set xlabel "session duration (minutes)"
set ylabel "ocurrences"

set output "../graphics/sections_by_genre_and_section_time/GENDER_KEY_ENTERTAINMENT.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_section_time/GENDER_KEY_ENTERTAINMENT.data" using 1:2 title '' with linespoint lw 3


set title "Session Duration Distribution - ENTERTAINMENT"
set xlabel "session duration (minutes)"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_genre_and_section_time/GENDER_KEY_ENTERTAINMENT_normal.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_section_time/GENDER_KEY_ENTERTAINMENT.data.normal" using 1:2 title '' with linespoint lw 3


set title "Session Duration Distribution - ENTERTAINMENT - CCDF"
set xlabel "session duration (minutes)"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_genre_and_section_time/GENDER_KEY_ENTERTAINMENT_normal_ccdf.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_section_time/GENDER_KEY_ENTERTAINMENT.data.normal.ccdf" using 1:2 title '' with linespoint lw 3

set title "Session Duration Distribution - FILM"
set xlabel "session duration (minutes)"
set ylabel "ocurrences"

set output "../graphics/sections_by_genre_and_section_time/GENDER_KEY_FILM.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_section_time/GENDER_KEY_FILM.data" using 1:2 title '' with linespoint lw 3


set title "Session Duration Distribution - FILM"
set xlabel "session duration (minutes)"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_genre_and_section_time/GENDER_KEY_FILM_normal.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_section_time/GENDER_KEY_FILM.data.normal" using 1:2 title '' with linespoint lw 3


set title "Session Duration Distribution - FILM - CCDF"
set xlabel "session duration (minutes)"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_genre_and_section_time/GENDER_KEY_FILM_normal_ccdf.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_section_time/GENDER_KEY_FILM.data.normal.ccdf" using 1:2 title '' with linespoint lw 3

set title "Session Duration Distribution - MUSIC"
set xlabel "session duration (minutes)"
set ylabel "ocurrences"

set output "../graphics/sections_by_genre_and_section_time/GENDER_KEY_MUSIC.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_section_time/GENDER_KEY_MUSIC.data" using 1:2 title '' with linespoint lw 3


set title "Session Duration Distribution - MUSIC"
set xlabel "session duration (minutes)"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_genre_and_section_time/GENDER_KEY_MUSIC_normal.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_section_time/GENDER_KEY_MUSIC.data.normal" using 1:2 title '' with linespoint lw 3


set title "Session Duration Distribution - MUSIC - CCDF"
set xlabel "session duration (minutes)"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_genre_and_section_time/GENDER_KEY_MUSIC_normal_ccdf.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_section_time/GENDER_KEY_MUSIC.data.normal.ccdf" using 1:2 title '' with linespoint lw 3

set title "Session Duration Distribution - PEOPLE"
set xlabel "session duration (minutes)"
set ylabel "ocurrences"

set output "../graphics/sections_by_genre_and_section_time/GENDER_KEY_PEOPLE.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_section_time/GENDER_KEY_PEOPLE.data" using 1:2 title '' with linespoint lw 3


set title "Session Duration Distribution - PEOPLE"
set xlabel "session duration (minutes)"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_genre_and_section_time/GENDER_KEY_PEOPLE_normal.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_section_time/GENDER_KEY_PEOPLE.data.normal" using 1:2 title '' with linespoint lw 3


set title "Session Duration Distribution - PEOPLE - CCDF"
set xlabel "session duration (minutes)"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_genre_and_section_time/GENDER_KEY_PEOPLE_normal_ccdf.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_section_time/GENDER_KEY_PEOPLE.data.normal.ccdf" using 1:2 title '' with linespoint lw 3

set title "Session Duration Distribution - PETS"
set xlabel "session duration (minutes)"
set ylabel "ocurrences"

set output "../graphics/sections_by_genre_and_section_time/GENDER_KEY_PETS.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_section_time/GENDER_KEY_PETS.data" using 1:2 title '' with linespoint lw 3


set title "Session Duration Distribution - PETS"
set xlabel "session duration (minutes)"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_genre_and_section_time/GENDER_KEY_PETS_normal.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_section_time/GENDER_KEY_PETS.data.normal" using 1:2 title '' with linespoint lw 3


set title "Session Duration Distribution - PETS - CCDF"
set xlabel "session duration (minutes)"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_genre_and_section_time/GENDER_KEY_PETS_normal_ccdf.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_section_time/GENDER_KEY_PETS.data.normal.ccdf" using 1:2 title '' with linespoint lw 3

set title "Session Duration Distribution - POLITICS"
set xlabel "session duration (minutes)"
set ylabel "ocurrences"

set output "../graphics/sections_by_genre_and_section_time/GENDER_KEY_POLITICS.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_section_time/GENDER_KEY_POLITICS.data" using 1:2 title '' with linespoint lw 3


set title "Session Duration Distribution - POLITICS"
set xlabel "session duration (minutes)"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_genre_and_section_time/GENDER_KEY_POLITICS_normal.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_section_time/GENDER_KEY_POLITICS.data.normal" using 1:2 title '' with linespoint lw 3


set title "Session Duration Distribution - POLITICS - CCDF"
set xlabel "session duration (minutes)"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_genre_and_section_time/GENDER_KEY_POLITICS_normal_ccdf.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_section_time/GENDER_KEY_POLITICS.data.normal.ccdf" using 1:2 title '' with linespoint lw 3

set title "Session Duration Distribution - SCIENCE"
set xlabel "session duration (minutes)"
set ylabel "ocurrences"

set output "../graphics/sections_by_genre_and_section_time/GENDER_KEY_SCIENCE.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_section_time/GENDER_KEY_SCIENCE.data" using 1:2 title '' with linespoint lw 3


set title "Session Duration Distribution - SCIENCE"
set xlabel "session duration (minutes)"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_genre_and_section_time/GENDER_KEY_SCIENCE_normal.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_section_time/GENDER_KEY_SCIENCE.data.normal" using 1:2 title '' with linespoint lw 3


set title "Session Duration Distribution - SCIENCE - CCDF"
set xlabel "session duration (minutes)"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_genre_and_section_time/GENDER_KEY_SCIENCE_normal_ccdf.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_section_time/GENDER_KEY_SCIENCE.data.normal.ccdf" using 1:2 title '' with linespoint lw 3

set title "Session Duration Distribution - SPORTS"
set xlabel "session duration (minutes)"
set ylabel "ocurrences"

set output "../graphics/sections_by_genre_and_section_time/GENDER_KEY_SPORTS.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_section_time/GENDER_KEY_SPORTS.data" using 1:2 title '' with linespoint lw 3


set title "Session Duration Distribution - SPORTS"
set xlabel "session duration (minutes)"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_genre_and_section_time/GENDER_KEY_SPORTS_normal.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_section_time/GENDER_KEY_SPORTS.data.normal" using 1:2 title '' with linespoint lw 3


set title "Session Duration Distribution - SPORTS - CCDF"
set xlabel "session duration (minutes)"
set ylabel "ocurrences (%)"

set output "../graphics/sections_by_genre_and_section_time/GENDER_KEY_SPORTS_normal_ccdf.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_section_time/GENDER_KEY_SPORTS.data.normal.ccdf" using 1:2 title '' with linespoint lw 3