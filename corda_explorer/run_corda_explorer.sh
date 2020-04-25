#!/bin/sh
cd Desktop/corda_client/
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_211.jdk/Contents/Home
java -javaagent:./elastic-apm-agent-1.13.0.jar -Delastic.apm.server_urls=https://30a8d416c951436abcf6c79becb3b1a4.apm.europe-west3.gcp.cloud.es.io -Delastic.apm.secret_token=bufd0oeJWEBDoTN7EO -Delastic.apm.service_name=corda-client-monolith -jar corda-tools-explorer-4.1.jar