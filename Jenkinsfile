pipeline {
    agent any
    tools {
        maven 'MAVEN'
        jdk 'JDK'
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/tannusesquerdo/DevOpsMavenApp'
            }
        }
        stage('Build with Maven') {
            steps {
                sh 'mvn clean install'
            }
        }
    }
}
