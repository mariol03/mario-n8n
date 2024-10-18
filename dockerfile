FROM docker.n8n.io/n8nio/n8n

USER root
RUN apk index
RUN apk add python3 yt-dlp
USER node
