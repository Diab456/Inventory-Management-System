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
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'git@github.com:Diab456/Inventory-Management-System.git'
            }
        }
        stage('Build') {
            steps {
                dir('F:\\NetBeans\\Spring Boot\\InitializrSpringbootProject1') {
                    sh 'mvn clean package'
                }
            }
        }
        stage('Test') {
            steps {
                dir('F:\\NetBeans\\Spring Boot\\InitializrSpringbootProject1') {
                    sh 'mvn test'
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE} ."
                    sh "docker run -d -p 8080:8080 ${DOCKER_IMAGE}"
                }
            }
        }
    }
}
