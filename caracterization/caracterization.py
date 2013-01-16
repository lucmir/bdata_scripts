'''
Script to do some data caracterizations.

@author: lucas.
'''

# -*- coding: utf-8 -*-

import simplejson as json
from sets import Set
import sys


def set_logger():
	"""
	Configure logging in file.
	"""
	import logging
	logger = logging.getLogger('caracterization')
	hdlr = logging.FileHandler('caracterization.log')
	formatter = logging.Formatter('%(asctime)s %(levelname)s %(message)s')
	hdlr.setFormatter(formatter)
	logger.addHandler(hdlr)
	logger.setLevel(logging.DEBUG)
	return logger

# set logging
LOGGER = set_logger()


def parse_json_data(json_data, fields):
	"""
	Parse json data and add new fields on set "fields".
	"""

	if json_data is not None and len(json_data) > 0:
		try:
			data = json.loads(json_data)
			for key, value in data.iteritems():
				fields.add(key)
		except:
			LOGGER.error('Error while parsing data: ' + json_data)


def usage():
	return """Usage: -i <input-file-path> -u <user-out-file> -v <video-out-file>"""


def read_parameters():
	"""
	Read parameters from command line.
	"""
	import getopt
	
	opts, extraparams = getopt.getopt(sys.argv[1:], 'i:u:v:') 
	
	input_file = None
	user_out_file = None
	video_out_file = None

	for o,p in opts:
  		if o in ['-i']:
  			input_file = p
		if o in ['-u']:
			user_out_file = p
		if o in ['-v']:
			video_out_file = p

	if input_file is None or len(input_file) == 0 or \
		user_out_file is None or len(user_out_file) == 0 or \
		video_out_file is None or len(video_out_file) == 0:
		print usage()
		exit()
  	
  	return input_file, user_out_file, video_out_file
	

def get_counts(input_file):
	"""
	Return counts:
		- total register count
		- unique user count
		- unique vide count
		- views by user
		- views by video
	"""
	
	register_count = 0	
	user_hash = {}
	unknown_users = 0
	video_hash = {}
	unknown_videos = 0

	infile = open(input_file, 'r')
	
	for line in infile:
		
		try:
			data = json.loads(line)

			if 'user_id' in data:
				user_id = data['user_id']
				if user_id in user_hash:
					user_hash[user_id] += 1
				else:
					user_hash[user_id] = 1
			else:
				unknown_users += 1

			if 'video_id' in data:
				video_id = data['video_id']
				if video_id in video_hash:
					video_hash[video_id] += 1
				else:
					video_hash[video_id] = 1
			else:
				unknown_videos += 1
				
			register_count += 1
		except Exception, e:
			#LOGGER.error('Error while parsing data: ' + line + '-> ' + str(e))
			LOGGER.error('Error while parsing data: ' + str(register_count) + '-> ' + str(e))
	
	infile.close()

	unique_user_count = len(user_hash)
	unique_video_count = len(video_hash)

	# TODO retornar os hashes tambem (distribuicao por usuario e por video)
	return register_count, unique_user_count, unknown_users, unique_video_count, unknown_videos, user_hash, video_hash


def get_distribution(dict, out_file):
	"""
	Get distribution from a dict (id->occurrences)
	"""
	distribution = {}

	values = sorted(dict.values())

	for value in values:
		if value in distribution:
			distribution[value] += 1
		else:
			distribution[value] = 1


	file = open(out_file, "w")
	for key, value in distribution.iteritems():
		file.write(str(key) + '\t' + str(value) + '\n')
	file.close()

	return distribution



if __name__ == "__main__":

	input_file, user_out_file, video_out_file = read_parameters()
	
	register_count, unique_user_count, unknown_users,  unique_video_count, unknown_videos, user_hash, video_hash = get_counts(input_file)
	
	print "total=%s, unique users=%s, unknown users=%s, unique videos=%s, unknown videos=%s\n" % (str(register_count), 
		str(unique_user_count), str(unknown_users), str(unique_video_count), str(unknown_videos))

	get_distribution(user_hash, user_out_file)
	get_distribution(video_hash, video_out_file)
