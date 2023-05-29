#!/bin/bash

mkdir -p /var/lock/subsys/e-SUS-AB-PostgreSQL
service e-SUS-AB-PostgreSQL start
ENTRYPOINT ["java", "-jar", "eSUS-AB-PEC-5.1.17-Linux64.jar", "-console"]

#tail -f /opt/e-SUS/jboss-as-7.2.0.Final/standalone/log/boot.log
