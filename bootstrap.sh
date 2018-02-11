sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y apache2 wget python3 python3-pip

# Install MySQL
sudo debconf-set-selections <<< 'mysql-server-5.7 mysql-server/root_password password system'
sudo debconf-set-selections <<< 'mysql-server-5.7 mysql-server/root_password_again password system'
sudo apt-get -y install mysql-server

# Pip stuff
sudo -H pip3 install --upgrade setuptools pip
sudo -H pip3 install flask flask-login flask-migrate flask-sqlalchemy PyMySQL

rootpassword="dbpass"
mysql -uroot -p${rootpassword} -e "CREATE USER 'dt_admin'@'localhost' IDENTIFIED BY 'dt2016';"
mysql -uroot -p${rootpassword} -e "CREATE DATABASE dreamteam_db;"
mysql -uroot -p${rootpassword} -e "GRANT ALL PRIVILEGES ON dreamteam_db . * TO 'dt_admin'@'localhost';"
