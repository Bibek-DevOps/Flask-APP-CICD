FROM python:alpine3.12
COPY . /app 
WORKDIR /app
RUN pip install -r requirements.txt 
EXPOSE 8080
ENTRYPOINT [ "python" ] 
CMD [ "run.py" ]