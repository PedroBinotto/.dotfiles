#!/bin/bash

OVERRIDE_DIR="/etc/systemd/system/anacron.service.d"
OVERRIDE_FILE="$OVERRIDE_DIR/override.conf"

sudo mkdir -p "$OVERRIDE_DIR"
cat <<'EOF' | sudo tee "$OVERRIDE_FILE" > /dev/null
[Unit]
ConditionACPower=
EOF
sudo systemctl daemon-reexec

cd ~
