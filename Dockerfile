FROM maven:3-jdk-8-alpine

ADD . /app

WORKDIR /app

RUN chmod +x test.sh \\
&& mvn dependency:go-offline \\
&& mvn dependency:copy-dependencies \\
&& mvn package

CMD ./test.sh