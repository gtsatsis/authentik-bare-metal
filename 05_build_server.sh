cd /opt/authentik/src
# config search path patch -- /etc/authentik/config.yml is excluded from the search path by default in the Go code
sed -i "s/c.Setup(\".\/authentik\/lib\/default.yml\", \".\/local.env.yml\")/c.Setup(\"\/etc\/authentik\/config.yml\", \".\/authentik\/lib\/default.yml\", \".\/local.env.yml\")/" /opt/authentik/src/internal/config/config.go
/usr/local/go/bin/go build -o /opt/authentik/src/authentik-server  ./cmd/server/