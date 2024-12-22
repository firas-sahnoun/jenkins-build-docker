# Utiliser l'image officielle HTTPD comme base
FROM httpd:2.4

# Définir les métadonnées de l'image
LABEL maintainer="Issam"
LABEL version="1.0"
LABEL description="Image personnalisée d'un serveur Apache HTTPD"

# Copier les fichiers HTML et les configurations dans le conteneur
#COPY ./public-html/ /usr/local/apache2/htdocs/
#COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf

# Exposer le port 80 pour le trafic HTTP
EXPOSE 80

# Commande pour démarrer le serveur Apache (par défaut dans l'image HTTPD)
CMD ["httpd-foreground"]
