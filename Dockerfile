FROM python:3.12-slim-bookworm

COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1
ENV UV_SYSTEM_PYTHON=1
ENV TERM=xterm-256color
ENV TZ=Brazil/East

# Use pipefail to make sure errors in pipelines are caught
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    vim \
    unzip \
    git \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN adduser --disabled-password --gecos '' user && \
    mkdir /home/user/.config && \
    chown user:user /home/user/.config && \
    mkdir -p /usr/local/share/jupyter/lab &&\
    chown -R user:user /usr/local/share/jupyter/lab 
    
RUN cp --backup=t /etc/skel/.bashrc ~user/.bashrc &&\
    cp --backup=t /etc/skel/.profile ~user/.profile &&\
    cp --backup=t /etc/skel/.bash_logout ~user/.bash_logout

COPY --chown=user:user ./jupyter/overrides.json /usr/local/share/jupyter/lab/settings/overrides.json

RUN chown -R user:user /usr/local/bin && \
    chown -R user:user /usr/local/lib && \
    chown -R user:user /usr/local/etc && \
    chown -R user:user /usr/local/include && \
    chown -R user:user /usr/local/share

USER user

WORKDIR /home/user

COPY --chown=user:user requirements.txt /home/user/requirements.txt
RUN uv pip install -r requirements.txt

COPY --chown=user:user ./jupyter/jupyterlab.sh /home/user/jupyterlab.sh

RUN chmod +x /home/user/jupyterlab.sh

CMD ["/bin/bash","/home/user/jupyterlab.sh"]
