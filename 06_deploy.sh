exit # leave su - authentik

cat << EOF > /etc/systemd/system/authentik-server.service
[Unit]
Description = Authentik Server (web/api/sso)

[Service]
ExecStart=/bin/sh -c 'source /opt/authentik/src/.venv/bin/activate && python -m lifecycle.migrate && /opt/authentik/src/authentik-server'
WorkingDirectory=/opt/authentik/src

User=authentik
Group=authentik

Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

cat << EOF > /etc/systemd/system/authentik-worker.service
[Unit]
Description = Authentik Worker (background tasks)

[Service]
ExecStart=/bin/bash -c 'source /opt/authentik/src/.venv/bin/activate && celery -A authentik.root.celery worker -Ofair --max-tasks-per-child=1 --autoscale 3,1 -E -B -s /tmp/celerybeat-schedule -Q authentik,authentik_scheduled,authentik_events'
WorkingDirectory=/opt/authentik/src

User=authentik
Group=authentik

Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF