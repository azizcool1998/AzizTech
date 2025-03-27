#!/bin/bash

# Color
BLUE='\033[0;34m'       
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

# Display welcome message
display_welcome() {
  echo -e ""
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                                                 [+]${NC}"
  echo -e "${BLUE}[+]        ${YELLOW}      AUTO INSTALLER THEMA    ${BLUE}           [+]${NC}"
  echo -e "${BLUE}[+]        ${YELLOW}          © AZIZTECH.        ${BLUE}            [+]${NC}"
  echo -e "${BLUE}[+]                                                 [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e ""
  echo -e "script ini di buat untuk mempermudah penginstalasian thema pterodactyl,"
  echo -e "Dilarang Keras Share Bebas."
  echo -e ""
  echo -e "𝗧𝗘𝗟𝗘𝗚𝗥𝗔𝗠 :"
  echo -e "@AzizKeyboardist98"
  echo -e "𝗖𝗥𝗘𝗗𝗜𝗧𝗦 :"
  echo -e "@AzizTech"
  sleep 4
  clear
}

#Update and install jq
install_jq() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]      ${YELLOW}         UPDATE & INSTALL JQ      ${BLUE}         [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sudo apt update && sudo apt install -y jq
  if [ $? -eq 0 ]; then
    echo -e "                                                       "
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
    echo -e "${GREEN}[+]              INSTALL JQ BERHASIL                [+]${NC}"
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
  else
    echo -e "                                                       "
    echo -e "${RED}[+] =============================================== [+]${NC}"
    echo -e "${RED}[+]              INSTALL JQ GAGAL                   [+]${NC}"
    echo -e "${RED}[+] =============================================== [+]${NC}"
    exit 1
  fi
  echo -e "                                                       "
  sleep 1
  clear
}
#Check user token
check_token() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]               ${YELLOW}    LICENSE CODE        ${BLUE}          [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  echo -e "${YELLOW}MASUKAN AKSES TOKEN :${NC}"
  read -r USER_TOKEN

  if [ "$USER_TOKEN" = "aziztech" ]; then
    echo -e "${GREEN}AKSES BERHASIL${NC}}"
  else
    echo -e "${RED}Token Salah! Beli Kode Token Di AzizTech${NC}"
    echo -e "${YELLOW}TELEGRAM : @AzizKeyboardist98${NC}"
    echo -e "${YELLOW}WHATSAPP : +6285194730989${NC}"
    echo -e "${YELLOW}HARGA TOKEN : 100K FREE UPDATE JIKA ADA TOKEN BARU${NC}"
    echo -e "${YELLOW}© AzizTech${NC}"
    exit 1
  fi
  clear
}

# Install theme
install_theme() {
  while true; do
    echo -e "                                                       "
    echo -e "${BLUE}[+] =============================================== [+]${NC}"
    echo -e "${BLUE}[+]        ${YELLOW}           SELECT THEME       ${BLUE}           [+]${NC}"
    echo -e "${BLUE}[+] =============================================== [+]${NC}"
    echo -e "                                                       "
    echo -e "PILIH THEME YANG INGIN DI INSTALL"
    echo "0. Fix Wajib di Jalankan Sebelum Install Tema!" 
    echo "1. stellar"
    echo "2. billing"
    echo "3. enigma"
    echo "4. NookTheme"
    echo "5. MinecraftIce"
    echo "6. MinecraftPurple"
    echo "x. kembali"
    echo -e "masukan pilihan (0/1/2/3/4/5/6/x) :"
    read -r SELECT_THEME
    case "$SELECT_THEME" in
      0)
        break
        ;;
      1)
        THEME_URL=$(echo -e "https://github.com/azizcool1998/AzizTech/raw/main/stellar.zip")
        break
        ;;
      2)
        THEME_URL=$(echo -e "https://github.com/azizcool1998/AzizTech/raw/main/billing.zip")
        break
        ;;
      3)
        THEME_URL=$(echo -e "https://github.com/azizcool1998/AzizTech/raw/main/enigma.zip")
        break
        ;; 
      4)
        THEME_URL=$(echo -e "https://github.com/azizcool1998/AzizTech/raw/main/Nook.zip")
        break
        ;; 
      5)
        THEME_URL=$(echo -e "https://github.com/azizcool1998/AzizTech/raw/main/Ice.zip")
        break
        ;; 
      6)
        THEME_URL=$(echo -e "https://github.com/azizcool1998/AzizTech/raw/main/Purple.zip")
        break
        ;; 
      x)
        return
        ;;
      *)
        echo -e "${RED}Pilihan tidak valid, silahkan coba lagi.${NC}"
        ;;
    esac
  done
  
if [ -e /root/pterodactyl ]; then
    sudo rm -rf /root/pterodactyl
  fi
  wget -q "$THEME_URL"
  sudo unzip -o "$(basename "$THEME_URL")"
  
if [ "$SELECT_THEME" -eq 1 ]; then
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]     ${YELLOW}             INSTALASI THEMA         ${BLUE}       [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                                   "
  sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
  cd
  curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -
  sudo apt install -y nodejs
  sudo npm i -g yarn
  cd /var/www/pterodactyl
  composer install --no-dev --optimize-autoloader
  sudo apt update -y
  yarn add react-feather
  php artisan migrate
  yarn build:production
  php artisan view:clear
  chown -R www-data:www-data /var/www/pterodactyl/*
  php artisan queue:restart
  php artisan up
  sudo rm /root/stellar.zip
  sudo rm -rf /root/pterodactyl

  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                   INSTALL SUCCESS               [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e ""
  sleep 2
  clear
  return
  exit 0

elif [ "$SELECT_THEME" -eq 2 ]; then
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]     ${YELLOW}             INSTALASI THEMA         ${BLUE}       [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
  cd
  curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -
  sudo apt install -y nodejs
  npm i -g yarn
  cd /var/www/pterodactyl
  composer install --no-dev --optimize-autoloader
  sudo apt update -y
  yarn add react-feather
  php artisan billing:install stable
  php artisan migrate
  yarn build:production
  php artisan view:clear
  chown -R www-data:www-data /var/www/pterodactyl/*
  php artisan queue:restart
  php artisan up
  sudo rm /root/billing.zip
  sudo rm -rf /root/pterodactyl

  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                  INSTALL SUCCESS                [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  clear
  return

elif [ "$SELECT_THEME" -eq 3 ]; then
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]     ${YELLOW}             INSTALASI THEMA         ${BLUE}       [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                                   "

    # Menanyakan informasi kepada pengguna untuk tema Enigma
    echo -e "${YELLOW}Masukkan link wa (https://wa.me/...) : ${NC}"
    read LINK_WA
    echo -e "${YELLOW}Masukkan link group (https://.....) : ${NC}"
    read LINK_GROUP
    echo -e "${YELLOW}Masukkan link channel (https://...) : ${NC}"
    read LINK_CHANNELWA
    
    # Mengganti placeholder dengan nilai dari pengguna
    sudo sed -i "s|LINK_WA|$LINK_WA|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
    sudo sed -i "s|LINK_GROUP|$LINK_GROUP|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
    sudo sed -i "s|LINK_CHNL|$LINK_CHNL|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx

# Prepare
  sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
  cd
  sudo mkdir -p /etc/apt/keyrings
  curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
  echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_18.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
  

# Lanjutan
  cd
  sudo apt update
  sudo apt-get install nodejs -y
  sudo npm i -g yarn
  cd /var/www/pterodactyl
  composer install --no-dev --optimize-autoloader
  sudo apt update -y
  yarn add react-feather
  php artisan migrate --seed --force
  yarn build:production
  php artisan view:clear
  php artisan cache:clear
  chown -R www-data:www-data /var/www/pterodactyl/*
  php artisan queue:restart
  php artisan up
  sudo rm /root/enigma.zip
  sudo rm -rf /root/pterodactyl

  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                   INSTALL SUCCESS               [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e ""
  sleep 2
  clear
  return

elif [ "$SELECT_THEME" -eq 4 ]; then
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]     ${YELLOW}             INSTALASI THEMA         ${BLUE}       [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
  cd /var/www/pterodactyl
  sudo chmod -R 755 storage/* bootstrap/cache
  curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -
  sudo apt install -y nodejs
  npm i -g yarn
  cd /var/www/pterodactyl
  composer install --no-dev --optimize-autoloader
  sudo apt update -y
  yarn add react-feather
  php artisan migrate
  yarn build:production
  php artisan view:clear
  chown -R www-data:www-data /var/www/pterodactyl/*
  php artisan queue:restart
  php artisan up
  sudo rm /root/Nook.zip
  sudo rm -rf /root/pterodactyl

  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                  INSTALL SUCCESS                [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  clear
  return

elif [ "$SELECT_THEME" -eq 5 ]; then
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]     ${YELLOW}             INSTALASI THEMA         ${BLUE}       [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
  cd
  curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -
  sudo apt install -y nodejs
  npm i -g yarn
  cd /var/www/pterodactyl
  composer install --no-dev --optimize-autoloader
  sudo apt update -y
  yarn add react-feather
  php artisan migrate
  yarn build:production
  php artisan view:clear
  chown -R www-data:www-data /var/www/pterodactyl/*
  php artisan queue:restart
  php artisan up
  sudo rm /root/Ice.zip
  sudo rm -rf /root/pterodactyl

  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                  INSTALL SUCCESS                [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  clear
  return

elif [ "$SELECT_THEME" -eq 6 ]; then
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]     ${YELLOW}             INSTALASI THEMA         ${BLUE}       [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
  cd
  curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -
  sudo apt install -y nodejs
  npm i -g yarn
  cd /var/www/pterodactyl
  composer install --no-dev --optimize-autoloader
  sudo apt update -y
  yarn add react-feather
  php artisan migrate
  yarn build:production
  php artisan view:clear
  chown -R www-data:www-data /var/www/pterodactyl/*
  php artisan queue:restart
  php artisan up
  sudo rm /root/Purple.zip
  sudo rm -rf /root/pterodactyl

  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                  INSTALL SUCCESS                [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  clear
  return

elif [ "$SELECT_THEME" -eq 0 ]; then
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]     ${YELLOW}             INSTALASI THEMA         ${BLUE}       [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  cd /var/www/pterodactyl
  unset NODE_OPTIONS
  npx update-browserslist-db@latest
  cd
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
  source ~/.bashrc  
  nvm install stable
  nvm install node
  cd /var/www/pterodactyl
  export NODE_OPTIONS=--openssl-legacy-provider
  rm -rf node_modules
  npm install -g n
  npm install -g npm@latest
  npm install yarn -g
  npm rebuild
  cd
  apt update -y && apt upgrade -y
  echo -e "Done Boss Kuh..."

  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                   INSTALL SUCCESS               [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  clear
  return
  
else
  echo ""
  echo "Pilihan tidak valid. silahkan pilih 1/2/3/4/5/6."
fi
}


# Uninstall theme
uninstall_theme() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]     ${YELLOW}             HAPUS THEMA         ${BLUE}       [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  bash <(curl https://raw.githubusercontent.com/azizcool1998/AzizTech/main/uninstalltheme.sh)
  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                 DELETE THEME SUKSES             [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  clear
}
install_panel() {
#!/bin/bash

echo -e "                                                        "
echo -e "${BLUE}[+] =============================================== [+]${NC}"
echo -e "${BLUE}[+]     ${YELLOW}             INSTALL PANEL           ${BLUE}       [+]${NC}"
echo -e "${BLUE}[+] =============================================== [+]${NC}"
echo -e "                                                        "

# Minta input dari pengguna
read -p "Masukkan Link Panel (cth: subdomain.domain.com): " linkpanel
read -p "Masukkan Link Node (cth: node.subdomain.domain.com): " linknode

# Install Panel
bash <(curl -s https://pterodactyl-installer.se) <<EOF
0
aziztech1998
aziztech1998
aziztech1998
Asia/Makassar
aziztech1998@gmail.com
aziztech@gmail.com
aziztech
AzizTech
AzizTech
aziztech
$linkpanel
y
y
y
y
yes
EOF

# Install Wings
bash <(curl -s https://pterodactyl-installer.se) <<EOF
1
y
y
y
$linkpanel
y
aziztech1998
aziztech1998
y
$linknode
y
aziztech1998@gmail.com
y
EOF

# Buat Akun Admin
cd /var/www/pterodactyl
php artisan p:user:make <<EOF
yes
admin@gmail.com
admin
Admin
Admin
admin
EOF

clear
echo -e "DONE BOSS KUH..."
sleep 5
clear

echo -e "                                                         "
echo -e "${GREEN}[+] =============================================== [+]${NC}"
echo -e "${GREEN}[+]                   INSTALL SUCCESS               [+]${NC}"
echo -e "${GREEN}[+] =============================================== [+]${NC}"
echo -e "                                                         "
sleep 2
clear
exit 0

}
create_node() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                    CREATE NODE                  [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  #!/bin/bash
#!/bin/bash

# Minta input dari pengguna
read -p "Masukkan Nama Lokasi: " location_name
read -p "Masukkan Deskripsi Lokasi: " location_description
read -p "Masukkan Link Node: " nodelink
read -p "Masukkan Nama Node: " node_name
read -p "Masukkan RAM (dalam MB): " ram
read -p "Masukkan jumlah maksimum disk space (dalam MB): " disk_space

# Ubah ke direktori pterodactyl
cd /var/www/pterodactyl || { echo "Direktori tidak ditemukan"; exit 1; }

# Membuat lokasi baru
php artisan p:location:make <<EOF
$location_name
$location_description
EOF

# Membuat node baru
php artisan p:node:make <<EOF
$node_name
$location_description
1
https
$nodelink
yes
no
no
$ram
0
$disk_space
0
1024
8080
2022
/var/lib/pterodactyl/volumes
EOF

  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]        CREATE NODE & LOCATION SUKSES            [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  clear
  exit 0
}
uninstall_panel() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                    UNINSTALL PANEL              [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "

# Uninstall Panel
bash <(curl -s https://pterodactyl-installer.se) <<EOF
6
y
y
y
aziztech1998
aziztech1998
EOF
sleep 2
clear

certbot delete <<EOF
1
y
EOF
sleep 2
clear

certbot delete <<EOF
1
y
EOF
sleep 2
clear

  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                 UNINSTALL PANEL SUKSES          [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  clear
  exit 0
}
configure_wings() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                    CONFIGURE WINGS              [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  #!/bin/bash

# Minta input token dari pengguna
read -p "Masukkan token Configure menjalankan wings: " wings

eval "$wings"
# Menjalankan perintah systemctl start wings
sudo systemctl start wings

  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                 CONFIGURE WINGS SUKSES          [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  clear
  exit 0
}
hackback_panel() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                    HACK BACK PANEL              [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  # Minta input dari pengguna
read -p "Masukkan Username Panel: " user
read -p "password login " password
  #!/bin/bash
cd /var/www/pterodactyl || { echo "Direktori tidak ditemukan"; exit 1; }

# Membuat lokasi baru
php artisan p:user:make <<EOF
yes
$user@gmail.com
$user
$user
$user
$password
EOF
  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                 AKUN TELAH DI ADD               [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  
  exit 0
}
ubahpw_vps() {
  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                 UBAH PASSWORD VPS               [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
read -p "Masukkan Pw Baru: " pw
read -p "Masukkan Ulang Pw Baru " pw

passwd <<EOF
$pw
$pw

EOF


  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                 GANTI PW VPS SUKSES             [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  
  exit 0
}
# Main script
display_welcome
install_jq
check_token

while true; do
  clear
  echo -e "                                                                     "
  echo -e "${RED}        _,@@@@@@@@@@.                                     ${NC}"
  echo -e "${RED}    ,@@@@@@@@@@@@@@@@@.                                   ${NC}"
  echo -e "${RED}  ,@@@@@        @@@@@@@@.                                 ${NC}"
  echo -e "${RED} ,@@@'               '@@@.                                ${NC}"
  echo -e "${RED}',@@       ,@@@.      '@@@:                               ${NC}"
  echo -e "${RED}'@@@      ,@@'''  .    @@@       Auto Installer AzizTech  ${NC}"
  echo -e "${RED}@@@@      @@     ,     @@@      ------------------------  ${NC}"
  echo -e "${RED}@@@:     @@.     -   ,@@@       • Telegram : AzizTech     ${NC}"
  echo -e "${RED} @@@:     @@@._    _,@@@        • Creadit  : AzizTech     ${NC}"
  echo -e "${RED} @@@.    '.'''@@@@@@@@@         • Support by AzizTech     ${NC}"
  echo -e "${RED}  '@@@    '-.__                                           ${NC}"
  echo -e "${RED}    @@@                                                   ${NC}"
  echo -e "${RED}      @@@                                                 ${NC}"
  echo -e "${RED}        @@@.                                              ${NC}"
  echo -e "${RED}          @@@.                                            ${NC}"
  echo -e "${RED}             @.                                           ${NC}"
  echo -e "                                                                     "
  echo -e "BERIKUT LIST INSTALL :"
  echo "1. Install theme"
  echo "2. Uninstall theme"
  echo "3. Configure Wings"
  echo "4. Create Node"
  echo "5. Install Panel"
  echo "6. Uninstall Panel"
  echo "7. Hack Back Panel"
  echo "8. Ubah Pw Vps"
  echo "x. Exit"
  echo -e "Masukkan pilihan 1/2/x:"
  read -r MENU_CHOICE
  clear

  case "$MENU_CHOICE" in
    1)
      install_theme
      ;;
    2)
      uninstall_theme
      ;;
      3)
      configure_wings
      ;;
      4)
      create_node
      ;;
      5)
      install_panel
      ;;
      6)
      uninstall_panel
      ;;
      7)
      hackback_panel
      ;;
      8)
      ubahpw_vps
      ;;
    x)
      echo "Keluar dari skrip."
      exit 0
      ;;
    *)
      echo "Pilihan tidak valid, silahkan coba lagi."
      ;;
  esac
done
