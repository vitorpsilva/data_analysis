FROM jupyter/base-notebook
EXPOSE 8888
WORKDIR /home/jovyan/work
RUN conda install pandas \
    && conda install psycopg2 \
    && conda install beautifulsoup4
ADD dataanalysis_code.ipynb /home/jovyan/work