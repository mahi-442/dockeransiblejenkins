pipeline {
    agent any

    tools{
        maven 'maven3'
    }

    stages{
        stage('git checkout') {
            steps{
                git credentialsId: 'GitHub', 
                    url: 'https://github.com/mahi-442/dockeransiblejenkins.git'
            }
        }
        stage('maven build') {
            sh 'mvn clean package'
        }
    }
}