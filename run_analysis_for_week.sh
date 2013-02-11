
BASE_DIR = $1 # ../byweek/week1 
DATE_RANGE_START = $2 #1344826800000
DATE_RANGE_END = $3 #1345431600000


mkdir -p $BASE_DIR/outputs/distributions $BASE_DIR/byweek/week1/results/graphics

cp gnuplot_scripts $BASE_DIR/byweek/week1/results


bigdata_filter_fields_all.py $DATE_RANGE_START $DATE_RANGE_END $BASE_DIR/outputs/bigdata_fields.data

