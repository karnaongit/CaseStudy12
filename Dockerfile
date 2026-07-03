FROM jupyter/pyspark-notebook:latest

WORKDIR /home/jovyan/work

COPY . .

EXPOSE 8888

CMD ["start-notebook.sh", "--NotebookApp.token=''"]