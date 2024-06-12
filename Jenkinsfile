pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'diab456/inventory-management-system'
    }

    tools {
        jdk 'jdk-17'
        maven 'maven-3.6.3'
    }

    stages {
        stage('Build') {
            steps {
                dir('F:/NetBeans/Spring Boot/InitializrSpringbootProject1') {
                    bat 'mvn clean package'
                }
            }
        }
        stage('Test') {
            steps {
                dir('F:/NetBeans/Spring Boot/InitializrSpringbootProject1') {
                    bat 'mvn test'
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    bat "docker build -t ${DOCKER_IMAGE} ."
                    bat "docker run -d -p 8080:8080 ${DOCKER_IMAGE}"
                }
            }
        }
    }
}
