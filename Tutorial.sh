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

# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"

# Download and install Node.js:
nvm install 25

#Gunakan Bash Ku Lalu Install Panel nya
bash <(curl -s https://raw.githubusercontent.com/azizcool1998/AzizTech/main/aziztech.sh)

pilih nomor 5
masukkan link panel nya

buka bash itu lagi, pilih nomor 6 untuk install wings
masukkan link panel dan link node nya

Lanjut Create Node nya dgn Buka Bash itu Lagi, Pilih Nomor 4
Masukkan Link Node nya Aja

Lanjut Buka Panel nya, Login Akun dgn Username admin dan Password nya admin
buka Admin Control Panel, Buka Tab Node, Buka Node nya, Buka Tab Configuration, Pencet Generate Token, Salin Mulai dari "cd ... Sampai Akhir Ujung Kanan nya"

Kembali Ke Terminal, Buka Bash Ku Lagi, Pilih Nomor 3
Paste Token Config Node nya

Kembali Ke Panel Bagian Node, Pencet Tab Allocation
Masukkan IP nya Pakai "0.0.0.0" Aja
Masukkan Nama Allocation nya
Masukkan Port nya "1950-2021" Aja
Lalu di Lanjutkan

#Egg Bot WA
Masuk Ke Tab Nest di Admin Control Panel
Pencet Create Nest
Masukkan Nama Nest dan Deskripsi nya
Kembali Ke Nest Lalu Import Egg

#Opsional Tema
