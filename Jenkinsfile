pipeline {
    agent any

    tools{
        maven 'maven3'
    }

    environment {
        DOCKER_TAG = getVersion()
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
        stage('dockerhub push') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerHubPwd')]) {
                    // some block
                    sh 'docker login -u mahi9618 -p ${dockerHubPwd}'
                }
                sh 'docker push mahi9618/hueapp:${DOCKER_TAG}'
            }
        }
        stage('docker deploy') {
            steps {
                ansiblePlaybook credentialsId: 'dev-server', disableHostKeyChecking: true, extras: '-e DOCKER_TAG=${DOCKER_TAG}', installation: 'ansible', inventory: 'dev-inv', playbook: 'deploy-docker.yml'
            }
        }
    }
}
def getVersion() {
    def commitHash = sh label: '', returnStdout: true, script: 'git rev-parse --short HEAD'
    return commitHash
}