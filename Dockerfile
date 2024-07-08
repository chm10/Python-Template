FROM python:3.11

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1
ENV PIP_NO_CACHE_DIR=off
ENV PIP_DISABLE_PIP_VERSION_CHECK=on
ENV PIP_DEFAULT_TIMEOUT=100

ENV TERM=xterm-256color
ENV TZ=Brazil/East
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update && apt-get install -y \
    build-essential \
    vim \
    unzip \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/local/share/jupyter/lab 
COPY ./jupyter/overrides.json /usr/local/share/jupyter/lab/settings/overrides.json

RUN adduser --disabled-password --gecos '' user && \
    #adduser user sudo && \
    chmod -R 777 /home/user &&\
    chown -R user:1000 /usr/local/bin &&\ 
    chown -R user:1000 /usr/local/lib &&\
    chown -R user:1000 /usr/local/etc &&\
    chown -R user:1000 /usr/local/include &&\
    chown -R user:1000 /usr/local/share 

RUN cp --backup=t /etc/skel/.bashrc ~user/.bashrc &&\
    cp --backup=t /etc/skel/.profile ~user/.profile &&\
    cp --backup=t /etc/skel/.bash_logout ~user/.bash_logout

#RUN mkdir -p /home/user/.local/bin &&\
#    chown -R user:1000 /home/user/.local

USER user

WORKDIR /home/user/app

RUN pip3 install --no-cache-dir --upgrade pip

COPY requirements.txt /home/user/app/requirements.txt

RUN pip3 install --no-cache-dir -r requirements.txt

COPY ./jupyter/jupyterlab.sh /home/user/jupyterlab.sh

CMD ["/bin/bash"]