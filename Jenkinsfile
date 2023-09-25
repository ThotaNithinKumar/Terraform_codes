pipeline {
    agent any
    stages {
        stage('Group Creation') {
            steps {
                sh '''
                sudo groupadd -g 1312 Test
                cat /etc/group|grep Test
                '''
            }
        }
    }
}
