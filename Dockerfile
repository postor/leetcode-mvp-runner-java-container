FROM maven:3-jdk-8-alpine

WORKDIR /app

COPY . .

RUN mvn dependency:go-offline

RUN mvn package --legacy-local-repository

RUN mvn dependency:copy-dependencies --legacy-local-repository

RUN chmod +x test.sh && rm target -rf

CMD ./test.sh
