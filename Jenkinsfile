pipeline {
    agent any

    environment {
        DOCKER_HUB_PWD = credentials('docker-hub-pwd')
    }

    tools {
        maven 'MAVEN',
        docker 'Docker'
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
                    sh "mvn clean package"
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t tannusesquerdo/devops-maven:${env.BUILD_NUMBER}"
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
                    sh "docker push tannusesquerdo/devops-maven:${env.BUILD_NUMBER}"
                }
            }
        }
    }
}
