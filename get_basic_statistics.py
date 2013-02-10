"""
	Get basic statistics from file with bigdata fields:
		- total number of sections.
		- sections by day
		- sections by users
		- sections by videos
		- sections by genre
"""

import datetime
import sys

DATA_FILE = sys.argv[1] #'../results/bigdata_fields.data'


sections_count = 0
sections_by_day = {}
sections_by_users = {}
sections_by_videos = {}
sections_by_genre = {}
sections_by_day_genre = {}


input_file = open(DATA_FILE, 'r')

for line in input_file:

	(user_id, video_id, creation_time, last_update_time, genre) = line.split()

	# sections by day
	timestamp = float(creation_time) / 1000.0
	dt_obj = datetime.datetime.utcfromtimestamp(timestamp)
	dt_obj_local_time = dt_obj - datetime.timedelta(hours=3)
	date_key = "%s/%s/%s" % (dt_obj_local_time.day, dt_obj_local_time.month, dt_obj_local_time.year)
	if date_key not in sections_by_day:
		sections_by_day[date_key] = 1
	else:
		sections_by_day[date_key] += 1

	# sections by user
	if user_id not in sections_by_users:
		sections_by_users[user_id] = 1
	else:
		sections_by_users[user_id] += 1

	# sections by video
	if video_id not in sections_by_videos:
		sections_by_videos[video_id] = 1
	else:
		sections_by_videos[video_id] += 1

	# sections by genre
	if genre not in sections_by_genre:
		sections_by_genre[genre] = 1
	else:
		sections_by_genre[genre] += 1

	# sections by day and genre
	if genre not in sections_by_day_genre:
		sections_by_day_genre[genre] = {}
	if date_key not in sections_by_day_genre[genre]:
		sections_by_day_genre[genre][date_key] = 1
	else:
		sections_by_day_genre[genre][date_key] += 1

	# total sections
	sections_count += 1

input_file.close()


print "Total Sections:\n%s\n" % str(sections_count)

print "Number of days:\n",len(sections_by_day)
print "Sections by day:\n",sections_by_day,"\n"

print "Number of genres:\n",len(sections_by_genre)
print "Sections by genre:\n",sections_by_genre,"\n"

print "Number of unique users:\n",len(sections_by_users),"\n"
#print "Sections by users:\n",sections_by_users,"\n"

print "Number of unique videos:\n",len(sections_by_videos), "\n"
#print "Sections by users:\n",sections_by_users,"\n"

print "Sections by genre and day:\n",sections_by_day_genre,"\n"
