// pipeline {
//     agent any
//
//     tools {
//         maven 'Maven-3.9.9'
//     }
//
//     stages {
//
//         stage('Build JAR') {
//             steps {
//                 bat 'mvn clean install'
//             }
//         }
//
//         stage('Build Docker Image') {
//             steps {
//                 bat 'docker build -t registry.cn-hangzhou.aliyuncs.com/msbzyl/jenkins-test:latest .'
//             }
//         }
//
//         stage('Login to ACR') {
//             steps {
//                 withCredentials([usernamePassword(credentialsId: 'aliyun-acr', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
//                     bat '''
//                         echo Logging in as %DOCKER_USER%
//                         docker logout registry.cn-hangzhou.aliyuncs.com
//                         docker login registry.cn-hangzhou.aliyuncs.com -u %DOCKER_USER% -p %DOCKER_PASS%
//                     '''
//                 }
//             }
//         }
//
//         stage('Push Docker Image') {
//             steps {
//                 bat 'docker push registry.cn-hangzhou.aliyuncs.com/msbzyl/jenkins-test:latest'
//             }
//         }
//
//         stage('Remote Deploy to ECS') {
//             steps {
//                 sshCommand remote: [
//                     name: 'ecs-server',
//                     host: 'www.paperpuppy.chat',
//                     user: 'root',
//                     credentialsId: 'ecs-ssh',
//                     allowAnyHosts: true
//                 ], command: '''
//                     docker stop jenkins-test || true
//                     docker rm jenkins-test || true
//                     docker pull registry.cn-hangzhou.aliyuncs.com/msbzyl/jenkins-test:latest
//                     docker run -d -p 8888:8123 --name jenkins-test registry.cn-hangzhou.aliyuncs.com/msbzyl/jenkins-test:latest
//                 '''
//             }
//         }
//     }
// }

// pipeline {
//     agent any
//     stages {
//         stage('Test SSH Connection') {
//             steps {
//                 sshCommand remote: [
//                     name: 'ecs-server',
//                     host: 'www.paperpuppy.chat',
//                     user: 'root',
//                     port: 22,
//                     credentialsId: 'ecs-ssh',
//                     allowAnyHosts: true
//                 ],
//                 command: 'hostname'
//             }
//         }
//     }
// }


pipeline {
    agent any

    stages {
        stage('Deploy to Remote Server') {
            steps {
                script {
                    def remote = [:]
                    remote.name = 'ecs-server' // 必须设置一个名称
                    remote.host = 'www.paperpuppy.chat'
                    remote.user = 'root'
                    remote.password = 'xiaoyuan+147939'
                    remote.port = 22 // 默认SSH端口
                    remote.allowAnyHosts = true // 忽略主机密钥检查

                    sshCommand remote: remote, command: "echo 'Hello from ECS'"
                }
            }
        }
    }
}