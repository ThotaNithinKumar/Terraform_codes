pipeline {
    agent any
    stages {
        stage('Group Creation') {
            steps {
                sh '''
                sudo groupadd -g 1357 Testing
                echo|cat /etc/group|grep Testing
                '''
            }
        }
    }
}
