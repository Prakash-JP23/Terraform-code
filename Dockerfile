FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y vim nginx docker.io && \
    apt-get clean

RUN mkdir /jp
WORKDIR /jp

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
