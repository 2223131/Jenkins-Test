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
                bat 'docker build -t registry.cn-hangzhou.aliyuncs.com/msbzyl/jenkins-test:latest .'
            }
        }

        stage('Login to ACR') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'aliyun-acr', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    script {
                        bat """
                            echo Logging in as %DOCKER_USER%
                            docker logout registry.cn-hangzhou.aliyuncs.com
                            docker login registry.cn-hangzhou.aliyuncs.com -u %DOCKER_USER% -p %DOCKER_PASS%
                        """
                    }
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
