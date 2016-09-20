FROM python:2.7

ENV ANDROGUARD_DIR=~/androguard

RUN apt-get update && apt-get install -y \
    build-essential python-dev libxml2-dev libxslt1-dev \
    git curl wget \
    default-jre default-jdk \
    python-mysqldb libtiff5-dev libjpeg62-turbo-dev zlib1g-dev \
    libfreetype6-dev liblcms2-dev libwebp-dev tcl8.5-dev tk8.5-dev python-tk \
    python-setuptools libatlas-dev libatlas3gf-base python-numpy python-scipy python-sklearn \
    libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1 lib32bz2-1.0


RUN pip install --no-cache-dir \
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
    networkx \
    protobuf \
    python-hashes

RUN git clone https://github.com/androguard/androguard.git ${ANDROGUARD_DIR} && \
	cd ${ANDROGUARD_DIR} && \
	git checkout f9b2f8121e11098c59d720687377f87d96766111 && \
	cd -

RUN wget http://chilkatdownload.com/9.5.0.59/chilkat-9.5.0-python-2.7-x64.zip && \
	unzip chilkat-9.5.0-python-2.7-x64.zip && \
	cd chilkat-9.5.0-python-2.7-x64 && \
	python setup.py install && \
	cd ..
