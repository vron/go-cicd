FROM circleci/golang:1.10-stretch-node-browsers

RUN sudo apt-get update && \
    sudo apt-get install -y default-jre && \
    wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-211.0.0-linux-x86_64.tar.gz && \
    tar -xzf google-cloud-sdk-211.0.0-linux-x86_64.tar.gz && \
    ./google-cloud-sdk/install.sh -q && \
    ./google-cloud-sdk/bin/gcloud components install -q cloud-datastore-emulator && \
    ./google-cloud-sdk/bin/gcloud components install -q beta && \
    ./google-cloud-sdk/bin/gcloud config set project test

ADD run.sh run.sh

LABEL com.circleci.preserve-entrypoint=true

ENTRYPOINT ./run.sh