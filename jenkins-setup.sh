sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y  docker-ce docker-ce-cli containerd.io
sudo apt-get install -y docker-compose
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl restart docker
sudo apt install -y gnupg2 pass
docker login -u username -p password

# Install jenkins
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list' 
sudo apt-get update
sudo apt update
sudo apt install -y openjdk-8-jdk
sudo apt-get install -y jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
sudo gpasswd -a jenkins docker
sudo systemctl restart jenkins
echo ---------- First Time Unlocking Jenkins required AdministratorPassword --------------
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
newgrp docker

