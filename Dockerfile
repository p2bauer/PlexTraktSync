FROM python:3

ADD *.py /
ADD requirements.txt /
ADD plex_trakt_sync.sh /

RUN pip install -r ./requirements.txt
RUN apt-get update && apt-get -y install cron

# CMD [ "python", "./main.py" ]

COPY ./plex_trakt_sync.sh /etc/cron.d/trakt-cron
RUN chmod +x /etc/cron.d/trakt-cron

# CMD ["crond", "-fS"]
CMD ["cron", "-f"]