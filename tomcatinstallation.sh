#!/bin/bash
# Use this script to install tomcat in rehat servers
echo delete the failed version of tomcat
sudo rm -rf /opt/tomcat10
echo assign a hostname to your server 
sudo hostname tomcat2
# install Java JDK 1.8+ as a pre-requisit for tomcat to run.
cd /opt 
sudo yum install git wget -y
sudo yum install java-1.8.0-openjdk-devel -y
# Download tomcat software and extract it.
sudo yum install wget unzip -y

sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.63/bin/apache-tomcat-10.0.22.tar.gz
sudo tar -xvf apache-tomcat-10.0.22.tar.gz
sudo rm apache-tomcat-10.0.22.tar.gz
sudo mv apache-tomcat-10.0.22 tomcat10
sudo chmod 777 -R /opt/tomcat10
sudo chown ec2-user -R /opt/tomcat10
sh /opt/tomcat9/bin/startup.sh
# create a soft link to start and stop tomcat
sudo ln -s /opt/tomcat9/bin/startup.sh /usr/bin/starttomcat
sudo ln -s /opt/tomcat9/bin/shutdown.sh /usr/bin/stoptomcat
sudo yum update -y
starttomcat

