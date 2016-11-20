FROM java:openjdk-7-jre

ENV MC_VERSION=1.8.9

RUN wget https://s3.amazonaws.com/Minecraft.Download/versions/$MC_VERSION/minecraft_server.$MC_VERSION.jar

# RUN useradd -M -s /bin/false --uid 1000 minecraft \
#   && mkdir /data \
#   && chown minecraft:minecraft /data

WORKDIR /data
VOLUME /data

ENV JAVA_OPTS="-XX:MaxPermSize=100M -Xmx850M -Xms850M"
ENV EULA=false

ADD start.sh /start.sh
# RUN chown minecraft:minecraft /start.sh
# RUN chmod +x /start.sh

USER 1000

CMD ["/start.sh"]
