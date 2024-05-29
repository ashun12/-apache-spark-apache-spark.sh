#!/bin/bash

# Set -Hostname and IP
sudo sed -i -e '$a\'$'\n''172.16.24.250 spark' /etc/hosts

# Install JAVA
sudo apt install openjdk-8-jdk -y

# Download Spark
sudo wget https://dlcdn.apache.org/spark/spark-3.4.3/spark-3.4.3-bin-hadoop3.tgz
sudo tar xvzf spark-3.4.3-bin-hadoop3.tgz

sudo mkdir -p /opt/spark
sudo chown -R spark:spark /opt/spark
sudo mv spark-3.4.3-bin-hadoop3 /opt/spark/

# Set JAVA Variables
sed -i -e '$a\'$'\n''export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64' ~/.bashrc
sed -i -e '$a\'$'\n''export PATH=$PATH:/usr/lib/jvm/java-8-openjdk-amd64/bin' ~/.bashrc
sed -i -e '$a\'$'\n''SPARK_HOME=/opt/spark/spark-3.4.3-bin-hadoop3/' ~/.bashrc
sed -i -e '$a\'$'\n''export PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin' ~/.bashrc

# Update
source ~/.bashrc

# Check
sudo spark-shell
