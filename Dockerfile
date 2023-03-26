FROM python:3.10

WORKDIR /epg

ADD . .

RUN mkdir -p ./download
RUN apt update
RUN apt install -y cron
ADD cronfile /etc/cron.d/submit-cron
RUN chmod 0644 /etc/cron.d/submit-cron
RUN touch /var/log/cron.log

RUN pip install --upgrade pip && pip install -r requirements.txt

CMD ["python","manage.py","runserver","0.0.0.0:80"]
