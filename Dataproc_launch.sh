
— check the google package installed in master node: 
sudo /usr/local/bin/pip install --upgrade google.cloud

sudo /usr/local/bin/pip install --upgrade google-api-python-client


— run the line in local command line
python -m nyt_pdw.dataproc_launch --mode lake --project nyt-dsr-dev --cluster melodyproduct2	 --notebook dim_account_billing_frequency --date_range 20160406,20160408 --app_task_limit 1


python -m nyt_pdw.dataproc_launch --mode lake --project nyt-dsr-dev --cluster melodyproduct2	 --notebook provisional/dim_area --date 20181007

python -m nyt_pdw.dataproc_launch --mode lake --project nyt-dsr-dev --cluster melodyproduct	 --notebook dim_account --date_range 20171128,20180102 --app_task_limit 10


python -m nyt_pdw.dataproc_launch --mode lake --project nyt-pax-prd --cluster rebuild-dim-stop-reason-root-1515600415  --notebook dim_campaign --date 20171207


gcloud dataproc clusters create melodyproduct \
    --bucket nyt-pdw-dataproc-logs \
    --zone us-east1-d \
    --master-machine-type n1-standard-8 \
    --master-boot-disk-size 500 \
    --num-workers 2 \
    --worker-machine-type n1-standard-4 \
    --worker-boot-disk-size 500 \
    --image-version 1.2 \
    --scopes 'https://www.googleapis.com/auth/cloud-platform'\
    --project nyt-dsr-dev --initialization-actions 'gs://nyt-pdw-config/dataproc/pipeline-packages.sh'

—— read google spreadsheet

gcloud dataproc clusters create melodyproduct2 \
   --bucket nyt-pdw-dataproc-logs \
   --zone us-east1-d \
   --master-machine-type n1-standard-8 \
   --master-boot-disk-size 500 \
   --num-workers 2 \
   --worker-machine-type n1-standard-4 \
   --worker-boot-disk-size 500 \
   --image-version 1.2 \
   --scopes 'https://www.googleapis.com/auth/cloud-platform,https://www.googleapis.com/auth/spreadsheets.readonly'\
   --project nyt-dsr-dev --initialization-actions 'gs://nyt-pdw-config/dataproc/pipeline-packages.sh'



- Debug for import-non-package in master node
sudo /usr/local/bin/pip install numpy --upgrade

— using apiclient for getting google spreadsheets

from now on we need to use googleapiclient as the import

— plugable type 2

# ! pip uninstall nyt_pdw --yes && rm -fr /opt/print_data_warehouse
# get_ipython().system(u' cd /opt && gcloud source repos clone nyt-pdw print_data_warehouse --project=nyt-dsr-dev && cd /opt/print_data_warehouse && git checkout bw_pluggable_type2 && git pull && pip install ./')
