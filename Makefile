build-and-deploy: build deploy

build:
	./mvnw clean package -Dpackaging=docker-native -Dmicronaut.runtime=lambda -Pgraalvm

deploy:
	./deploy.sh
