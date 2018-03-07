ARG TAG

FROM justadudewhohacks/opencv:${TAG}

RUN apt-get update && \
apt-get install -y build-essential git curl && \
curl -sL https://deb.nodesource.com/setup_6.x | bash && \
apt-get install -y nodejs python && \
rm -rf /var/lib/apt/lists/* && \
apt-get purge -y curl && \
apt-get autoremove -y --purge
