STARTING_DIR=$(pwd)

sudo apt update && sudo apt upgrade -yqq # Ensure up-to-date system
sudo apt install -yqq curl wget git build-essential libncursesw5-dev libssl-dev \
     libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev pkg-config libffi-dev zlib1g-dev libxmlsec1 libxmlsec1-dev libxmlsec1-openssl libmaxminddb0 # Install build dependencies

wget https://github.com/mikefarah/yq/releases/download/v4.30.8/yq_linux_amd64 -O /usr/bin/yq
chmod +x /usr/bin/yq

wget https://www.python.org/ftp/python/3.11.1/Python-3.11.1.tgz
tar xzf Python-3.11.1.tgz 
cd Python-3.11.1
./configure --enable-optimizations
sudo make altinstall # Install Python 3.11.1

cd $STARTING_DIR
rm -rf Python-3.11.1.tgz Python-3.11.1

# Install NodeJS 18
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install Go 1.19
wget https://golang.org/dl/go1.19.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.19.linux-amd64.tar.gz
rm -rf go1.19.linux-amd64.tar.gz
