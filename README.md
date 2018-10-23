# Python ecCodes 

Docker image for executing code for projects that rely on python-eccodes

Includes cython and numpy

## Usage
docker run -it --rm sdhawan/python-eccodes python --version

## Mount a volume
docker run -it --rm -v /home/project/grib:/srv sdhawan/docker-python-eccodes python /srv/grib.py
