
# set up user token in Bigplay

kinit -kt mzhan.keytab mzhan

# log into Impala shell

impala-shell -k -i l51hdpp13.na.bigdata.intraxa:21000

# DOWNLOEAD TABLE

impala-shell -k -i l51hdpp13.na.bigdata.intraxa:21000 -B -quiet -q "
select * from us_li_phase1.phase1mibdatad082515" -o MIBRawFeatures.csv --output_delimiter , 

-d axa_us_external_experian


# Run SQL file on Bigplay
impala-shell -k -i l51hdpp13.na.bigdata.intraxa:21000 -B -quiet -f Tony.sql -o Tony.csv --output_delimiter=, 

# Send file to other via bigplay
scp Tony.csv r46721@l51bxp01:.


impala-shell -k -i l51hdpp13.na.bigdata.intraxa:21000 -B -quiet -q "
select * from axa_us_external_lexisnexis.axa_lrc_return" -o ln_return.csv --output_delimiter , --print_header

# create table from file in HDFS
hadoop fs -mkdir /group/us_li/usecase/us_ia_dist/
--hadoop fs -mkdir -p /group/us_ia/usecase/us_li_1_raw/lars_in/
hadoop fs -copyFromLocal /home/mzhan/ACE_Block_PolicyList_20170630.csv /group/us_ia/usecase/us_ia_dist/
hadoop fs -ls /group/us_li/usecase/us_ia_dist/

#hive_create a new table
drop table if exists us_dao_usecase.uar_h2_hr;
CREATE EXTERNAL TABLE us_dao_usecase.uar_h2_hr
                 (
                 Full_Name	STRING	,
					User_ID	STRING	,
					employee_Mail	STRING	,
					Manager_Name	STRING	,
					Manager_User_ID	STRING	,
					Manager_Mail	STRING	,
					employment_Type	STRING	
                  ) 
                                            
ROW FORMAT SERDE                                                 
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'           
WITH SERDEPROPERTIES (                                           
  'field.delim'=',',    
  'quoteChar'     = '"')                                    
STORED AS INPUTFORMAT                                            
  'org.apache.hadoop.mapred.TextInputFormat'                     
OUTPUTFORMAT                                                     
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'   
LOCATION                                                         
  '/group/us_dao/usecase/DataLakeAccessReview/H2_2017/clean_files/hr/'
 
tblproperties("skip.header.line.count"="1");    