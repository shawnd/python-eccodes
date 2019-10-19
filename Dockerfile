FROM sdhawan/python-eccodes:2.7-2.14.1

RUN apt-get update -y \
    && apt-get install -y gcc g++ libgdal20 libgdal-dev gdal-bin python3-gdal \
    && pip install gdal==2.4.0 \
    && apt-get remove -y gcc g++