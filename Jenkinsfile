pipeline {
    agent any

    tools {
        maven 'Maven-3.9.9'
    }

    stages {
        stage('Build JAR') {
            steps {
                bat 'mvn clean install'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t registry.cn-hangzhou.aliyuncs.com/msbzyl/jenki-test:latest .'
            }
        }

        stage('Login to ACR') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'aliyun-acr', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    bat 'docker login -u %DOCKER_USER% -p %DOCKER_PASS% registrycn-hangzhou.aliyuncs.com'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                bat 'docker push registry.cn-hangzhou.aliyuncs.com/msbzyl/jenkins-test:latest'
            }
        }
    }
}
