gcloud compute ssh airflow --project=nyt-pax-dev --zone=us-east1-d
sudo su root
docker exec -it f94 bash # docker ps -a # check container Id
exit
screen -D -r melody1

## creat a new screen : screen -dSm melody1
## link to the screen : screen -r melody1 


# go to airflow

cd /opt
cd repo/

git pull origin branch


# launch cluster
gcloud dataproc clusters create dim-account-billing-freq --project nyt-pax-dev --bucket nyt-pax-logs-dataproc-dev --zone us-east1-d --master-machine-type n1-highmem-8 --master-boot-disk-size 500 --num-workers 10 --worker-machine-type n1-standard-4 --worker-boot-disk-size 500 --image-version 1.2 --scopes 'https://www.googleapis.com/auth/cloud-platform,https://www.googleapis.com/auth/spreadsheets.readonly' --initialization-actions 'gs://nyt-pax-config-dev/dataproc/pipeline-packages.sh'


# dim_area skip date 20170116 : REGION_MNGR_REPORT is empty
# skip date 20170202/20170203
python -m nyt_pdw.dataproc_launch --mode lake --project nyt-pax-dev --cluster dim-area	 --notebook provisional/dim_area --date_range 20170204,20180207 --app_task_limit 1

python -m nyt_pdw.dataproc_launch --mode lake --project nyt-pax-dev --cluster dim-area	 --notebook provisional/dim_area --date 20180208 --app_task_limit 1



python -m nyt_pdw.dataproc_launch --mode lake --project nyt-pax-dev --cluster dim-complaint-reason	 --notebook dim_complaint_reason --date 20180208 --app_task_limit 1  

python -m nyt_pdw.dataproc_launch --mode lake --project nyt-pax-dev --cluster dim-complaint-reason	 --notebook dim_complaint_reason_history --date 2017022 --app_task_limit 1  

python -m nyt_pdw.dataproc_launch --mode lake --project nyt-pax-dev --cluster dim-complaint-reason	 --notebook dim_complaint_reason --date_range 20171201,20180207  --app_task_limit 1   


# dim_account_billing_freq
python -m nyt_pdw.dataproc_launch --mode lake --project nyt-pax-dev --cluster dim-account-billing-freq3	 --notebook dim_account_billing_frequency --date_range 20160405,20180301 --app_task_limit 1
