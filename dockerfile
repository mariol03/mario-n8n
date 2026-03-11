FROM node:24-alpine

RUN apk index
RUN apk add python3 py3-pip ffmpeg
RUN python3 -m pip install -U "yt-dlp[default]" --break-system-packages
RUN npm install n8n -g
USER node 
ENTRYPOINT ["n8n"]
