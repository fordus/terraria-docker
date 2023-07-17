FROM alpine:3.11.6 AS base

ENV TSHOCKURL="https://github.com/Pryaxis/TShock/releases/download/v5.2.0/TShock-5.2-for-Terraria-1.4.4.9-linux-x64-Release.zip"

RUN wget $TSHOCKURL -O /tshock.zip && \
    mkdir /tshock && \
    unzip /tshock.zip -d /tshock && \
    rm /tshock.zip

RUN tar -xf /tshock/TShock-Beta-linux-x64-Release.tar -C /tshock && \
    rm /tshock/TShock-Beta-linux-x64-Release.tar

FROM ubuntu:20.04

RUN apt-get update -y && \
    apt-get install apt-transport-https wget -y && \
    wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    rm packages-microsoft-prod.deb && \
    apt-get update -y && \
    apt install dotnet-sdk-6.0 -y

COPY --from=base /tshock/ /tshock/
 
RUN echo "/tshock/TShock.Server -configpath /data -worldselectpath /data/worlds -logpath /data/logs $@" >> /tshock/start.sh && \
    chmod +x /tshock/start.sh

VOLUME ["/data"]
EXPOSE 7777
WORKDIR /tshock
ENTRYPOINT ["/bin/bash", "/tshock/start.sh"]

# docker build -t terraria-docker:latest .

# docker run -it -p 7777:7777 -v /home/$USER/terraria:/data --name terraria-docker terraria-docker:latest