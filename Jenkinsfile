
pipeline {
    agent {
        label 'linux-docker'
    }

    environment {
                DOCKER_LOGIN = credentials('docker-login')
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

        stage ('Tag image') { 
            steps {
                script {
                  sh 'docker tag alpine-issam:v1.1 imejri/alpine-issam:v1.1'
                  sh 'docker images'
                }
            }
        }//stage

        stage ('Push image') { 
            steps {
                script {
                // login to dockerhub
                  sh 'docker login -u $DOCKER_LOGIN_USR -p $DOCKER_LOGIN_PSW'             
                }
                post {
                    success {
                        // Si le login est ok je pousse mon image
                        sh 'docker push imejri/alpine-issam:v1.1'
                    }
                } //post
            } //steps
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