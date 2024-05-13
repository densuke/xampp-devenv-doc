FROM alpine
ARG USER_NAME=worker
ARG USER_UID=1000
ARG USER_GID=1000
RUN apk add --no-cache python3 py3-pip
RUN apk add --no-cache nodejs npm
RUN apk add --no-cache git unzip sudo make; \
    echo "${USER_NAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN addgroup -g ${USER_GID} ${USER_NAME}; \
    adduser -D -u ${USER_UID} -G ${USER_NAME} ${USER_NAME}
USER ${USER_NAME}
WORKDIR /home/${USER_NAME}
ENV PATH="/home/${USER_NAME}/.local/bin:/home/${USER_NAME}/node_modules/.bin:${PATH}"
RUN pip install --user pipenv --break-system-packages
