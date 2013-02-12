"""
	Get information on liquid database 
	of videos from bigdata.
"""

import datetime
import MySQLdb as mdb
import sys


DATA_FILE = sys.argv[1]  #'../results/bigdata_fields.data'
OUT_FILE = sys.argv[2]  #'../results/videos_info.data'

DB_HOST = 'localhost'
DB_USER = 'root'
DB_PASSWD = 'root'
DB_NAME = 'client_20'


# retrieve video ids
videos_map = {}

input_file = open(DATA_FILE, 'r')

line_count = 0

for line in input_file:

    line_count += 1
    try:
        (user_id, video_id, creation_time, last_update_time, genre, video_duration) = line.split()
    except:
        print 'Error parsing line: ' + str(line_count)
        continue

    if video_id not in videos_map:
        if '\'' not in video_id or '\"' not in video_id:
            videos_map[video_id] = True

input_file.close()


# retrieve information for each video
video_id_list = ','.join([ '\'' + str(i) + '\'' for i in videos_map.keys()])

query = 'SELECT ' \
+ ' ID, ' \
+ ' CLIENT_ID, ' \
+ ' PUBLISH_START ' \
+ ' FROM MEDIA WHERE ID IN (' + video_id_list + ')'

out_file = file(OUT_FILE, 'w')

con = mdb.connect(DB_HOST, DB_USER, DB_PASSWD, DB_NAME);

with con: 
    cur = con.cursor()
    cur.execute(query)

    rows = cur.fetchall()
    for row in rows:
    	
    	mid = str(row[0])
    	cid = str(row[1])
    	pdate = row[2].strftime("%s") if row[2] is not None else 'None'
    	
    	line = '%s\t%s\t%s\n' % (mid, cid, pdate)
    	out_file.write(line)

out_file.close()
