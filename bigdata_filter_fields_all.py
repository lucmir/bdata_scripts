"""
	Print specified fields of entries
	from bigdata to file.
"""

import pymongo
from pymongo import MongoClient


#DB = 'bigdata1hour'
#COLLECTION = 'bigdata_player_session'
#OUT_FILE_PATH = '../results/' + 'bigdata_fields.data'

DB = 'bigdata'
COLLECTION = 'bigdata_player_session'
OUT_FILE_PATH = '../allbase/outputs/' + 'bigdata_fields.data'

# connect
connection = MongoClient()
db = connection[DB]
collection = db[COLLECTION]

# submit queue
fields = {  '_id' : False,
			'creation_time' : True,
			'last_update_time' : True,
			'video_id' : True,
			'user_id' : True,
			'video_genre' : True,
			'video_duration' : True }

filters = {}

results = collection.find(filters, fields)


# save result
out_file = open(OUT_FILE_PATH, 'w')

for result in results:
	
	if 'user_id' in result and 'video_id' in result and 'creation_time' in result and 'last_update_time' in result and 'video_duration' in result:
		genre = result['video_genre'] if 'video_genre' in result else 'NONE'
		line = '%s\t%s\t%s\t%s\t%s\t%s\n' % (result['user_id'], result['video_id'], \
			result['creation_time'], result['last_update_time'], genre, result['video_duration'])
		out_file.write(line)

out_file.close

