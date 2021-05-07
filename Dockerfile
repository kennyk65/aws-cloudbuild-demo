# You can build this with "docker image build -t demo ."
# The Docker image we are building will be based on Java 8:
FROM openjdk:11

# Optional, in case anything uses local disk.  Will be in var/lib/docker
VOLUME /tmp

# Adding the file we just created in the build process as 'app.jar'
COPY ./target/cloud-build-demo-1.jar app.jar

# Optional, adds a last modified time to each file.  Not needed here.
RUN bash -c 'touch /app.jar'

EXPOSE 80

# Equivalent of running "java -jar /app.jar".
ENTRYPOINT ["java","-jar","/app.jar"]

# You can run with a command like "docker container run -d -p 8080:80 demo", using whatever port you want other than 8080.
