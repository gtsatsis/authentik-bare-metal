tee /etc/systemd/system/authentik-server.service > /dev/null << EOF
[Unit]
Description = Authentik Server (web/api/sso)

[Service]
ExecStart=/bin/bash -c 'source /opt/authentik/src/.venv/bin/activate && python -m lifecycle.migrate && /opt/authentik/src/authentik-server'
WorkingDirectory=/opt/authentik/src

User=authentik
Group=authentik

Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

tee /etc/systemd/system/authentik-worker.service > /dev/null << EOF
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