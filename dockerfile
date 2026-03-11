FROM node:24-alpine
ARG N8N_RELEASE_TYPE=stable
ENV N8N_RELEASE_TYPE=${N8N_RELEASE_TYPE}

RUN apk index
RUN apk add python3 py3-pip ffmpeg
RUN python3 -m pip install -U "yt-dlp[default]" --break-system-packages
RUN npm install n8n -g
USER node 
ENTRYPOINT ["n8n"]
