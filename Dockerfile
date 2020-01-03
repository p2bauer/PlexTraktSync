FROM python:3

ADD *.py /
ADD requirements.txt /

RUN pip install -r ./requirements.txt
RUN apt-get update && apt-get -y install cron

# cron docker example taken from https://github.com/Ekito/docker-cron

# Copy cron file to the cron.d directory
COPY plex_trakt_cron /etc/cron.d/plex_trakt_cron

# Give execution rights on the cron job
RUN chmod +x /etc/cron.d/plex_trakt_cron

# Apply cron job
RUN crontab /etc/cron.d/plex_trakt_cron

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Run the command on container startup
CMD cron && tail -f /var/log/cron.log