#!/bin/bash

echo "STEP 0 : INSTALL MISC"
sudo apt-get install openssh-server -y

sudo systemctl enable ssh

sudo systemctl start ssh

sudo apt-get net-tools -y


# https://technostore360.com/how-to-install-odoo-14-on-ubuntu-20-04/
echo "STEP 1 : UPDATE SERVER"
sudo apt-get update

sudo apt-get upgrade -y

echo "STEP 2 : CREATE ODOO USER IN UBUNTU"
sudo adduser -system -home=/opt/odoo -group odoo

echo "STEP 3 : INSTALL POSTGRESQL SERVER"
sudo apt-get install postgresql -y

echo "STEP 4 : CREATE ODOO USER FOR POSTGRESQL"
sudo su – postgres -c "createuser -s odoo" 2> /dev/null || true

echo "STEP 5 : INSTALL PYTHON DEPENDENCIES"
sudo apt-get install git python3 python3-pip build-essential wget python3-dev python3-venv python3-wheel libxslt-dev libzip-dev libldap2-dev libsasl2-dev python3-setuptools node-less libjpeg-dev gdebi -y

echo "STEP 6 : INSTALL PYTHON PIP DEPENDENCIES"
sudo apt-get install libpq-dev python-dev libxml2-dev libxslt1-dev libldap2-dev libsasl2-dev libffi-dev -y

sudo -H pip3 install -r https://raw.githubusercontent.com/odoo/odoo/master/requirements.txt

echo "STEP 7 : INSTALL OTHER REQUIRED PACKAGES"
sudo apt-get install nodejs npm -y

sudo npm install -g rtlcss

echo "STEP 8 : INSTALL WKHTMLTOPDF"
sudo apt-get install xfonts-75dpi -y

sudo wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.bionic_amd64.deb

sudo dpkg -i wkhtmltox_0.12.6-1.bionic_amd64.deb

sudo cp /usr/local/bin/wkhtmltoimage /usr/bin/wkhtmltoimage

sudo cp /usr/local/bin/wkhtmltopdf /usr/bin/wkhtmltopdf

echo "STEP 9 : CREATE LOG DIRECTORY"
sudo mkdir /var/log/odoo

sudo chown odoo:odoo /var/log/odoo

echo "STEP 10 :INSTALL ODOO"
sudo apt-get install git -y

sudo git clone --depth 1 --branch 14.0 https://www.github.com/odoo/odoo /odoo/odoo-server

echo "STEP 11 : SETTING PERMISSIONS ON HOME FOLDER"
sudo chown -R odoo:odoo /odoo/*

echo "STEP 12 : CREATE SERVER CONFIG FILE"
sudo touch /etc/odoo-server.conf

sudo su root -c "printf '[options] \n; This is the password that allows database operations:\n' >> /etc/odoo-server.conf"

sudo su root -c "printf 'admin_passwd = admin\n' >> /etc/odoo-server.conf"

sudo su root -c "printf 'xmlrpc_port = 8069\n' >> /etc/odoo-server.conf"

sudo su root -c "printf 'logfile = /var/log/odoo/odoo-server.log\n' >> /etc/odoo-server.conf"

sudo su root -c "printf 'addons_path=/odoo/odoo-server/addons\n' >> /etc/odoo-server.conf"

sudo chown odoo:odoo /etc/odoo-server.conf

sudo chmod 644 /etc/odoo-server.conf


