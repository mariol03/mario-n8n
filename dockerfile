FROM docker.n8n.io/n8nio/n8n

USER root
RUN apk index
RUN apk add python3 py3-pip ffmpeg
RUN python3 -m pip install -U "yt-dlp[default]" --break-system-packages
USER node
