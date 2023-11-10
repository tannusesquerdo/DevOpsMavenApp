pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub-credentials-id')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                script {
                    def mvnHome = tool 'MAVEN'
                    sh "${mvnHome}/bin/mvn clean package"
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def dockerHome = tool 'Docker'
                    def dockerImage = sh "${dockerHome}/bin docker build -t tannusesquerdo/devops-lab3-image:${env.BUILD_NUMBER}"
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    dockerImage.push()
                }
            }
        }
    }
}
