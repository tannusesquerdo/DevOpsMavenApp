pipeline {
    agent any

    environment {
        DOCKER_HUB_PWD = credentials('docker-hub-pwd')
        DOCKER_IMAGE_NAME = 'tannus/devops-maven'
    }

    tools {
        dockerTool 'Docker'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/tannusesquerdo/DevOpsMavenApp'
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
                    def dockerImage = docker.build(DOCKER_IMAGE_NAME)
                }
            }
        }

        stage('Docker Login') {
            steps {
                script {
                    sh "docker login -u tannusesquerdo -p ${DOCKER_HUB_PWD}"
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    sh "docker push ${DOCKER_IMAGE_NAME}"
                }
            }
        }
    }
}
