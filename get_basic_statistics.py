"""
	Get basic statistics from file with bigdata fields:
		- total number of sections.
		- sections by day
		- sections by users
		- sections by videos
		- sections by genre
		- video_duration_min
		- video_duration_max
		- video_duration_mean
		- video_duration_std
		- video_duration_by_genre
"""

import datetime
import sys
import math

DATA_FILE = sys.argv[1] #'../results/bigdata_fields.data'
OUT_FILE = sys.argv[2] #'../results/statistics.data'


sections_count = 0
sections_by_day = {}
sections_by_users = {}
sections_by_videos = {}
sections_by_genre = {}
sections_by_day_genre = {}

video_duration_sum = 0.0
video_duration_count = 0.0
video_duration_min = 1000000000
video_duration_max = 0
video_duration_by_genre = {}
calculate_video_duration_std = True


input_file = open(DATA_FILE, 'r')

line_count = 0
for line in input_file:

	line_count += 1 

	try:
		(user_id, video_id, creation_time, last_update_time, genre, video_duration) = line.split()
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

	# video duration
	if video_duration is not None:
		try:
			d = int(video_duration)

			video_duration_sum += d
			video_duration_count += 1
			if d < video_duration_min:
				video_duration_min = d
			if d > video_duration_max:
				video_duration_max = d

			# by genre
			if genre not in video_duration_by_genre:
				video_duration_by_genre[genre] = {}
				video_duration_by_genre[genre]['sum'] = 0.0
				video_duration_by_genre[genre]['count'] = 0.0
				video_duration_by_genre[genre]['min'] = 1000000000
				video_duration_by_genre[genre]['max'] = 0
			video_duration_by_genre[genre]['sum'] += d
			video_duration_by_genre[genre]['count'] += 1
			if d < video_duration_by_genre[genre]['min']:
				video_duration_by_genre[genre]['min'] = d
			if d > video_duration_by_genre[genre]['max']:
				video_duration_by_genre[genre]['max'] = d

		except:
			pass

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

sections_by_day.clear()
sections_by_genre.clear()
sections_by_users.clear()
sections_by_videos.clear()
sections_by_day_genre.clear()

if video_duration_count > 0:

	output_file.write("Video duration min:\n%s\n" % str(video_duration_min))
	output_file.write("Video duration max:\n%s\n" % str(video_duration_max))
	
	video_duration_mean = video_duration_sum / float(video_duration_count)
	output_file.write("Video duration mean:\n%s\n" % str(video_duration_mean))

	for genre in video_duration_by_genre.keys():
		if video_duration_by_genre[genre]['count'] > 0:
			video_duration_by_genre[genre]['mean'] = video_duration_by_genre[genre]['sum'] / float(video_duration_by_genre[genre]['count'])
			video_duration_by_genre[genre]['std'] = 0.0

	# calculate std for video duration
	if calculate_video_duration_std:
		video_duration_std = 0.0
		input_file = open(DATA_FILE, 'r')
		for line in input_file:
			try:
				(user_id, video_id, creation_time, last_update_time, genre, video_duration) = line.split()
				if video_duration is not None:
					try:
						d = int(video_duration)
						video_duration_std += math.sqrt((d - video_duration_mean)**2)
						video_duration_by_genre[genre]['std'] += math.sqrt((d - video_duration_by_genre[genre]['mean'])**2)
					except:
						pass
			except:
				continue
		input_file.close()
		
		video_duration_std = math.sqrt((1.0/(video_duration_count))*(video_duration_std/video_duration_count))
		output_file.write("Video duration std:\n%s\n" % str(video_duration_std))
		
		for genre in video_duration_by_genre.keys():
			video_duration_count = video_duration_by_genre[genre]['count']
			if video_duration_count > 0:
				video_duration_std = video_duration_by_genre[genre]['std']
				video_duration_by_genre[genre]['std'] = math.sqrt((1.0/(video_duration_count))*(video_duration_std/video_duration_count))

		output_file.write("Video duration by genre:\n%s\n" % str(video_duration_by_genre))


output_file.close()