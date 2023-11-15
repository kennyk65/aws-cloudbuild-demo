# You can build this with "docker image build -t demo ."
# The Docker image we are building will be based on Java 17:
FROM eclipse-temurin:17.0.5_8-jre-alpine

# Make a new directory and use it as work directory:
WORKDIR /opt/app

# Adding the file we just created in the build process as 'app.war'
COPY /target/cloud-build-demo-17.jar app.jar

EXPOSE 80

# Do not run as root.  Instead create a group and user.
# Change the ownership of WORKDIR so javauser can run from here
RUN addgroup --system javauser \
&& adduser -S -s /usr/sbin/nologin -G javauser javauser \
&& chown -R javauser:javauser .

# Change user to non-root and run:
USER javauser
ENTRYPOINT ["java", "-jar", "app.jar"]
# You can run with a command like "docker container run -d -p 8080:80 demo", using whatever port you want other than 8080.
