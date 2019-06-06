# Devops2019_Final_Project
Luc, Boris

Merci de nous avoir fait confiance pour ce projet. 
Dans ce document nous allons vous décrire les étapes qui ont été accomplis par l'équipe et celle n'ayant pas encore pu être automatisée. 

Attention : Le projet est actuellement qu'en partie réussie et nécessite encore certaines interventions humaines que nous allons décrire. 

Les étapes qui ont été automatisé via le fichier jenkins file sont les suivantes :
- L'installation automatique des environements d'outillage. 
	-	Une machine avec jenkins
	-	Une machine mavens / docker (slave jenkins)
	-	Une machine nexus
	-	Un serveur Apache, reverse proxy. 
	-	La creation d'une image docker a partir d'un build maven et son push sur un docker hub. 
	-	La livraison de l'image docker hub sur le cluster TEST.

- L'installation automatique de l'environement client
	- 	Un cluster prod 
	-	Un cluster test
	-	Une machine client prod
	-	Une machine client test
	-	Une machine pour la BDD test
	-	Une machine pour la BDD prod

- Les elements manquants :
	-	L'installation automatique des postes BDD
	-	La containerisation et instanciation de machine docker pour utiliser en tant que slave jenkins
	-	La creation d'un load balancer en entré du cluster. 
	-	L'automatisation des actions suivante :
			-	Le login au gcloud
			-	La variabilisation des traitements associés (détection si un traitement doit affecté test ou prod en fonction de paramètre)
	-	Au vue du retard pris l'application n'a pu être tester pour le moment. Le pod faisant bien tourné celui  



Le projet necessitera l'installation sur jenkins du plug in suivant : 
	-	Pipeline Utility Steps

Il necessitera le fait de log in la machine maven / kubectl a google via un gcloud auth.


