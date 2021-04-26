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
            steps {
                sh 'mvn clean package'
            }
        }
        stage('docker build') {
            steps {
                sh 'docker build -t hue:v1 .'
            }
        }
    }
}
def gitVersion() {
    def commitHash = sh label: '', returnStdout: true, script: 'git rev-parse --short HEAD'
    return commitHash
}