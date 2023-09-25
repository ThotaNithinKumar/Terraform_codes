pipeline {
    agent any
    stages {
        stage('Group Creation') {
            steps {
                sh '''
                sudo groupadd -g 2332 Testers
                cat /etc/group|grep 2332
                '''
            }
        }
    }
}
