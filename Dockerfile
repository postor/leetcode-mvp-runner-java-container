FROM maven:3-jdk-8-alpine

WORKDIR /app

COPY . .

RUN mvn dependency:go-offline \\
  && mvn install --legacy-local-repository \\
  && mvn package --legacy-local-repository \\
  && mvn dependency:copy-dependencies --legacy-local-repository

RUN chmod +x test.sh 

CMD ./test.sh