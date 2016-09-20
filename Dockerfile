FROM python:2.7

RUN apt-get update && apt-get install -y \
    build-essential python-dev libxml2-dev libxslt1-dev \
    git curl wget \
    default-jre default-jdk \
    python-mysqldb libtiff5-dev libjpeg8-dev zlib1g-dev \
    libfreetype6-dev liblcms2-dev libwebp-dev tcl8.5-dev tk8.5-dev python-tk \
    python-setuptools libatlas-dev libatlas3gf-base python-numpy python-scipy python-sklearn \


RUN pip --no-cache-dir \
    boto \
    ipython \
    raven \
    requests \
    web.py \
    Pillow \
    pycrypto \
    pyyaml \
    pytest \
    progressbar \
    netwrokx
