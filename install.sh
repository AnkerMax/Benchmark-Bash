#!/bin/bash
set -e  # Skript stoppt bei Fehler

git clone https://github.com/phoronix-test-suite/phoronix-test-suite.git
cd phoronix-test-suite

sudo apt-get update
sudo apt-get install -y php-cli php-xml

sudo bash install-sh

printf "y\nn\ny\nn\ny\ny\ny\n" | sudo phoronix-test-suite batch-setup
sudo phoronix-test-suite install coremark cachebench compress-7zip scimark2 openssl byte npb fftw
sudo phoronix-test-suite batch-benchmark coremark cachebench compress-7zip scimark2 openssl byte npb fftw
