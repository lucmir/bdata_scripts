"""
	Print specified fields of entries
	from bigdata to file.
"""

import pymongo
from pymongo import MongoClient
import sys

DB = 'bigdata'
COLLECTION = 'bigdata_player_session'
FILTER_CREATION_TIME_START = sys.argv[1] #1344826800000
FILTER_CREATION_TIME_END = sys.argv[2] #1345431600000
OUT_FILE_PATH = sys.argv[3] #'../results/' + 'bigdata_fields.data'


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
			'video_genre' : True }

filters = {'creation_time' : {'$gte': FILTER_CREATION_TIME_START, '$lt': FILTER_CREATION_TIME_END}}

results = collection.find(filters, fields)


# save result
out_file = open(OUT_FILE_PATH, 'w')

for result in results:
	if 'user_id' in result and 'video_id' in result and 'creation_time' in result and 'last_update_time' in result:
		genre = result['video_genre'] if 'video_genre' in result else 'NONE'
		line = '%s\t%s\t%s\t%s\t%s\n' % (result['user_id'], result['video_id'], result['creation_time'], result['last_update_time'], genre)
		out_file.write(line)

out_file.close()

