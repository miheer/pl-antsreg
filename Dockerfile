# Docker file for the antsreg plugin app

FROM fnndsc/centos-python3:latest
MAINTAINER fnndsc "dev@babymri.org"

ENV APPROOT="/usr/src/antsreg"  VERSION="0.1"
COPY ["antsreg", "${APPROOT}"]
COPY ["requirements.txt", "${APPROOT}"]

WORKDIR $APPROOT

##################  ANTS INSTALLATION ##################
RUN yum install -y cmake && \
    yum install -y make && \
    yum install -y git && \
    cd $HOME && \
    git clone https://github.com/ANTsX/ANTs.git && \
    cd ANTs && \
    git checkout tags/v2.2.0 && \
    mkdir bin && \
    cd bin && \
    mkdir ants && \
    cd ants && \
    echo "Starting ccmake" && \
    ls -la && \
    export TERM=xterm && \
    cmake $HOME/ANTs && \
    echo "end ccmake" && \
    make -j 10 && \
    cp -r ~/ANTs/Scripts/. ~/ANTs/bin/ants/bin
    

ENV ANTSPATH=${HOME}/ANTs/bin/ants/bin/ 

ENV PATH=${ANTSPATH}:$PATH
#######################################################

RUN pip install -r requirements.txt

CMD ["antsreg.py", "--json"]

