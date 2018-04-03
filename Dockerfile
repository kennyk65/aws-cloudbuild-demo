# You can build this with "docker image build -t spring-cloud-aws-environment-demo ."
# The Docker image we are building will be based on Java 8:
FROM java:8
MAINTAINER Ken Krueger

# Optional, in case anything uses local disk.  Will be in var/lib/docker
VOLUME /tmp

# Adding the file we just created in the build process as 'app.War'
COPY ./target/spring-cloud-aws-environment-demo-1.war app.war

# Optional, adds a last modified time to each file.  Not needed here.
RUN bash -c 'touch /app.war'

# Equivalent of running "java -jar /app.war".
ENTRYPOINT ["java","-jar","/app.war"]

# You can run with a command like "docker container run -d -p 8080:8080 spring-cloud-aws-environment-demo", using whatever port you want other than 8080.
