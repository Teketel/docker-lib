FROM python:2.7

RUN dpkg --add-architecture i386 && \
    apt-get update && apt-get install -f -y \
    build-essential python-dev libxml2-dev libxslt1-dev \
    git curl wget unzip tar \
    zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev tcl8.5-dev tk8.5-dev python-tk \
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
    networkx \
    jupyter

# Test if the modules are installed correctly
#    Check python modules
ADD test_modules.py /opt/
RUN python /opt/test_modules.py
