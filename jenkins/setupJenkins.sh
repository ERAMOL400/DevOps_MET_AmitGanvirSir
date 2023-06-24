sudo su -     ## login with root

## Step1:
apt-get update
apt install default-jre -y
java --version
apt install default-jdk -y

echo $JAVA_HOME
echo 'JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"' >> /etc/environment
source /etc/environment
echo $JAVA_HOME
java --version

## Step2:
## Install Jenkins use Link for updated steps https://www.jenkins.io/doc/book/installing/linux/
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
  
sudo apt-get update
sudo apt-get install jenkins
ps -ef | grep jenkins

## Step3:
Open your brower and use your ec2 public IP with port 8080
http://<ec2-ip>:8080

## Use your password for Administrator password
cat /var/lib/jenkins/secrets/initialAdminPassword


##Jenkins Plugin
Jenkins basic Configuration
Store Credentials in jenkins

## On Jenkins ec2
echo 'JENKINS_HOME="/var/lib/jenkins/"' >> /etc/environment
source /etc/environment
echo $JENKINS_HOME


############ how to run kubernetes container form Jekins Job  ############
Step1:
## Goto Master ec2 and copy content of below file
cat /etc/kubernetes/admin.conf 

Step2: Got to Jenkins ec2
sudo su -
su - jenkins
mkdir ~/.kube
## Paste admin.conf file contente here
vim /root/.kube/config

Step3: Got Jenkions ec2 and Install kubeclt
sudo su -
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common  -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce -y
wget -q -O - https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo deb http://apt.kubernetes.io/ kubernetes-xenial main | sudo tee /etc/apt/sources.list.d/kubernetes.list
apt update
apt install kubectl=1.21.1-00 -y

# Step3: Create free-stype job and execute kubectl  for example -> kubectl run nginx --image=nginx


############ how to compile java code using maven form Jekins Job  ############



