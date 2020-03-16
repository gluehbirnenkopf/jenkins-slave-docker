FROM alpine:3.9.2

# PATH to include gradle binaries
ENV PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/gradle/bin"

# Deployment Tools and helm install
RUN apk update && \
 apk add ca-certificates wget &&  \
 update-ca-certificates && \
 wget https://storage.googleapis.com/kubernetes-release/release/v1.6.4/bin/linux/amd64/kubectl -P /usr/local/bin && \
 chmod +x /usr/local/bin/kubectl && \
 apk add --no-cache openjdk8 && \
 apk add --no-cache bash && \
 apk add --no-cache curl && \
 apk add --no-cache git && \
 apk add --no-cache openssl && \
 apk add --no-cache tar && \
 wget https://kubernetes-helm.storage.googleapis.com/helm-v2.9.1-linux-amd64.tar.gz  && \
 tar xvfz helm-v2.9.1-linux-amd64.tar.gz && \
 mv linux-amd64/helm /usr/local/bin/helm && \
 rm -rf helm-v2.9.1-linux-amd64.tar.gz  linux-amd64

# Gradle 4.10.2 for CI executions, needs to be available in this folder
COPY gradle-4.10.2/ /opt/gradle
RUN mkdir -p /home/jenkins/.gradle/
