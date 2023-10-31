pipeline {
    agent any

    stages {
        stage('Build with Maven') {
            steps {
                sh 'mvn clean install'
            }
        }
    }
}
