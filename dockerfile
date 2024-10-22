FROM debian

# System installations
ARG DEBIAN_FRONTEND=none
RUN apt update; apt install -qq -y --no-install-recommends nodejs npm python3 python3-pip git ffmpeg 

# n8n installation
RUN npm install n8n -g

# yt-dlp installation
RUN pip3 install -U yt-dlp --break-system-packages

# OpenAI/Whisper installation
RUN pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu --break-system-packages
RUN pip3 install triton --break-system-packages
RUN pip3 install "git+https://github.com/openai/whisper.git" --break-system-packages
RUN python3 -c "import whisper; whisper.load_model('turbo')"

# startup
RUN groupadd node; useradd -g node node; mkdir /home/node; chown node:node /home/node; chmod 755 /home/node
WORKDIR /home/node
USER node
ENTRYPOINT [ "n8n" ]
