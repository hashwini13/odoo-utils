#!/bin/bash

#STEP 1 : NOW START ODOO
sudo su – odoo -s /bin/bash

cd /odoo/odoo-server

./odoo-bin -c /etc/odoo-server.conf

#./odoo-bin -u your_module_to_update -c /etc/odoo-server.conf
#sudo service odoo-server start
