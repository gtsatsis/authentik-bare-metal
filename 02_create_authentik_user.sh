useradd --create-home --home-dir /opt/authentik --user-group --system --shell /bin/bash authentik
chown -R authentik:authentik /opt/authentik

cd /opt/authentik

# Install pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3.11 get-pip.py
rm -rf get-pip.py

# Install virtualenv
python3.11 -m pip install virtualenv