FROM maven:3-jdk-8-alpine

ADD . /app

WORKDIR /app

RUN chmod +x test.sh \\
&& mvn package \\
&& mvn dependency:copy-dependencies \\
&& mvn dependency:go-offline

CMD ./test.sh