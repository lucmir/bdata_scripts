
BASE_DIR=$1 		# ../byweek/week1 
DATE_RANGE_START=$2	#1344826800000
DATE_RANGE_END=$3	#1345431600000

echo 'argumentos: basedir='$BASE_DIR', daterangestart='$DATE_RANGE_START', daterangeend='$DATE_RANGE_END
echo;

echo 'Creating directories...';
mkdir -p $BASE_DIR/outputs/distributions $BASE_DIR/results/graphics
cp -r gnuplot_scripts $BASE_DIR/results
echo;

echo 'Running bigdata_filter_fields.py...'
time python bigdata_filter_fields.py $DATE_RANGE_START $DATE_RANGE_END $BASE_DIR/outputs/bigdata_fields.data
echo;

echo 'Running get_basic_statistics...'
time python get_basic_statistics.py $BASE_DIR/outputs/bigdata_fields.data $BASE_DIR/results/basic_statistics.data
echo;

echo 'Running get_video_info...'
time python get_videos_info.py $BASE_DIR/outputs/bigdata_fields.data $BASE_DIR/outputs/video_info.data
echo;

echo 'Running generate_distribution...'
time python generate_distributions.py $BASE_DIR/outputs/bigdata_fields.data $BASE_DIR/outputs/video_info.data $BASE_DIR/outputs/distributions/
echo;

echo 'Generating graphics...'
cd $BASE_DIR/results/gnuplot_scripts; ./generateGraphics.sh;
echo;

#TODO executar gnuplots
