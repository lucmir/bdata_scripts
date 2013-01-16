"""
	Generate distributions:
        - sections by date
        - sections by user
        - sections by videos
        - sections by genre
        - sections by client
        - sections by hours after publishing
        - sections by section time
"""

import datetime
import MySQLdb as mdb


SECTIONS_DATA_FILE = '../results/bigdata_fields.data'
VIDEO_INFO_FILE = '../results/video_info.data'


def read_video_info():
    """
    Read video info data.
    
    @return video_info_map
    """
    video_info_map = {}

    input_file = open(VIDEO_INFO_FILE, 'r')

    for line in input_file:

        (video_id, client_id, publish_date) = line.split()

        video_info_map[video_id] = (client_id, publish_date)

    input_file.close()

    return video_info_map


def increment_section_count(map, id):
    if id not in map:
        map[id] = 1
    else:
        map[id] += 1


def calc_sections_count():

    sections_count = 0
    sections_by_day = {}
    sections_by_users = {}
    sections_by_videos = {}
    sections_by_genre = {}
    sections_by_client = {}
    sections_by_hours_after_publishing = {}
    sections_by_section_time = {}

    # read video info
    video_info_map = read_video_info()

    input_file = open(SECTIONS_DATA_FILE, 'r')

    for line in input_file:

        (user_id, video_id, creation_time, last_update_time, genre) = line.split()
        
        # sections by day
        timestamp = float(creation_time) / 1000.0
        dt_obj = datetime.datetime.utcfromtimestamp(timestamp)
        dt_obj_local_time = dt_obj - datetime.timedelta(hours=3)
        key = "%s/%s/%s" % (dt_obj_local_time.day, dt_obj_local_time.month, dt_obj_local_time.year)
        increment_section_count(sections_by_day, key)

        # sections by user #TODO
        increment_section_count(sections_by_users, user_id)
        
        # sections by video #TODO
        increment_section_count(sections_by_videos, video_id)

        # sections by genre
        increment_section_count(sections_by_genre, genre)

        
        if video_id in video_info_map:

            client_id = video_info_map[video_id][0]
            publish_date = video_info_map[video_id][1]

            # sections by client
            increment_section_count(sections_by_client, client_id)

            # hours_after_publishing
            #TODO timestamp - publish_date

            # sections_by_section_time (in minutes)
            #TODO creation_time - last_update_time

        else:
            increment_section_count(sections_by_client, 'UNKNOW')
            increment_section_count(sections_by_hours_after_publishing, 'UNKNOW')
            increment_section_count(sections_by_section_time, 'UNKNOW')

        # total sections
        sections_count += 1

    input_file.close()

    return  sections_count, sections_by_day, sections_by_users, sections_by_videos, \
            sections_by_genre, sections_by_client, sections_by_hours_after_publishing, \
            sections_by_section_time



if __name__ == "__main__":
    
    sections_count, sections_by_day, sections_by_users, sections_by_videos, \
        sections_by_genre, sections_by_client, sections_by_hours_after_publishing, \
        sections_by_section_time = calc_distributions()