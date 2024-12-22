
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
                } // script
                
            } // steps

        }// stage

        stage ('print Dockerfile') {
            steps {
                script {
                    sh 'cat Dockerfile'
                }
            } //steps
            post {
                success {
                    echo 'le dockerfile est affiché'
                }
            } //post
        } //stage

        // Build Alpine image
        stage ('Build image') { 
            steps {
                script {
                  sh 'docker build -t alpine-issam:v1.1 .'
                  sh 'docker images'
                }
            }
        }//stage
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