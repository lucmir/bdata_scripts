"""
	Get information on liquid database 
	of videos from bigdata.
"""

import datetime
import MySQLdb as mdb


DATA_FILE = '../results/bigdata_fields.data'
OUT_FILE = '../results/videos_info.data'

DB_HOST = 'localhost'
DB_USER = 'root'
DB_PASSWD = 'root'
DB_NAME = 'client_20'


# retrieve video ids
videos_map = {}

input_file = open(DATA_FILE, 'r')

for line in input_file:

	(user_id, video_id, creation_time, last_update_time) = line.split()

	if video_id not in videos_map:
		videos_map[video_id] = True

input_file.close()


# retrieve information for each video
video_id_list = ','.join([ '\'' + str(i) + '\'' for i in videos_map.keys()])

query = 'SELECT * FROM MEDIA WHERE ID IN (' + video_id_list + ')'

out_file = file(OUT_FILE, 'w')

con = mdb.connect(DB_HOST, DB_USER, DB_PASSWD, DB_NAME);

with con: 
    cur = con.cursor()
    cur.execute(query)

    rows = cur.fetchall()
    for row in rows:
    	out_file.write(str(row[9]) + '\n')


out_file.close()