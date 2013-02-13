#!/bin/bash

BASE_DIR='../../outputs/distributions'

for i in sections_by_users.data \
sections_by_videos.data \
sections_by_section_time.data \
sections_by_retention.data \
sections_by_days_after_publishing.data \
sections_by_hours_after_publishing.data \
sections_by_day_hour.data; do
	./generateCCDFNormalDist.sh $BASE_DIR/$i $BASE_DIR/$i.normal 1
	./generateCCDFNormalDist.sh $BASE_DIR/$i $BASE_DIR/$i.ccdf 2
	./generateCCDFNormalDist.sh $BASE_DIR/$i $BASE_DIR/$i.normal.ccdf 3
done;

for i in sections_by_genre_and_retention \
sections_by_genre_and_hours_after_publishing \
sections_by_genre_and_section_time \
sections_by_genre_and_day_hour; do
	for j in `ls -1 $BASE_DIR/$i`; do
		./generateCCDFNormalDist.sh $BASE_DIR/$i/$j $BASE_DIR/$i/$j.normal 1
		./generateCCDFNormalDist.sh $BASE_DIR/$i/$j $BASE_DIR/$i/$j.ccdf 2
		./generateCCDFNormalDist.sh $BASE_DIR/$i/$j $BASE_DIR/$i/$j.normal.ccdf 3
	done;
done;



