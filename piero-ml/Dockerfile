FROM python:2.7

ENV ANDROGUARD_DIR=/opt/androguard

RUN dpkg --add-architecture i386 && \
    apt-get update && apt-get install -f -y \
    build-essential python-dev libxml2-dev libxslt1-dev \
    git curl wget unzip tar \
    default-jre default-jdk \
    python-mysqldb libtiff5-dev libjpeg62-turbo-dev zlib1g-dev \
    libfreetype6-dev liblcms2-dev libwebp-dev tcl8.5-dev tk8.5-dev python-tk \
    python-openssl python-setuptools libatlas-dev libatlas3gf-base python-numpy python-scipy python-sklearn


RUN pip install --no-cache-dir \
    ipython \
    pycrypto \
    pyOpenSSL \
    pyyaml \
    pytest \
    numpy \
    scipy \
    scikit-learn \
    matplotlib \
    progressbar \
    networkx
	
RUN wget https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool -O /usr/local/bin/apktool && \
    wget https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.0.0.jar -O /usr/local/bin/apktool.jar && \
    chmod +x /usr/local/bin/apktool


# Test if the modules are installed correctly
#    Check apktool
RUN apktool --version

#    Check python modules
ADD test_modules.py /opt/
RUN python /opt/test_modules.py
