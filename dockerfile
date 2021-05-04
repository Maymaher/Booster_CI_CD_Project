FROM python:3.8
WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
EXPOSE 3000
ENTRYPOINT [ "python3" ]
COPY . .
CMD ["manage.py" , "runserver","0.0.0.0:3000"]
