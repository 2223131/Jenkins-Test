pipeline {
    agent any

    stages {
        stage('Build JAR') {
            steps {
                bat 'mvn clean install'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t registry.ap-southeast-1.aliyuncs.com/msbqlj/jenkins-test:latest .'
            }
        }

        stage('Login to ACR') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'aliyun-acr', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    bat 'docker login -u %DOCKER_USER% -p %DOCKER_PASS% registry.ap-southeast-1.aliyuncs.com'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                bat 'docker push registry.ap-southeast-1.aliyuncs.com/msbqlj/jenkins-test:latest'
            }
        }
    }
}
