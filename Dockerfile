FROM ubuntu:22.04

WORKDIR /app/

COPY requirement.txt /app/

CMD [ "/bin/bash" ]

RUN apt-get update && \
    apt-get -y install software-properties-common curl xvfb tzdata

ENV TZ="Asia/Jakarta"

RUN apt-get -y install python3.11 python3.11-distutils && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3.11 get-pip.py && \
    rm get-pip.py

RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
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

RUN apt-get -y autoclean && \
    apt-get -y autoremove