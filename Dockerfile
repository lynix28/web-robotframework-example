FROM ubuntu:20.04

WORKDIR /app/

COPY requirement.txt /app/

CMD [ "/bin/bash" ]

RUN apt-get update && \
    apt-get -y install software-properties-common curl xvfb && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get -y install python3.8 python3-pip

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get update && \
    apt-get install nodejs

RUN pip install -r requirement.txt

RUN npm install -g playwright

ENV NODE_PATH=/usr/lib/node_modules

RUN cd /usr/lib/node_modules && \
    npx playwright install-deps

RUN cd /app/ && \
    rfbrowser init

RUN mkdir /app/reports/

ENV PATH=/app:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin