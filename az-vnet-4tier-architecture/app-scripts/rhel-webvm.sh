sudo dnf install -y httpd
sudo systemctl enable httpd
sudo systemctl start httpd
sudo systemctl stop firewalld
sudo systemctl disable firewalld
sudo chmod -R 777 /var/www/html
echo "Red Hat Enterprise Linux VM ---- hostname: $(hostname)"
sudo mkdir /var/www/html/app1