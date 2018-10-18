FROM continuumio/miniconda:4.5.11

RUN pip install cython
RUN conda update conda
RUN conda install -y -c conda-forge python-eccodes