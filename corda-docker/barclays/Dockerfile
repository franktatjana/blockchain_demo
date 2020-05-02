FROM openjdk:8-jdk-alpine

ENTRYPOINT ["java","-jar","/opt/corda/nodes/barclays/corda.jar", \
"-javaagent:./opt/corda/nodes/barclays/elastic-apm-agent-1.14.0.jar", \
"-Delastic.apm.server_urls=https://30a8d416c951436abcf6c79becb3b1a4.m.europe-west3.gcp.cloud.es.io:443", \
"-Delastic.apm.secret_token=sT85k5KUJV0eVOHxiZ", \
"-D.elastic.apm.stack_trace_limit=-1", \
"-Delastic.apm.verify_server_cert=false", \
"-Delastic.apm.service_name=corda-node-barclays", \
"-javaagent:./jolokia-jvm-1.6.2-agent.jar=port=7777,host=34.91.190.250", \
"--logging-level=TRACE"]