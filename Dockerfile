FROM debian:12-slim
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y     icecast2 vlc && rm -rf /var/lib/apt/lists/*
COPY icecast.xml /etc/icecast2/icecast.xml
COPY start.sh /start.sh
# Normaliser les fins de ligne au cas où le repo ait des CRLF
RUN sed -i 's/$//' /start.sh && chmod +x /start.sh
EXPOSE 8000
# Utiliser bash pour éviter les soucis de shebang si CRLF
CMD ["bash", "/start.sh"]
