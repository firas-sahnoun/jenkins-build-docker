
pipeline {
    agent {
        label 'linux-docker'
    }

    stages {
        stage ('Print hello') {
            steps {
                script {
                    echo 'hello from jenkins pipeline'
                    echo 'test d\'un simple pipeline'
                    echo "test post condition >> /test/issue"
                    sh 'rmdir /test'
                }
                
            }

        }
    }
    post {
        success {
            echo "BUILD OK"
        }
        failure {
            echo "BUILD NON OK"
        }
    }
}