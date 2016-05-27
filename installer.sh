#!/bin/bash

set -eu

password_file="/var/lib/oasrundeck/default_user_password"

mkdir -p "$(dirname "$password_file")"
touch "$password_file"
chmod 600 "$password_file"
echo thisisaverylongpassword > "$password_file"

[ -e /etc/yum.repos.d/rundeck.repo ]||sudo rpm -Uhv http://repo.rundeck.org/latest.rpm

sudo yum --nogpgcheck install -y /tmp/packages/*.rpm

