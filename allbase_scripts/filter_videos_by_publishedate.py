import datetime
import os
import sys

SECTIONS_DATA_FILE = sys.argv[1] #'../results/bigdata_fields.data'
VIDEO_INFO_FILE = sys.argv[2] #'../results/videos_info.data'
DISTRIBUTIONS_OUT_DIR = sys.argv[3] #'../results/distributions/'
REFERENCE_RANGE_START = 1340506800
REFERENCE_RANGE_END = 1341111600

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

        # filter by range
        publish_timestamp = float(publish_date)
        if publish_timestamp >= REFERENCE_RANGE_START and publish_timestamp <= REFERENCE_RANGE_END:
        	video_info_map[video_id] = (client_id, publish_date)

    input_file.close()

    return video_info_map


def increment_section_count(map, id):
    if id not in map:
        map[id] = 1
    else:
        map[id] += 1


def filter_videos_by_publishdate():

	# read video info
    video_info_map = read_video_info()

    sections_by_hours_after_publishing = {}
    sections_by_genre_and_hours_after_publishing = {}
    sections_by_days_after_publishing = {}
    sections_by_genre_and_days_after_publishing = {}

    sections_count = 0

    input_file = open(SECTIONS_DATA_FILE, 'r')

    for line in input_file:

        try:
        	(user_id, video_id, creation_time, last_update_time, genre, video_duration) = line.split()
        except:
        	LOGGER.error( 'Error in line: %s' % str(sections_count) ) 
        	continue

        if video_id in video_info_map:

            client_id = video_info_map[video_id][0]
            publish_date = video_info_map[video_id][1]

            # calculate difference
            publish_timestamp = float(publish_date)
            publish_date_dt_obj = datetime.datetime.utcfromtimestamp(publish_timestamp)
            tdelta = dt_obj - publish_date_dt_obj
            
            if tdelta.total_seconds() >= 0:
            	
            	# days hours publishing
            	tdelta_in_hours = round(tdelta.total_seconds() / 3600.0)
            	increment_section_count(sections_by_hours_after_publishing, tdelta_in_hours)

            	# sections by genre and hours after publishing
	            if genre not in sections_by_genre_and_hours_after_publishing:
	                sections_by_genre_and_hours_after_publishing[genre] = {}
	            increment_section_count(sections_by_genre_and_hours_after_publishing[genre], tdelta_in_hours)
          	
            	# days after publishing
            	tdelta_in_days = round(tdelta.total_seconds() / 86400.0 )
            	increment_section_count(sections_by_days_after_publishing, tdelta_in_days)

            	# sections by genre and days after publishing
	            if genre not in sections_by_genre_and_days_after_publishing:
	                sections_by_genre_and_days_after_publishing[genre] = {}
	            increment_section_count(sections_by_genre_and_days_after_publishing[genre], tdelta_in_days)

	    # total sections
        sections_count += 1
        if (sections_count % 1000000) == 0:
            LOGGER.info( 'Sections processed: %s' % str(sections_count) )

    input_file.close()

    return	sections_by_hours_after_publishing, sections_by_genre_and_hours_after_publishing, \
    		sections_by_days_after_publishing, sections_by_genre_and_days_after_publishing


if __name__ == "__main__":

    LOGGER.info('Starting sections counting...')
    
    LOGGER.info('Generating distributions...')

    sections_by_hours_after_publishing, sections_by_genre_and_hours_after_publishing, \
    sections_by_days_after_publishing, sections_by_genre_and_days_after_publishing = filter_videos_by_publishdate()

    if not os.path.exists(DISTRIBUTIONS_OUT_DIR):
        os.makedirs(DISTRIBUTIONS_OUT_DIR)

    LOGGER.info('Writing distributions...')

    LOGGER.info('sections_by_hours_after_publishing...')
    write_distribution(sections_by_hours_after_publishing, DISTRIBUTIONS_OUT_DIR + 'sections_by_hours_after_publishing.data')

    LOGGER.info('sections_by_genre_and_hours_after_publishing...')
    out_dir = DISTRIBUTIONS_OUT_DIR + 'sections_by_genre_and_hours_after_publishing/'
    if not os.path.exists(out_dir):
        os.makedirs(out_dir)
    for genre in sections_by_genre.keys():
        if genre in sections_by_genre_and_hours_after_publishing:
            write_distribution(sections_by_genre_and_hours_after_publishing[genre], out_dir + genre + '.data')

    LOGGER.info('sections_by_days_after_publishing...')
    write_distribution(sections_by_days_after_publishing, DISTRIBUTIONS_OUT_DIR + 'sections_by_days_after_publishing.data')

    LOGGER.info('sections_by_genre_and_days_after_publishing...')
    out_dir = DISTRIBUTIONS_OUT_DIR + 'sections_by_genre_and_days_after_publishing/'
    if not os.path.exists(out_dir):
        os.makedirs(out_dir)
    for genre in sections_by_genre.keys():
        if genre in sections_by_genre_and_days_after_publishing:
            write_distribution(sections_by_genre_and_days_after_publishing[genre], out_dir + genre + '.data')