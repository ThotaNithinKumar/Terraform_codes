pipeline {
    agent any
    stages {
        stage('Group Creation') {
            steps {
                sh '''
                groupadd -g 2332 Testers
                cat /etc/group|grep 2332
                '''
            }
        }
    }
}
