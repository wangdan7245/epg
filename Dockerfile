FROM python:3.7

WORKDIR /epg

ADD . .

RUN pip install -r requirements.txt

CMD ["python", "./main.py"]
