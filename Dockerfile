ARG GCLOUD_SDK_VERSION=261.0.0-alpine

FROM google/cloud-sdk:$GCLOUD_SDK_VERSION

RUN apk add --update --no-cache openjdk8-jre &&\
	gcloud components install cloud-firestore-emulator beta --quiet

VOLUME /opt/data

EXPOSE 8081

RUN addgroup -g 2002 codechaitu && adduser -D -G codechaitu -u 1001 chaitu
USER 1001

ENTRYPOINT ["gcloud", "beta", "emulators", "firestore", "start", "--host-port=0.0.0.0:8081"]
