from datetime import datetime, timedelta
from functools import partial
from multiprocessing.dummy import Pool
from subprocess import call
d1 = (datetime.strptime('20180221', '%Y%m%d'))
d2 = (datetime.strptime('20180301', '%Y%m%d'))
delta = d2 - d1  # timedelta
commands = []
for i in range(delta.days + 1):
    d = d1 + timedelta(days=i)
    cmd = "gsutil -m cp gs://nyt-pax-hdsor-prd/ingest/aristo/SUBSCRIBER_ACCT/{date}/* gs://nyt-pax-hdsor-dev/ingest/aristo/SUBSCRIBER_ACCT/{date}".format(date=d.strftime('%Y%m%d'))
    print(cmd)
    commands.append(cmd)
if commands:
    pool = Pool(10)  # concurrent commands at a time
    for i, returncode in enumerate(pool.imap(partial(call, shell=True), commands)):
        if returncode != 0:
            print("%d command failed: %d" % (i, returncode))


#gsutil -m cp gs://nyt-pax-hdsor-prd/lake/dim_account/20180314/DIM_ACCOUNT_EXTENDED/* gs://nyt-pdw-dev/lake/dim_account/20180314/DIM_ACCOUNT_EXTENDED

 gsutil -m cp gs://nyt-pax-hdsor-prd/ingest/retail/FI_CUSTTYPES/20180314/* gs://nyt-pax-hdsor-dev/ingest/retail/FI_CUSTTYPES/20180314

# gsutil -m cp gs://nyt-pax-hdsor-prd/ingest/aristo/REGION_MNGR_REPORT/20180208/* gs://nyt-pax-hdsor-dev/ingest/aristo/REGION_MNGR_REPORT/20180208
