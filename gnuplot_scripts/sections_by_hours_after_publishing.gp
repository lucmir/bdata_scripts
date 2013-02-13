reset
set term postscript eps 20 enhanced color
set encoding utf8
set key right bottom

set xrange[0:4800]
set log y

set title "Views By Hours After Publishing"
set xlabel "hours after publishing"
set ylabel "views"

set output "../graphics/sections_by_hours_after_publishing.eps"
plot[][] "../../outputs/distributions/sections_by_hours_after_publishing.data" using 1:2 title '' with linespoint lw 3


set title "Views By Hours After Publishing"
set xlabel "hours after publishing"
set ylabel "views (%)"

set output "../graphics/sections_by_hours_after_publishing_normal.eps"
plot[][] "../../outputs/distributions/sections_by_hours_after_publishing.data.normal" using 1:2 title '' with linespoint lw 3


set title "Views By Hours After Publishing - CCDF"
set xlabel "hours after publishing"
set ylabel "views (%)"

set output "../graphics/sections_by_hours_after_publishing_normal_ccdf.eps"
plot[][] "../../outputs/distributions/sections_by_hours_after_publishing.data.normal.ccdf" using 1:2 title '' with linespoint lw 3





set title "Views By Hours After Publishing - COMEDY"
set xlabel "hours after publishing"
set ylabel "views"

set output "../graphics/sections_by_genre_and_hours_after_publishing/GENDER_KEY_COMEDY.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_hours_after_publishing/GENDER_KEY_COMEDY.data" using 1:2 title '' with linespoint lw 3


set title "Views By Hours After Publishing - COMEDY"
set xlabel "hours after publishing"
set ylabel "views (%)"

set output "../graphics/sections_by_genre_and_hours_after_publishing/GENDER_KEY_COMEDY_normal.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_hours_after_publishing/GENDER_KEY_COMEDY.data.normal" using 1:2 title '' with linespoint lw 3


set title "Views By Hours After Publishing - COMEDY - CCDF"
set xlabel "hours after publishing"
set ylabel "views (%)"

set output "../graphics/sections_by_genre_and_hours_after_publishing/GENDER_KEY_COMEDY_normal_ccdf.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_hours_after_publishing/GENDER_KEY_COMEDY.data.normal.ccdf" using 1:2 title '' with linespoint lw 3

set title "Views By Hours After Publishing - ENTERTAINMENT"
set xlabel "hours after publishing"
set ylabel "views"

set output "../graphics/sections_by_genre_and_hours_after_publishing/GENDER_KEY_ENTERTAINMENT.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_hours_after_publishing/GENDER_KEY_ENTERTAINMENT.data" using 1:2 title '' with linespoint lw 3


set title "Views By Hours After Publishing - ENTERTAINMENT"
set xlabel "hours after publishing"
set ylabel "views (%)"

set output "../graphics/sections_by_genre_and_hours_after_publishing/GENDER_KEY_ENTERTAINMENT_normal.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_hours_after_publishing/GENDER_KEY_ENTERTAINMENT.data.normal" using 1:2 title '' with linespoint lw 3


set title "Views By Hours After Publishing - ENTERTAINMENT - CCDF"
set xlabel "hours after publishing"
set ylabel "views (%)"

set output "../graphics/sections_by_genre_and_hours_after_publishing/GENDER_KEY_ENTERTAINMENT_normal_ccdf.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_hours_after_publishing/GENDER_KEY_ENTERTAINMENT.data.normal.ccdf" using 1:2 title '' with linespoint lw 3

set title "Views By Hours After Publishing - FILM"
set xlabel "hours after publishing"
set ylabel "views"

set output "../graphics/sections_by_genre_and_hours_after_publishing/GENDER_KEY_FILM.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_hours_after_publishing/GENDER_KEY_FILM.data" using 1:2 title '' with linespoint lw 3


set title "Views By Hours After Publishing - FILM"
set xlabel "hours after publishing"
set ylabel "views (%)"

set output "../graphics/sections_by_genre_and_hours_after_publishing/GENDER_KEY_FILM_normal.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_hours_after_publishing/GENDER_KEY_FILM.data.normal" using 1:2 title '' with linespoint lw 3


set title "Views By Hours After Publishing - FILM - CCDF"
set xlabel "hours after publishing"
set ylabel "views (%)"

set output "../graphics/sections_by_genre_and_hours_after_publishing/GENDER_KEY_FILM_normal_ccdf.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_hours_after_publishing/GENDER_KEY_FILM.data.normal.ccdf" using 1:2 title '' with linespoint lw 3

set title "Views By Hours After Publishing - MUSIC"
set xlabel "hours after publishing"
set ylabel "views"

set output "../graphics/sections_by_genre_and_hours_after_publishing/GENDER_KEY_MUSIC.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_hours_after_publishing/GENDER_KEY_MUSIC.data" using 1:2 title '' with linespoint lw 3


set title "Views By Hours After Publishing - MUSIC"
set xlabel "hours after publishing"
set ylabel "views (%)"

set output "../graphics/sections_by_genre_and_hours_after_publishing/GENDER_KEY_MUSIC_normal.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_hours_after_publishing/GENDER_KEY_MUSIC.data.normal" using 1:2 title '' with linespoint lw 3


set title "Views By Hours After Publishing - MUSIC - CCDF"
set xlabel "hours after publishing"
set ylabel "views (%)"

set output "../graphics/sections_by_genre_and_hours_after_publishing/GENDER_KEY_MUSIC_normal_ccdf.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_hours_after_publishing/GENDER_KEY_MUSIC.data.normal.ccdf" using 1:2 title '' with linespoint lw 3

set title "Views By Hours After Publishing - PEOPLE"
set xlabel "hours after publishing"
set ylabel "views"

set output "../graphics/sections_by_genre_and_hours_after_publishing/GENDER_KEY_PEOPLE.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_hours_after_publishing/GENDER_KEY_PEOPLE.data" using 1:2 title '' with linespoint lw 3


set title "Views By Hours After Publishing - PEOPLE"
set xlabel "hours after publishing"
set ylabel "views (%)"

set output "../graphics/sections_by_genre_and_hours_after_publishing/GENDER_KEY_PEOPLE_normal.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_hours_after_publishing/GENDER_KEY_PEOPLE.data.normal" using 1:2 title '' with linespoint lw 3


set title "Views By Hours After Publishing - PEOPLE - CCDF"
set xlabel "hours after publishing"
set ylabel "views (%)"

set output "../graphics/sections_by_genre_and_hours_after_publishing/GENDER_KEY_PEOPLE_normal_ccdf.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_hours_after_publishing/GENDER_KEY_PEOPLE.data.normal.ccdf" using 1:2 title '' with linespoint lw 3

set title "Views By Hours After Publishing - PETS"
set xlabel "hours after publishing"
set ylabel "views"

set output "../graphics/sections_by_genre_and_hours_after_publishing/GENDER_KEY_PETS.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_hours_after_publishing/GENDER_KEY_PETS.data" using 1:2 title '' with linespoint lw 3


set title "Views By Hours After Publishing - PETS"
set xlabel "hours after publishing"
set ylabel "views (%)"

set output "../graphics/sections_by_genre_and_hours_after_publishing/GENDER_KEY_PETS_normal.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_hours_after_publishing/GENDER_KEY_PETS.data.normal" using 1:2 title '' with linespoint lw 3


set title "Views By Hours After Publishing - PETS - CCDF"
set xlabel "hours after publishing"
set ylabel "views (%)"

set output "../graphics/sections_by_genre_and_hours_after_publishing/GENDER_KEY_PETS_normal_ccdf.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_hours_after_publishing/GENDER_KEY_PETS.data.normal.ccdf" using 1:2 title '' with linespoint lw 3

set title "Views By Hours After Publishing - POLITICS"
set xlabel "hours after publishing"
set ylabel "views"

set output "../graphics/sections_by_genre_and_hours_after_publishing/GENDER_KEY_POLITICS.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_hours_after_publishing/GENDER_KEY_POLITICS.data" using 1:2 title '' with linespoint lw 3


set title "Views By Hours After Publishing - POLITICS"
set xlabel "hours after publishing"
set ylabel "views (%)"

set output "../graphics/sections_by_genre_and_hours_after_publishing/GENDER_KEY_POLITICS_normal.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_hours_after_publishing/GENDER_KEY_POLITICS.data.normal" using 1:2 title '' with linespoint lw 3


set title "Views By Hours After Publishing - POLITICS - CCDF"
set xlabel "hours after publishing"
set ylabel "views (%)"

set output "../graphics/sections_by_genre_and_hours_after_publishing/GENDER_KEY_POLITICS_normal_ccdf.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_hours_after_publishing/GENDER_KEY_POLITICS.data.normal.ccdf" using 1:2 title '' with linespoint lw 3

set title "Views By Hours After Publishing - SCIENCE"
set xlabel "hours after publishing"
set ylabel "views"

set output "../graphics/sections_by_genre_and_hours_after_publishing/GENDER_KEY_SCIENCE.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_hours_after_publishing/GENDER_KEY_SCIENCE.data" using 1:2 title '' with linespoint lw 3


set title "Views By Hours After Publishing - SCIENCE"
set xlabel "hours after publishing"
set ylabel "views (%)"

set output "../graphics/sections_by_genre_and_hours_after_publishing/GENDER_KEY_SCIENCE_normal.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_hours_after_publishing/GENDER_KEY_SCIENCE.data.normal" using 1:2 title '' with linespoint lw 3


set title "Views By Hours After Publishing - SCIENCE - CCDF"
set xlabel "hours after publishing"
set ylabel "views (%)"

set output "../graphics/sections_by_genre_and_hours_after_publishing/GENDER_KEY_SCIENCE_normal_ccdf.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_hours_after_publishing/GENDER_KEY_SCIENCE.data.normal.ccdf" using 1:2 title '' with linespoint lw 3

set title "Views By Hours After Publishing - SPORTS"
set xlabel "hours after publishing"
set ylabel "views"

set output "../graphics/sections_by_genre_and_hours_after_publishing/GENDER_KEY_SPORTS.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_hours_after_publishing/GENDER_KEY_SPORTS.data" using 1:2 title '' with linespoint lw 3


set title "Views By Hours After Publishing - SPORTS"
set xlabel "hours after publishing"
set ylabel "views (%)"

set output "../graphics/sections_by_genre_and_hours_after_publishing/GENDER_KEY_SPORTS_normal.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_hours_after_publishing/GENDER_KEY_SPORTS.data.normal" using 1:2 title '' with linespoint lw 3


set title "Views By Hours After Publishing - SPORTS - CCDF"
set xlabel "hours after publishing"
set ylabel "views (%)"

set output "../graphics/sections_by_genre_and_hours_after_publishing/GENDER_KEY_SPORTS_normal_ccdf.eps"
plot[][] "../../outputs/distributions/sections_by_genre_and_hours_after_publishing/GENDER_KEY_SPORTS.data.normal.ccdf" using 1:2 title '' with linespoint lw 3