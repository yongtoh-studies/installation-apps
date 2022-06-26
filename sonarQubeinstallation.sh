#As a good security practice, SonarQuber Server is not advised to run sonar service as a root user, 
# create a new user called sonar and grant sudo access to manage sonar services as follows

sudo useradd sonar
# Grand sudo access to sonar user
sudo echo "sonar ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/sonar
sudo hostname sonar
#sudo passwd sonar
sudo su - sonar
sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
sudo service sshd restart
cd /opt
sudo yum -y install unzip wget git
sudo wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm
sudo yum install jdk-8u131-linux-x64.rpm -y
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-7.8.zip
sudo unzip sonarqube-7.8.zip
sudo rm -rf sonarqube-7.8.zip
sudo mv sonarqube-7.8 sonarqube
sudo chown -R sonar:sonar /opt/sonarqube/
sudo chmod -R 775 /opt/sonarqube/
sh /opt/sonarqube/bin/linux-x86-64/sonar.sh start
sh /opt/sonarqube/bin/linux-x86-64/sonar.sh status
