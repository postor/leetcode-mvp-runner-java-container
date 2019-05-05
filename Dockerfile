FROM maven:3-jdk-8-alpine

ADD . /app

WORKDIR /app

RUN chmod +x test.sh \\
  && mvn dependency:go-offline \\
  && mvn install package dependency:copy-dependencies --legacy-local-repository

CMD ./test.sh