FROM python:2.7

ENV ANDROGUARD_DIR=~/androguard

RUN dpkg --add-architecture i386 && \
    apt-get update && apt-get install -y \
    build-essential python-dev libxml2-dev libxslt1-dev \
    git curl wget unzip tar \
    default-jre default-jdk \
    python-mysqldb libtiff5-dev libjpeg62-turbo-dev zlib1g-dev \
    libfreetype6-dev liblcms2-dev libwebp-dev tcl8.5-dev tk8.5-dev python-tk \
    python-setuptools libatlas-dev libatlas3gf-base python-numpy python-scipy python-sklearn


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

RUN wget http://chilkatdownload.com/9.5.0.59/chilkat-9.5.0-python-2.7-x86_64-linux.tar.gz && \
	tar -xf chilkat-9.5.0-python-2.7-x86_64-linux.tar.gz && \
	cd chilkat-9.5.0-python-2.7-x86_64-linux && \
	python installChilkat.py -g && \
	cd ..
	
# Setup android development environment
RUN dpkg --add-architecture i386 && \
    apt-get update && apt-get install -y \ 
    libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1 libbz2-1.0:i386
    
RUN wget http://dl.google.com/android/android-sdk_r24.3.3-linux.tgz && \
    tar -xzf android-sdk_r24.3.3-linux.tgz -C /opt/ && \
    /opt/android-sdk-linux/tools/android list sdk --all --extended && \
    echo 'y' | /opt/android-sdk-linux/tools/android update sdk --no-ui --all --filter platform-tools,build-tools-22.0.1,android-22 && \
    cp /opt/android-sdk-linux/build-tools/22.0.1/dx \
    /opt/android-sdk-linux/build-tools/22.0.1/aapt \
    /opt/android-sdk-linux/build-tools/22.0.1/lib/dx.jar \
    /opt/android-sdk-linux/platforms/android-22/android.jar /usr/local/bin

ENV ANDROID_HOME=/opt/android-sdk-linux

RUN wget https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool -O /usr/local/bin/apktool && \
    wget https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.0.0.jar -O /usr/local/bin/apktool.jar && \
    chmod +x /usr/local/bin/apktool

RUN git clone https://github.com/egirault/googleplay-api.git
