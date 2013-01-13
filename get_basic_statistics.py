"""
	Get basic statistics from file with bigdata fields:
		- total number of sections.
		- number of sections by day.
"""

import datetime


DATA_FILE = '../results/bigdata_fields.data'


sections_count = 0
sections_by_day = {}
sections_by_users = {}
sections_by_videos = {}


input_file = open(DATA_FILE, 'r')

for line in input_file:

	(user_id, video_id, creation_time, last_update_time) = line.split()

	# sections by day
	timestamp = float(creation_time) / 1000.0
	dt_obj = datetime.datetime.utcfromtimestamp(timestamp)
	key = "%s/%s/%s" % (dt_obj.day,dt_obj.month,dt_obj.year)
	if key not in sections_by_day:
		sections_by_day[key] = 1
	else:
		sections_by_day[key] += 1

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

	# total sections
	sections_count += 1

input_file.close()


print "Total Sections:\n%s\n" % str(sections_count)

print "Number of days:\n",len(sections_by_day)
print "Sections by day:\n",sections_by_day,"\n"

print "Number of unique users:\n",len(sections_by_users),"\n"
#print "Sections by users:\n",sections_by_users,"\n"

print "Number of unique videos:\n",len(sections_by_videos)
#print "Sections by users:\n",sections_by_users,"\n"
