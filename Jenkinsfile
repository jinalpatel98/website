node{

    stage('SCM Checkout')
    {
        git url: 'https://github.com/ankitaj85/phpmysql-app.git'
    }
    
    stage('Run Docker Compose File')
    {
        sh 'docker-compose build'
        sh 'docker-compose up -d'
    }
    stage('PUSH image to Docker Hub')
    { 
        sh 'docker push ankitaj86/phpmysql_app'
    }
}
