mkdir -p /etc/authentik
mkdir -p /opt/authentik/certs
mkdir -p /opt/authentik/blueprints

cp /opt/authentik/src/authentik/lib/default.yml /etc/authentik/config.yml
cp -r /opt/authentik/src/blueprints /opt/authentik/blueprints

yq -i ".secret_key = \"$(openssl rand -hex 32)\"" /etc/authentik/config.yml

yq -i ".error_reporting.enabled = false" /etc/authentik/config.yml
yq -i ".disable_update_check = true" /etc/authentik/config.yml
yq -i ".disable_startup_analytics = true" /etc/authentik/config.yml
yq -i ".avatars = \"none\"" /etc/authentik/config.yml

yq -i ".cert_discovery_dir = \"/opt/authentik/certs\"" /etc/authentik/config.yml
yq -i ".blueprints_dir = \"/opt/authentik/blueprints\"" /etc/authentik/config.yml
yq -i ".geoip = \"/opt/authentik/GeoLite2-City.mmdb\""  /etc/authentik/config.yml