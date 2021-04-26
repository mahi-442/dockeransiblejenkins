pipeline {
    agent any

    tools{
        maven 'maven3'
    }

    environment {
        DOCKER_TAG = "getVersion()"
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
                sh 'docker build . -t mahi9618/hueapp:${DOCKER_TAG}'
            }
        }
    }
}
def getVersion() {
    def commitHash = sh label: '', returnStdout: true, script: 'git rev-parse --short HEAD'
    return commitHash
}