FROM python:3.12

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

RUN adduser --disabled-password --gecos '' user && \
    #adduser user sudo && \
    chmod -R 777 /home/user &&\
    chmod -R 777 /usr/local/bin &&\ 
    chmod -R 777 /usr/local/lib &&\
    chmod -R 777 /usr/local/etc &&\
    chmod -R 777 /usr/local/include &&\
    chmod -R 777 /usr/local/share 

RUN cp --backup=t /etc/skel/.bashrc ~user/.bashrc &&\
    cp --backup=t /etc/skel/.profile ~user/.profile &&\
    cp --backup=t /etc/skel/.bash_logout ~user/.bash_logout

RUN mkdir -p /home/user/.local/bin &&\
    chown -R user /home/user/.local

USER user

WORKDIR /home/user/app

RUN pip3 install --no-cache-dir --upgrade pip

COPY requirements.txt /home/user/app/requirements.txt

RUN pip3 install --no-cache-dir -r requirements.txt

COPY jupyterlab.sh /home/user/jupyterlab.sh

CMD ["/bin/bash"]