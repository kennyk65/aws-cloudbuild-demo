# You can build this with "docker image build -t config ."
# The Docker image we are building will be based on Java 8:
FROM java:8
MAINTAINER Ken Krueger

# Optional, in case anything uses local disk.  Will be in var/lib/docker
VOLUME /tmp

# Adding the file we just created in the build process as 'app.jar'
COPY ./target/common-config-server-1.jar app.jar

# Optional, adds a last modified time to each file.  Not needed here.
RUN bash -c 'touch /app.jar'

# Equivalent of running "java -jar /app.jar".
ENTRYPOINT ["java","-jar","/app.jar"]

# You can run with a command like "docker container run -d -p 8080:8080 config", using whatever port you want other than 8080.
