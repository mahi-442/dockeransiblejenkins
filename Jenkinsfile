pipeline {
    agent any

    stages{
        stage('git checkout') {
            steps{
                git credentialsId: 'GitHub', 
                    url: 'https://github.com/mahi-442/dockeransiblejenkins.git'
            }
        }
    }
}