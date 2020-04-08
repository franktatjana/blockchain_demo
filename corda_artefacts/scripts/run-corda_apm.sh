#!/bin/sh
sudo wget https://repo1.maven.org/maven2/co/elastic/apm/elastic-apm-agent/1.15.0/elastic-apm-agent-1.15.0.jar

# If variable not present use default values
: ${JAVA_OPTIONS:=-Xmx512m}
: ${APM_SERVER_URL:=-'https://30a8d416c951436abcf6c79becb3b1a4.apm.europe-west3.gcp.cloud.es.io'}
: ${APM_SECRET_TOKEN:='bufd0oeJWEBDoTN7EO'}

export CORDA_HOME JAVA_OPTIONS

java $JAVA_OPTIONS -javaagent:./elastic-apm-agent-1.15.0.jar \
-Delastic.apm.server_urls=${APM_SERVER_URL} \
-Delastic.apm.secret_token=${APM_SECRET_TOKEN}  \
-Delastic.apm.service_name=corda-node-monolith \
-Delastic.apm.enable_log_correlation=true \
corda.jar