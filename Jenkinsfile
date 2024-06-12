pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'diab456/inventory-management-system'
    }

    tools {
        jdk 'jdk-11'
        maven 'maven-3.6.3'
    }

    stages {
        stage('Build') {
            steps {
                dir('path/to/your/project') {
                    sh 'mvn clean package'
                }
            }
        }
        stage('Test') {
            steps {
                dir('path/to/your/project') {
                    sh 'mvn test'
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE} ."
                    sh "docker run -d -p 8081:8081 ${DOCKER_IMAGE}"
                }
            }
        }
    }
}
