#!/bin/bash

docker run \
docker.elastic.co/beats/auditbeat:${ELASTIC_VERSION}\
setup  -E cloud.id=${BLOCKCHAIN_CLUSTER_UUID} -E cloud.auth=elastic:${BLOCKCHAIN_CLUSTER_PASS}


docker run \
docker.elastic.co/beats/heartbeat:${ELASTIC_VERSION}\
setup  -E cloud.id=${BLOCKCHAIN_CLUSTER_UUID} -E cloud.auth=elastic:${BLOCKCHAIN_CLUSTER_PASS}

docker run \
docker.elastic.co/beats/filebeat:${ELASTIC_VERSION}\
setup  -E cloud.id=${BLOCKCHAIN_CLUSTER_UUID} -E cloud.auth=elastic:${BLOCKCHAIN_CLUSTER_PASS}

docker run \
docker.elastic.co/beats/metricbeat:${ELASTIC_VERSION}\
setup  -E cloud.id=${BLOCKCHAIN_CLUSTER_UUID} -E cloud.auth=elastic:${BLOCKCHAIN_CLUSTER_PASS}

docker run \
docker.elastic.co/beats/packetbeat:${ELASTIC_VERSION}\
setup  -E cloud.id=${BLOCKCHAIN_CLUSTER_UUID} -E cloud.auth=elastic:${BLOCKCHAIN_CLUSTER_PASS}