pipeline {
    agent { label 'linux-docker' }

    environment {
        DOCKER_LOGIN = credentials('docker-login')
    }

    stages {

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
        // 📌 Étape 6 : Démarrer le conteneur HTTPD
        stage('Run HTTPD container') {
            steps {
                script {
                    echo '🚀 Démarrage du conteneur HTTPD...'
                    sh '''
                    docker run -d \
                        --name pipeline-webserver \
                        -p 8000:80 \
                        imejri/httpd-issam:v1.1
                    '''
                }
            }
            post {
                success {
                    script {
                        SERVER_FQDN = sh(
                        script: 'hostname -f',
                        returnStdout: true
                    ).trim()
                    echo '✅ Le conteneur HTTPD est démarré avec succès !'
                    echo "Le FQDN du serveur est : ${SERVER_FQDN}"
                    echo "Le serveur est accessible depuis l'url: http://${SERVER_FQDN}:8000"
                    }

                }
                failure {
                    echo '❌ Échec du démarrage du conteneur HTTPD.'
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