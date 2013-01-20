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
import os

SECTIONS_DATA_FILE = '../results/bigdata_fields.data'
VIDEO_INFO_FILE = '../results/videos_info.data'
DISTRIBUTIONS_OUT_DIR = '../results/distributions/'


def set_logger():
    """
    Configure logging in file.
    """
    import logging

    script_file_name = os.path.basename(__file__)
    logger_name = script_file_name.replace('.py', '')
    log_file_name = logger_name + '.log'

    logger = logging.getLogger(logger_name)
    hdlr = logging.FileHandler(log_file_name)

    formatter = logging.Formatter('%(asctime)s %(levelname)s %(message)s')
    hdlr.setFormatter(formatter)
    logger.addHandler(hdlr)
    logger.setLevel(logging.DEBUG)
    
    return logger

# set logging
LOGGER = set_logger()


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
    sections_by_days_after_publishing = {}
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
            # publish_date - creation_time
            publish_timestamp = float(publish_date)
            publish_date_dt_obj = datetime.datetime.utcfromtimestamp(publish_timestamp)
            tdelta = dt_obj - publish_date_dt_obj
            tdelta_in_hours = round(tdelta.total_seconds() / 3600.0)
            increment_section_count(sections_by_hours_after_publishing, tdelta_in_hours)
            # days after publishing
            tdelta_in_days = round(tdelta.total_seconds() / 60.0)
            increment_section_count(sections_by_days_after_publishing, tdelta_in_days)

            # sections_by_section_time (in minutes)
            # creation_time - last_update_time
            last_update_timestamp = float(last_update_time) / 1000.0
            last_update_dt_obj = datetime.datetime.utcfromtimestamp(last_update_timestamp)
            tdelta = last_update_dt_obj - dt_obj
            tdelta_in_minutes = round(tdelta.total_seconds() / 60.0)
            increment_section_count(sections_by_section_time, tdelta_in_minutes)

        else:
            increment_section_count(sections_by_client, 'UNKNOW')
            increment_section_count(sections_by_hours_after_publishing, 'UNKNOW')
            increment_section_count(sections_by_section_time, 'UNKNOW')

        # total sections
        sections_count += 1
        if (sections_count % 100000) == 0:
            LOGGER.info( 'Sections processed: %s' % str(sections_count) )

    input_file.close()

    return  sections_count, sections_by_day, sections_by_users, sections_by_videos, \
            sections_by_genre, sections_by_client, sections_by_hours_after_publishing, \
            sections_by_days_after_publishing, sections_by_section_time


def get_distribution_of_values(dict):
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
    return distribution


def write_distribution(dist, out_file):
    """
    Write distribution to a file
    """
    
    keys = sorted(dist.keys())

    file = open(out_file, "w")

    for key in keys:
        file.write(str(key) + '\t' + str(dist[key]) + '\n')
    
    file.close()


if __name__ == "__main__":

    LOGGER.info('Starting sections counting...')
    
    sections_count, sections_by_day, sections_by_users, sections_by_videos, \
        sections_by_genre, sections_by_client, sections_by_hours_after_publishing, \
        sections_by_days_after_publishing, sections_by_section_time = calc_sections_count()

    LOGGER.info('Generating distributions...')

    sections_by_users_dist = get_distribution_of_values(sections_by_users)
    sections_by_videos_dist = get_distribution_of_values(sections_by_videos)

    if not os.path.exists(DISTRIBUTIONS_OUT_DIR):
        os.makedirs(DISTRIBUTIONS_OUT_DIR)

    LOGGER.info('Writing distributions...')

    LOGGER.info('sections_by_day...')
    write_distribution(sections_by_day, DISTRIBUTIONS_OUT_DIR + 'sections_by_day.data')
    
    LOGGER.info('sections_by_users_dist...')
    write_distribution(sections_by_users_dist, DISTRIBUTIONS_OUT_DIR + 'sections_by_users.data')
    
    LOGGER.info('sections_by_videos_dist...')
    write_distribution(sections_by_videos_dist, DISTRIBUTIONS_OUT_DIR + 'sections_by_videos.data')
    
    LOGGER.info('sections_by_genre...')
    write_distribution(sections_by_genre, DISTRIBUTIONS_OUT_DIR + 'sections_by_genre.data')
    
    LOGGER.info('sections_by_client...')
    write_distribution(sections_by_client, DISTRIBUTIONS_OUT_DIR + 'sections_by_client.data')
    
    LOGGER.info('sections_by_hours_after_publishing...')
    write_distribution(sections_by_hours_after_publishing, DISTRIBUTIONS_OUT_DIR + 'sections_by_hours_after_publishing.data')

    LOGGER.info('sections_by_section_time...')
    write_distribution(sections_by_section_time, DISTRIBUTIONS_OUT_DIR + 'sections_by_section_time.data')

    LOGGER.info('sections_by_days_after_publishing...')
    write_distribution(sections_by_days_after_publishing, DISTRIBUTIONS_OUT_DIR + 'sections_by_days_after_publishing.data')
