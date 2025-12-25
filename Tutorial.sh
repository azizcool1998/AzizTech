#Ketik ini di Awal
apt update -y && apt upgrade -y
#Pokoknya Oke Oke dan Enter Enter Aja Sampe Selesai

#Ketik ini
sudo apt install ubuntu-release-upgrader-core

sudo ufw allow 1022/tcp comment 'Open port ssh TCP/1022 as failsafe for upgrades'

sudo do-release-upgrade -p '24.04.3 LTS'

#Ikuti Step By Step nya yak
y
y
enter
y
y
enter
di Opsi "SSHD" pilih "keep the local version lalu" enter
y
y untuk Me-Reboot

#Selanjutnya Salin yg di bawah ini Dulu
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg

#Lalu Ketik ini
nano /etc/apt/sources.list.d/third-party.sources

"Geser Aja Ke Paling Bawah Lalu Paste yg "Signed by" nya tadi"
kemudian Pencet Ctrl+X
Pencet Huruf "Y" di Keyboard
Lalu Enter

#Ketik ini Lagi
apt update -y && apt upgrade -y

