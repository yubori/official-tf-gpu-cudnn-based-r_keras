FROM tensorflow/tensorflow:latest-gpu-py3

RUN pip3 install --upgrade pip keras scikit-image sklearn
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 \
&& . /etc/lsb-release \
&& add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $DISTRIB_CODENAME-cran35/" \
&& apt-get update \
&& apt-get -y install r-base r-base-dev \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*
RUN echo "install.packages(c('RcppRoll', 'foreach' , 'bigmemory' , 'biganalytics' , 'keras', 'cluster'), clean=T)" | R --no-save 

#EXPOSE 80
#CMD ["nginx", "-g", "daemon off;"]
