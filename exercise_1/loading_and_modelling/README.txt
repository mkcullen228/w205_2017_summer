Loading and Modeling Datafiles for exercise 1

Exercise1_ERD_all is a png of ERD for data from the Centers for Medicare and
	Medicaid Services (CMS) Hospital Compare - but may be hard to read
Exercise1_ERD_zoom.png is a png of ERD but zoomed loser to see the entitry and
	relationships more closely

load_data_lake.sh - Load the raw data files into HDFS
CLEAN_load_datalake - removes data loaded into hdfs and cleans the hdfs up. 
hive_base_ddle.sql - data definition statements for medicade data in hdfs that was loaded in load_data_lake

