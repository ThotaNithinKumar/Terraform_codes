pipeline {
    agent any
    stages {
        stage('Group Creation') {
            steps {
                sh '''
                sudo groupadd -g 1357 Testing
                cat /etc/group|grep Testing
                '''
            }
        }
    }
}
