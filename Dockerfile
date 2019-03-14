FROM python:2.7-slim

MAINTAINER Mario Kunz mario99.kunz@gmail.com

ENV VERSION=1.3.8 \
    AUTHORIZATION_FAIL_MAX_RETRIES=3
    #B2_ACCOUNT_ID        if set at runtime, (re)authorization is performed automatically by this docker image
    #B2_APPLICATION_KEY   if set at runtime, (re)authorization is performed automatically by this docker image

RUN pip install b2==${VERSION}

COPY files/entrypoint.sh /entrypoint.sh
COPY files/upload_file_replace.py /usr/bin/b2_upload_file_replace

ENTRYPOINT [ "/entrypoint.sh" ]
