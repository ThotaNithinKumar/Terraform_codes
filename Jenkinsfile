pipeline {
    agent any
    stages {
        stage('Group Creation') {
            steps {
                sh '''
                groupadd -g 1357 Testing
                echo|cat /etc/group|grep Testing
                '''
            }
        }
    }
}
