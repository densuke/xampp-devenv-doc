FROM ghcr.io/astral-sh/uv:python3.13-alpine AS uv
FROM ubuntu:24.04
ARG USER_NAME=worker
ARG USER_UID=1000
ARG USER_GID=1000
ENV TZ=Asia/Tokyo
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        python3 python3-pip nodejs npm git unzip sudo make gh tzdata locales && \
    rm -rf /var/lib/apt/lists/* && \
    echo "${USER_NAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    locale-gen ja_JP.UTF-8 && \
    ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apt-get clean; rm -rf /var/lib/apt/lists/*
ENV LANG=ja_JP.UTF-8
ENV LC_ALL=ja_JP.UTF-8
RUN userdel -r ubuntu && \
    groupadd -g ${USER_GID} ${USER_NAME} && \
    useradd -m -u ${USER_UID} -g ${USER_GID} ${USER_NAME}
COPY --from=uv /usr/local/bin/uv /usr/local/bin/uvx /usr/local/bin/
USER ${USER_NAME}
WORKDIR /home/${USER_NAME}
ENV PATH="/home/${USER_NAME}/.local/bin:/home/${USER_NAME}/node_modules/.bin:${PATH}"
# RUN pip install --user uv
