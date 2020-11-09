#!/bin/bash

export JOB_NAME='rb88_transaction_shslrbp4.funpo.com_1.0.0'
export collection_name='rb88_transaction_shslrbp4.funpo.com_1.0.0_c.json'
export env_name='rb88_transaction_shslrbp4.funpo.com_1.0.0_env.json'
export report_name='rb88_transaction_shslrbp4.funpo.com_1.0.0'
export iterations_num='2'
export html_type='full' # original , aggregated , full

docker run -v /opt/newman-src:/etc/newman --network docker-compose-influxdb-grafana_monitor \
--name "${JOB_NAME}" --rm postman_checks:v0.3 \
run "/etc/newman/${collection_name}" -e "/etc/newman/environments/${env_name}" \
-r influxdb \
--reporter-influxdb-server influxdb --reporter-influxdb-port 8086 \
--reporter-influxdb-name newman_reports \
--reporter-influxdb-measurement "${JOB_NAME}" \
--reporter-influxdb-username devops \
--reporter-influxdb-password devops \
--reporter-influxdb-mode http \
--delay-request 500 --timeout 900000 --timeout-request 5000 --timeout-script 5000 \
--reporter-cli-no-failures --reporter-cli-no-assertions --reporter-cli-no-console \
--disable-unicode --color off --suppress-exit-code 1

exit

npm install -g newman-reporter-influxdb
newman run <collection-url> -r influxdb \
  --reporter-influxdb-server <server-ip> \
  --reporter-influxdb-port <server-port> \
  --reporter-influxdb-name <database-name> \
  --reporter-influxdb-measurement <measurement-name>

# --- END --- #
