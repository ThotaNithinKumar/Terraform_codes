pipeline {
    agent any
    stages {
        stage('Group Creation') {
            steps {
                sh '''
                groupadd -g 2331 Tester
                cat /etc/group|grep 2331
                '''
            }
        }
    }
}
