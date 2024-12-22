
pipeline {
    agent {
        label 'linux-docker'
    }

    stages {
        stage ('Print hello') {
            steps {
                scripts {
                    echo 'hello from jenkins pipeline'
                    echo 'test d\'un simple pipeline'
                    echo "test post condition >> /test/issue"
                    rmdir /test
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