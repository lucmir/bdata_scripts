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
OUT_FILE = sys.argv[2] #'../results/statistics.data'

sections_count = 0
sections_by_day = {}
sections_by_users = {}
sections_by_videos = {}
sections_by_genre = {}
sections_by_day_genre = {}


input_file = open(DATA_FILE, 'r')

line_count = 0
for line in input_file:

	line_count += 1 
	if (line_count % 100000) == 0:
		print "LINHAS PERCORRIDAS: ", str(line_count)

	try:
		(user_id, video_id, creation_time, last_update_time, genre) = line.split()
	except:
		print 'Error parsing line: ' + str(line_count)
		continue

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
		sections_by_users[user_id] = True

	# sections by video
	if video_id not in sections_by_videos:
		sections_by_videos[video_id] = True

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


output_file = open(OUT_FILE, 'w')


output_file.write("Total Sections:\n%s\n\n" % str(sections_count))

output_file.write("Number of days:%s\n\n" % str(len(sections_by_day)))
output_file.write("Sections by day:%s\n\n" % str(sections_by_day))

output_file.write("Number of genres:%s\n\n" % str(len(sections_by_genre)))
output_file.write("Sections by genre:%s\n\n" % str(sections_by_genre))

output_file.write("Number of unique users:%s\n\n" % str(len(sections_by_users)))
#print "Sections by users:\n",sections_by_users,"\n"

output_file.write("Number of unique videos:%s\n\n" % str(len(sections_by_videos)))
#print "Sections by users:\n",sections_by_users,"\n"

output_file.write("Sections by genre and day:%s\n\n" % str(sections_by_day_genre))

output_file.close()
