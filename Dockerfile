FROM python:3

ADD *.py /
ADD requirements.txt /

RUN pip install -r ./requirements.txt

# CMD [ "python", "./main.py" ]

COPY ./plex_trakt_sync.sh /etc/periodic/15min/job
RUN chmod +x /etc/periodic/15min/job

CMD ["crond", "-fS"]