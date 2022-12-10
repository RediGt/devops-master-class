# FROM python:alpine3.10
# WORKDIR /app 
# COPY . /app
# RUN pip install -r requirements.txt
# EXPOSE 5000
# CMD python ./launch.py

# OPTIMIZED VERSION
FROM python:alpine3.10
WORKDIR /app 
COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt
EXPOSE 5000
COPY . /app
CMD python ./launch.py

#ENTRYPOINT ["python", "./launch.py"]