

categories = ['COMEDY', 'FILM', 'ENTERTAINMENT', 'MUSIC', 'PEOPLE', 'PETS', 'POLITICS', 'SCIENCE', 'SPORTS']

categories_sorted  = sorted(categories)

template = """
set title "Views by Time of Day"
set xlabel "time"
set ylabel "views"

set output "../graphics/sections_by_day_hour.eps"
plot[][] "../../outputs/distributions/sections_by_day_hour.data" using 1:2 title '' with linespoint lw 3


set title "Views by Time of Day"
set xlabel "time"
set ylabel "views (%)"

set output "../graphics/sections_by_day_hour_normal.eps"
plot[][] "../../outputs/distributions/sections_by_day_hour.data.normal" using 1:2 title '' with linespoint lw 3"""

#for category in categories_sorted:
#	print template.replace('Day', 'Day - ' + category).replace('sections_by_day_hour', 'sections_by_genre_and_day_hour/GENDER_KEY_' + category)


template = """
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
plot[][] "../../outputs/distributions/sections_by_retention.data.normal.ccdf" using 1:2 title '' with linespoint lw 3"""

#for category in categories_sorted:
#	print template.replace('Distribution', 'Distribution - ' + category).replace('sections_by_retention', 'sections_by_genre_and_retention/GENDER_KEY_' + category)

template = """
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
plot[][] "../../outputs/distributions/sections_by_section_time.data.normal.ccdf" using 1:2 title '' with linespoint lw 3"""

#for category in categories_sorted:
#	print template.replace('Distribution', 'Distribution - ' + category).replace('sections_by_section_time', 'sections_by_genre_and_section_time/GENDER_KEY_' + category)



template = """
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
plot[][] "../../outputs/distributions/sections_by_hours_after_publishing.data.normal.ccdf" using 1:2 title '' with linespoint lw 3"""

for category in categories_sorted:
	print template.replace('Publishing', 'Publishing - ' + category).replace('sections_by_hours_after_publishing', 'sections_by_genre_and_hours_after_publishing/GENDER_KEY_' + category)
