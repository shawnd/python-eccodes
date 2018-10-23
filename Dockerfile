FROM python:2.7-slim-jessie

ENV ECCODES_VERSION 2.9.0

RUN pip install numpy \
    && echo 'deb http://ftp.debian.org/debian jessie-backports main' >> /etc/apt/sources.list \
    && apt-get update -y \
    && apt-get -y -t jessie-backports install libaec-dev libsz2 \
    && apt-get install -y libhdf5-dev libjpeg-dev libjpeg62-turbo libjpeg62-turbo-dev libopenjpeg-dev libjasper-runtime libjasper-dev libpng-dev linux-libc-dev zlib1g-dev libc-dev-bin libc6-dev libgomp1 libquadmath0 gcc gfortran wget cmake \
	&& cd /tmp \
	&& wget http://shdh.ca/eccodes-2.9.0-Source.tar.gz \
    && tar xvzf eccodes-${ECCODES_VERSION}-Source.tar.gz \
    && rm -f eccodes-${ECCODES_VERSION}-Source.tar.gz \
    && mkdir /tmp/build \
    && cd /tmp/build \
    && cmake /tmp/eccodes-${ECCODES_VERSION}-Source \
    && make \
    && make install \
    && cd /tmp/build/python \
    && python setup.py install \
&& rm -rf /tmp/* && apt-get remove -y libaec-dev libhdf5-dev libjpeg-dev libjpeg62-turbo-dev libopenjpeg-dev libjasper-dev libpng-dev linux-libc-dev zlib1g-dev libc-dev-bin libc6-dev wget cmake gcc gfortran \
&& apt-get clean