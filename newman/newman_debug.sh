#!/bin/bash
docker run -it -v /opt/newman-src:/etc/newman --name davidtest --entrypoint /bin/bash --rm postman_checks:v0.2
