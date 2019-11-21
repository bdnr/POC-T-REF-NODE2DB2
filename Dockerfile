FROM centos:7

RUN yum install -y  epel-release
RUN yum install -y  nodejs npm python2 node-gyp gcc make unixODBC

RUN mkdir -p /app
WORKDIR /app
COPY . /app

RUN npm i  && ln -s /app/node_modules/ /node_modules

ENV PORT 80
EXPOSE 80

CMD ["node", "server.js"]
#CMD exec /bin/sh -c "trap : TERM INT; (while true; do sleep 1000; done) & wait"
 
