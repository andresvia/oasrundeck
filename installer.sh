#!/bin/bash

set -eu

[ -e /etc/yum.repos.d/rundeck.repo ]||sudo rpm -Uhv http://repo.rundeck.org/latest.rpm

sudo yum --nogpgcheck install -y /tmp/packages/*.rpm

