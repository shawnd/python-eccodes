FROM sdhawan/python-eccodes:3.7-2.14.0

RUN apt-get update -y \
    && apt-get install -y gcc g++ libgdal20 libgdal-dev gdal-bin \
    && pip install gdal==2.4.0 \
    && apt-get remove -y gcc g++