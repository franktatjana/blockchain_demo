#!/bin/sh

# If variable not present use default values
: ${CORDA_HOME:=/opt/corda}
: ${JAVA_OPTIONS:=-Xmx512m}

export CORDA_HOME JAVA_OPTIONS

cd ${CORDA_HOME} java $JAVA_OPTIONS -jar -javaagent:./elastic-apm-agent-1.13.0.jar \
-Delastic.apm.server_urls=https://30a8d416c951436abcf6c79becb3b1a4.apm.europe-west3.gcp.cloud.es.io \
-Delastic.apm.secret_token=bufd0oeJWEBDoTN7EO \
-Delastic.apm.service_name=corda-corda-webserver-monolith \ 
${CORDA_HOME}/corda-webserver.jar 2>&1 &
java $JAVA_OPTIONS -jar  -javaagent:./elastic-apm-agent-1.13.0.jar \
-Delastic.apm.server_urls=https://30a8d416c951436abcf6c79becb3b1a4.apm.europe-west3.gcp.cloud.es.io \
-Delastic.apm.secret_token=bufd0oeJWEBDoTN7EO \‚‚
-Delastic.apm.service_name=corda-node-monolith \
${CORDA_HOME}/corda.jar 2>&1c