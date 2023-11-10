pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub-credentials-id')
        DOCKER_IMAGE_NAME = 'tannusesquerdo/devops-lab3-image'
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
                    // Authenticate with Docker Hub using credentials
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_HUB_CREDENTIALS) {
                        // Build the Docker image
                        def dockerImage = docker.build(DOCKER_IMAGE_NAME + ":${env.BUILD_NUMBER}")
                    }
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
