#!/bin/sh

# If variable not present use default values
: ${BLOCKCHAIN_CLUSTER_UUID:='BlockchainDemo:ZXVyb3BlLXdlc3QzLmdjcC5jbG91ZC5lcy5pbyQ4ZDVhMWY0ODc2MmI0OWNmYjZjODE4MzA3Y2I4NDAwOCQwZDM1MDcwMGY0YjM0YTY5ODhlNzRhMGQwN2QwYWM3Ng=='}
: ${BLOCKCHAIN_CLUSTER_AUTH:='elastic:k8e1ObDYlCdreJj2YH29O9gM'}
: ${ELASTIC_VERSION:='7.6.1'}

export BLOCKCHAIN_CLUSTER_UUID BLOCKCHAIN_CLUSTER_AUTH ELASTIC_VERSION

docker run \
docker.elastic.co/beats/auditbeat:${ELASTIC_VERSION}\
setup  -E cloud.id=${BLOCKCHAIN_CLUSTER_UUID} -E cloud.auth=elastic:${BLOCKCHAIN_CLUSTER_AUTH}


docker run \
docker.elastic.co/beats/heartbeat:${ELASTIC_VERSION}\
setup  -E cloud.id=${BLOCKCHAIN_CLUSTER_UUID} -E cloud.auth=elastic:${BLOCKCHAIN_CLUSTER_AUTH}

docker run \
docker.elastic.co/beats/filebeat:${ELASTIC_VERSION}\
setup  -E cloud.id=${BLOCKCHAIN_CLUSTER_UUID} -E cloud.auth=elastic:${BLOCKCHAIN_CLUSTER_AUTH}

docker run \
docker.elastic.co/beats/metricbeat:${ELASTIC_VERSION}\
setup  -E cloud.id=${BLOCKCHAIN_CLUSTER_UUID} -E cloud.auth=elastic:${BLOCKCHAIN_CLUSTER_AUTH}

docker run \
docker.elastic.co/beats/packetbeat:${ELASTIC_VERSION}\
setup  -E cloud.id=${BLOCKCHAIN_CLUSTER_UUID} -E cloud.auth=elastic:${BLOCKCHAIN_CLUSTER_AUTH}