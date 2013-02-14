"""
	Generate distributions:
        - sections by date
        - sections by user
        - sections by videos
        - sections by genre
        - sections by client
        - sections by hours after publishing
        - sections by section time
        - sections by genre and hours after publishing
        - sections by genre and section time
        - sections by day hour
        - sections by genre and hour
        - sections by retention
        - sections by genre and retention
        - videos by genre
"""

import datetime
import os
import sys

SECTIONS_DATA_FILE = sys.argv[1] #'../results/bigdata_fields.data'
VIDEO_INFO_FILE = sys.argv[2] #'../results/videos_info.data'
DISTRIBUTIONS_OUT_DIR = sys.argv[3] #'../results/distributions/'

DISTRIBUTIONS_TO_GENERATE = [   \
                                'sections_by_day',
                                'sections_by_users_dist',
                                'sections_by_videos_dist',
#                                'sections_by_genre',
#                                'sections_by_client',
#                                'sections_by_hours_after_publishing',
#                                'sections_by_section_time',
#                                'sections_by_days_after_publishing',
#                                'sections_by_genre_and_hours_after_publishing',
#                                'sections_by_genre_and_section_time',
                                'sections_by_day_hour',
                                'sections_by_genre_and_day_hour',
                                'sections_by_retention',
                                'sections_by_genre_and_retention',
                                'videos_by_genre'
                            ]


GENDER_MAP = {}
GENDER_MAP['GENDER_KEY_COMEDY'] = 'COMEDY'
GENDER_MAP['GENDER_KEY_ENTERTAINMENT'] = 'ENTERTAINMENT'
GENDER_MAP['GENDER_KEY_FILM'] = 'FILM'
GENDER_MAP['GENDER_KEY_MUSIC'] = 'MUSIC'
GENDER_MAP['GENDER_KEY_PEOPLE'] = 'PEOPLE'
GENDER_MAP['GENDER_KEY_PETS'] = 'PETS'
GENDER_MAP['GENDER_KEY_POLITICS'] = 'POLITICS'
GENDER_MAP['GENDER_KEY_SCIENCE'] = 'SCIENCE'
GENDER_MAP['GENDER_KEY_SPORTS'] = 'SPORTS'
GENDER_MAP['None'] = 'UNKNOW'


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
    sections_by_genre_and_hours_after_publishing = {}
    sections_by_genre_and_section_time = {}
    sections_by_genre_and_hour = {}
    sections_by_day_hour = {}
    sections_by_genre_and_day_hour = {}
    sections_by_retention = {}
    sections_by_genre_and_retention = {}
    videos_by_genre = {}

    # read video info
    video_info_map = read_video_info()

    input_file = open(SECTIONS_DATA_FILE, 'r')

    for line in input_file:

        try:
            (user_id, video_id, creation_time, last_update_time, genre, video_duration) = line.split()
        except:
            LOGGER.error( 'Error in line: %s' % str(sections_count) ) 
            continue
        
        timestamp = float(creation_time) / 1000.0
        dt_obj = datetime.datetime.utcfromtimestamp(timestamp)
        dt_obj_local_time = dt_obj - datetime.timedelta(hours=3)
        
        # sections by day
        key = "%s/%s/%s" % (dt_obj_local_time.day, dt_obj_local_time.month, dt_obj_local_time.year)
        increment_section_count(sections_by_day, key)

        # sections by user #TODO
        increment_section_count(sections_by_users, user_id)
        
        # sections by video #TODO
        increment_section_count(sections_by_videos, video_id)

        # sections by genre
        increment_section_count(sections_by_genre, genre)

        # sections by day hour
        key = "%s/%s/%s-%s" % (dt_obj_local_time.day, dt_obj_local_time.month, 
            dt_obj_local_time.year, str(int(dt_obj_local_time.hour)+1))
        increment_section_count(sections_by_day_hour, key)  

        # videos by genre
        if genre not in videos_by_genre:
            videos_by_genre[genre] = {}
        videos_by_genre[genre][video_id] = True      

        if video_id in video_info_map:

            client_id = video_info_map[video_id][0]
            publish_date = video_info_map[video_id][1]

            # sections by client
            increment_section_count(sections_by_client, client_id)

            # hours_after_publishing
            # publish_date - creation_time
            try:
                publish_timestamp = float(publish_date)
                publish_date_dt_obj = datetime.datetime.utcfromtimestamp(publish_timestamp)
            except:
                LOGGER.error( 'Error parsing publish_date in line: %s' % str(sections_count) ) 
                continue

            tdelta = dt_obj - publish_date_dt_obj
            tdelta_in_hours = round(tdelta.total_seconds() / 3600.0)
            increment_section_count(sections_by_hours_after_publishing, tdelta_in_hours)
            # days after publishing
            tdelta_in_days = round(tdelta.total_seconds() / 86400.0 )
            increment_section_count(sections_by_days_after_publishing, tdelta_in_days)

            # sections_by_section_time (in minutes)
            # creation_time - last_update_time
            last_update_timestamp = float(last_update_time) / 1000.0
            last_update_dt_obj = datetime.datetime.utcfromtimestamp(last_update_timestamp)
            tdelta = last_update_dt_obj - dt_obj
            tdelta_in_minutes = round(tdelta.total_seconds() / 60.0)
            increment_section_count(sections_by_section_time, tdelta_in_minutes)

            # sections by genre and hours after publishing
            if genre not in sections_by_genre_and_hours_after_publishing:
                sections_by_genre_and_hours_after_publishing[genre] = {}
            increment_section_count(sections_by_genre_and_hours_after_publishing[genre], tdelta_in_hours)

            # sections by genre and section time
            if genre not in sections_by_genre_and_section_time:
                sections_by_genre_and_section_time[genre] = {}
            increment_section_count(sections_by_genre_and_section_time[genre], tdelta_in_minutes)

            # sections by genre and day hour
            if genre not in sections_by_genre_and_day_hour:
                sections_by_genre_and_day_hour[genre] = {}
            key = "%s/%s/%s-%s" % (dt_obj_local_time.day, dt_obj_local_time.month, 
                dt_obj_local_time.year, str(int(dt_obj_local_time.hour)+1))
            increment_section_count(sections_by_genre_and_day_hour[genre], key)

            # retention
            if video_duration is not None and video_duration != 'None':
                try:
                    retention = (tdelta.total_seconds() * 1000.0) / int(video_duration)
                    retention = retention if retention <= 1.0 else 1.0
                    retention = round(retention, 1)
                    increment_section_count(sections_by_retention, retention)

                    # sections by genre and retention
                    if genre not in sections_by_genre_and_retention:
                        sections_by_genre_and_retention[genre] = {}
                    increment_section_count(sections_by_genre_and_retention[genre], retention)
                except:
                    LOGGER.error( 'Error while calculating retention: %s' % str(sections_count) )
        #else:
        #    increment_section_count(sections_by_client, 'UNKNOW')
        #    increment_section_count(sections_by_hours_after_publishing, 'UNKNOW')
        #    increment_section_count(sections_by_section_time, 'UNKNOW')

        # total sections
        sections_count += 1
        if (sections_count % 100000) == 0:
            LOGGER.info( 'Sections processed: %s' % str(sections_count) )

    input_file.close()

    return  sections_count, sections_by_day, sections_by_users, sections_by_videos, \
            sections_by_genre, sections_by_client, sections_by_hours_after_publishing, \
            sections_by_days_after_publishing, sections_by_section_time, \
            sections_by_genre_and_hours_after_publishing, \
            sections_by_genre_and_section_time, sections_by_day_hour, \
            sections_by_genre_and_day_hour, sections_by_retention, \
            sections_by_genre_and_retention, videos_by_genre


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


def write_distribution(dist, out_file, omit_negative_values=False):
    """
    Write distribution to a file
    """
    
    keys = sorted(dist.keys())

    file = open(out_file, "w")

    for key in keys:
        if omit_negative_values and float(key) < 0.0:
            continue
        file.write(str(key) + '\t' + str(dist[key]) + '\n')
    
    file.close()


def write_distribution_for_date_as_key(dist, out_file, by_hour=False):

    file = open(out_file, "w")

    count = 0
    for m in range(1, 13):
        for d in range(1, 32):

            if by_hour:
                for h in range(1, 25):
                    key = '%d/%d/2012-%d' % (d, m, h)
                    if key in dist:
                        file.write(str(count) + '\t' + str(key) + '\t' + str(dist[key]) + '\n')
                        count += 1    
            else:
                key = '%d/%d/2012' % (d, m)
                if key in dist:
                    file.write(str(count) + '\t' + str(key) + '\t' + str(dist[key]) + '\n')
                    count += 1
    
    file.close()


def write_genre_distribution(dist, out_file):
    """
    Write distribution to a file
    """
    sorted_keys = sorted(GENDER_MAP.keys())

    file = open(out_file, "w")

    count = 0
    for key in sorted_keys:
        if key in dist:
            file.write(str(count) + '\t' +  GENDER_MAP[key] + '\t' + str(dist[key]) + '\n')
            count += 1
    
    file.close()


if __name__ == "__main__":

    LOGGER.info('Starting sections counting...')
    
    sections_count, sections_by_day, sections_by_users, sections_by_videos, \
        sections_by_genre, sections_by_client, sections_by_hours_after_publishing, \
        sections_by_days_after_publishing, sections_by_section_time, \
        sections_by_genre_and_hours_after_publishing, \
        sections_by_genre_and_section_time, sections_by_day_hour, \
        sections_by_genre_and_day_hour, sections_by_retention, \
        sections_by_genre_and_retention, videos_by_genre = calc_sections_count()

    LOGGER.info('Generating distributions...')

    sections_by_users_dist = get_distribution_of_values(sections_by_users)
    sections_by_videos_dist = get_distribution_of_values(sections_by_videos)

    if not os.path.exists(DISTRIBUTIONS_OUT_DIR):
        os.makedirs(DISTRIBUTIONS_OUT_DIR)

    LOGGER.info('Writing distributions...')

    if 'sections_by_day' in DISTRIBUTIONS_TO_GENERATE:
        LOGGER.info('sections_by_day...')
        write_distribution_for_date_as_key(sections_by_day, DISTRIBUTIONS_OUT_DIR + 'sections_by_day.data')
    
    if 'sections_by_users_dist' in DISTRIBUTIONS_TO_GENERATE:
        LOGGER.info('sections_by_users_dist...')
        write_distribution(sections_by_users_dist, DISTRIBUTIONS_OUT_DIR + 'sections_by_users.data')
    
    if 'sections_by_videos_dist' in DISTRIBUTIONS_TO_GENERATE:
        LOGGER.info('sections_by_videos_dist...')
        write_distribution(sections_by_videos_dist, DISTRIBUTIONS_OUT_DIR + 'sections_by_videos.data')
    
    if 'sections_by_genre' in DISTRIBUTIONS_TO_GENERATE:
        LOGGER.info('sections_by_genre...')
        write_genre_distribution(sections_by_genre, DISTRIBUTIONS_OUT_DIR + 'sections_by_genre.data')
    
    if 'sections_by_client' in DISTRIBUTIONS_TO_GENERATE:
        LOGGER.info('sections_by_client...')
        write_distribution(sections_by_client, DISTRIBUTIONS_OUT_DIR + 'sections_by_client.data')
    
    if 'sections_by_hours_after_publishing' in DISTRIBUTIONS_TO_GENERATE:
        LOGGER.info('sections_by_hours_after_publishing...')
        write_distribution(sections_by_hours_after_publishing, DISTRIBUTIONS_OUT_DIR + 'sections_by_hours_after_publishing.data',
            omit_negative_values=True)

    if 'sections_by_section_time' in DISTRIBUTIONS_TO_GENERATE:
        LOGGER.info('sections_by_section_time...')
        write_distribution(sections_by_section_time, DISTRIBUTIONS_OUT_DIR + 'sections_by_section_time.data')

    if 'sections_by_days_after_publishing' in DISTRIBUTIONS_TO_GENERATE:
        LOGGER.info('sections_by_days_after_publishing...')
        write_distribution(sections_by_days_after_publishing, DISTRIBUTIONS_OUT_DIR + 'sections_by_days_after_publishing.data',
            omit_negative_values=True)

    if 'sections_by_genre_and_hours_after_publishing' in DISTRIBUTIONS_TO_GENERATE:
        LOGGER.info('sections_by_genre_and_hours_after_publishing...')
        out_dir = DISTRIBUTIONS_OUT_DIR + 'sections_by_genre_and_hours_after_publishing/'
        if not os.path.exists(out_dir):
            os.makedirs(out_dir)
        for genre in sections_by_genre.keys():
            if genre in sections_by_genre_and_hours_after_publishing:
                write_distribution(sections_by_genre_and_hours_after_publishing[genre], out_dir + genre + '.data', 
                    omit_negative_values=True)

    if 'sections_by_genre_and_section_time' in DISTRIBUTIONS_TO_GENERATE:
        LOGGER.info('sections_by_genre_and_section_time...')
        out_dir = DISTRIBUTIONS_OUT_DIR + 'sections_by_genre_and_section_time/'
        if not os.path.exists(out_dir):
            os.makedirs(out_dir)
        for genre in sections_by_genre.keys():
            if genre in sections_by_genre_and_section_time:
                write_distribution(sections_by_genre_and_section_time[genre], out_dir + genre + '.data')

    if 'sections_by_day_hour' in DISTRIBUTIONS_TO_GENERATE:
        LOGGER.info('sections_by_day_hour...')
        write_distribution_for_date_as_key(sections_by_day_hour, 
            DISTRIBUTIONS_OUT_DIR + 'sections_by_day_hour.data', by_hour=True)

    if 'sections_by_genre_and_day_hour' in DISTRIBUTIONS_TO_GENERATE:
        LOGGER.info('sections_by_genre_and_day_hour...')
        out_dir = DISTRIBUTIONS_OUT_DIR + 'sections_by_genre_and_day_hour/'
        if not os.path.exists(out_dir):
            os.makedirs(out_dir)
        for genre in sections_by_genre.keys():
            if genre in sections_by_genre_and_day_hour:
                write_distribution_for_date_as_key(sections_by_genre_and_day_hour[genre], 
                    out_dir + genre + '.data', by_hour=True)

    if 'sections_by_retention' in DISTRIBUTIONS_TO_GENERATE:
        LOGGER.info('sections_by_retention...')
        write_distribution(sections_by_retention, DISTRIBUTIONS_OUT_DIR + 'sections_by_retention.data')

    if 'sections_by_genre_and_retention' in DISTRIBUTIONS_TO_GENERATE:
        LOGGER.info('sections_by_genre_and_retention...')
        out_dir = DISTRIBUTIONS_OUT_DIR + 'sections_by_genre_and_retention/'
        if not os.path.exists(out_dir):
            os.makedirs(out_dir)
        for genre in sections_by_genre.keys():
            if genre in sections_by_genre_and_retention:
                write_distribution(sections_by_genre_and_retention[genre], out_dir + genre + '.data')

    if 'videos_by_genre' in  DISTRIBUTIONS_TO_GENERATE:
        LOGGER.info('videos_by_genre...')
        sorted_keys = sorted(GENDER_MAP.keys())
        file = open(DISTRIBUTIONS_OUT_DIR + 'videos_by_genre.data', "w")
        count = 0
        for key in sorted_keys:
            if key in videos_by_genre:
                file.write(str(count) + '\t' +  GENDER_MAP[key] + '\t' + str(len(videos_by_genre[key])) + '\n')
                count += 1
        file.close()
