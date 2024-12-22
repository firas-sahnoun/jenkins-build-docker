
pipeline {
    agent {
        label 'linux-docker'
    }

    stages {
        stage ('Print hello') {
            steps {
                echo 'hello from jenkins pipeline'
                echo 'test d\'un simple pipeline'
                ls -l
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