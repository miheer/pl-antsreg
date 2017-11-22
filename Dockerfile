FROM centos
MAINTAINER fnndsc "dev@babymri.org"

RUN yum install -y cmake git gcc gcc-c++ make zlib-devel  \
 && export PATH=($PATH):/root/bin/ants/bin                \
 && export ANTSPATH=/root/bin/ants/bin                    \
 && mkdir ~/code                                          \
 && cd ~/code                                             \
 && git clone https://github.com/stnava/ANTs.git          \
 && cd                                                    \
 && mkdir bin                                             \
 && cd bin                                                \
 && mkdir ants                                            \
 && cd ants                                               \
 && cmake ~/code/ANTs                                     \
 && make                                                  \
 && cp ~/code/ANTs/Scripts/* ~/root/bin/ants/bin          \

CMD ["/init"]
