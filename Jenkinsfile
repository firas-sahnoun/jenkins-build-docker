pipeline {
    agent { label 'linux-docker' }

    environment {
        DOCKER_LOGIN = credentials('docker-login')
    }

    stages {
        // 📌 Étape 1 : Affichage d'un message simple
        stage('Print hello') {
            steps {
                script {
                    echo 'hello from Jenkins pipeline'
                    echo 'test d\'un simple pipeline'
                }
            }
        }

        // 📌 Étape 2 : Affichage du Dockerfile
        stage('Print Dockerfile') {
            steps {
                script {
                    sh 'cat Dockerfile'
                }
            }
            post {
                success {
                    echo 'Le Dockerfile a été affiché avec succès'
                }
            }
        }

        // 📌 Étape 3 : Construction de l'image Docker
        stage('Build image') { 
            steps {
                script {
                    sh 'docker build -t httpd-issam:v1.1 .'
                    sh 'docker images'
                }
            }
        }

        // 📌 Étape 4 : Tag de l'image Docker
        stage('Tag image') { 
            steps {
                script {
                    sh 'docker tag httpd-issam:v1.1 imejri/httpd-issam:v1.1'
                    sh 'docker images'
                }
            }
        }

        // 📌 Étape 5 : Pousser l'image sur DockerHub
        stage('Push image') { 
            steps {
                script {
                    // Connexion à DockerHub
                    sh 'docker login -u $DOCKER_LOGIN_USR -p $DOCKER_LOGIN_PSW'
                }
            }
            post {
                success {
                    script {
                        sh 'docker push imejri/httpd-issam:v1.1'
                    }
                }
            }
        }
    }

    // 📌 Post-actions après le pipeline
    post {
        success {
            echo "✅ BUILD OK"
        }
        failure {
            echo "❌ BUILD NON OK"
        }
    }
}