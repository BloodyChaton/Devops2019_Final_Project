# Devops2019_Final_Project
Luc, Boris

Merci de nous avoir fait confiance pour ce projet. 
Dans ce document nous allons vous décrire les étapes qui ont été accomplies par l'équipe et celles n'ayant pas encore pu être automatisées. 

Attention : Le projet n'est pas encore achevé et nécessite encore certaines interventions humaines que nous allons décrire. 

Les étapes qui ont été automatisées via le fichier jenkinsfile sont les suivantes :
	-	Le déploiement de l'architecture de test et production sur google cloud:
		- 	Un cluster prod.
		-	Un cluster test.
		-	Une machine client prod.
		-	Une machine client test.
		-	Une machine pour la BDD test.
		-	Une machine pour la BDD prod.
	-	Containerisation de l'application une image docker via un plug in maven. 
	-	Livraison et mise à disposition de l'application et de son service sur le cluster kubernetes. 

Ont aussi été automatisées : 
	-	Le déploiement de l'architecture d'outils et leurs installations via role ansible sur un cloud azure : 
		-	Une machine avec jenkins.
		-	Une machine mavens / docker (slave jenkins).
		-	Une machine nexus.
		-	Un serveur Apache (proxy). 

- Les élèments à développer :
	-	L'installation automatique des postes BDD
	-	La containerisation et instanciation de machine docker pour les utiliser en tant que slave jenkins
		-	Kubectl
		-	Ansible
		-	Terraform
	-	La création d'un load balancer en entrée du cluster. 
	-	L'automatisation des actions suivantes :
		-	Le login au gcloud
		-	La variabilisation des traitements associés (Webhook detectant une version affectant l'environement de test ou prod en fonction de paramètre)
	


Dans l'état actuel le projet nécessitera les étapes suivantes : 
	-	Installation de kubectl/gcloud sur la machine maven.
	-	Login d'un user google sur la machine maven/kubectl via un gcloud auth.
	-	Installation du plugin jenkins : Pipeline Utility Steps
	-	Installation du proxy pass ssh selon le modèle fourni dans le dossier ssh. 
	-	Création des clés via le fichier fournit dans le dossier K8S/key. Il faudra utilisé la commande kubectl apply -k . 
		(pour le lien clé dockerhub voir le guide suivant : https://github.com/BorisFyot/kubernetes/tree/master/tp3.5)
	-	Dans l'état actuel des choses les tests unitaires ont été ignorés car il empêchait l'installation du projet maven. 