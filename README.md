# odoo-utils
```

1. Install net-tools

`
sudo apt install net-tools
`

2. Install ssh

`
sudo apt install openssh-server
sudo systemctl enable ssh
sudo systemctl start ssh
`

3. Install git

`
sudo apt install git
`

4. Create directory 'workspace' in home directory, clone repo

`
mkdir workspace
cd workspace
git clone https://github.com/hashwini13/odoo-utils.git
`
5. Run odoo_setup.sh

`
cd odoo-utils
./odoo_setup.sh
./odoo_start.sh
`
```
