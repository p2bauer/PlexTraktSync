FROM python:3

ADD *.py /
ADD requirements.txt /

RUN pip install -r ./requirements.txt
RUN apt-get update && apt-get -y install cron

ADD plex_trakt_sync.sh /etc/cron.d/trakt-cron
RUN chmod 0644 /etc/cron.d/trakt-cron

# CMD ["cron", "-f"]

# Create the log file to be able to run tail
# Run the command on container startup
CMD cron && touch /var/log/cron.log && tail -F /var/log/cron.log