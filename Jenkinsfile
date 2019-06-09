pipeline {
    agent {
        label 'mavenslave'
    }

    environment {
        SVC_ACCOUNT_KEY = credentials('json2')
        registry = "bloodychaton/projetfinal"
        registryCredential = 'dockerhub'
        DHUB = credentials('dockerhub2')
    }
    tools {
        maven 'maven'
    }
    stages {
        
        stage('checkout') {
            steps {
                git branch: 'features/luc_after', credentialsId: 'GitHUBloody', url: 'https://github.com/BorisFyot/Devops2019_Final_Project.git'
			}
        }

        stage('GCPcredentials') {
            steps {
                sh 'touch ./projet-final-243214-da8e41fa7a08.json'
                sh 'echo $SVC_ACCOUNT_KEY | base64 -d > GCP_test/projet-final-243214-da8e41fa7a08.json'
            }
        }

        stage('tooling') {
            steps {
                script {
                    def tfHome = tool name: 'terraform'
                    env.PATH = "${tfHome}:${env.PATH}"
                }
            } 
        }
        
        stage('tfinit') {
            steps {
                dir('GCP_test') {
                    sh 'terraform init'
                    sh 'terraform plan'
                }
            }
        }

        stage('tfapply') {
            steps {
                dir('GCP_test') {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
        
	//     stage('dockerhub') {
    //         environment {
    //  //Use Pipeline Utility Steps plugin to read information from pom.xml into env variables
    //  //         IMAGE = readMavenPom().getArtifactId()
    //             VERSION = readMavenPom().getVersion()
    //         }
	// 	    steps {
	//             sh "echo ${VERSION}"
	//             sh 'docker images'
	// 	        sh 'docker push borisfyot/app:${VERSION}'
	// 	    }
    //     }
    //    stage('checkout2') {
    //        steps {
    //            git branch: 'features/app', credentialsId: 'abc6116c-57e5-4151-ac31-8a621c480f72', url: 'https://github.com/BorisFyot/Devops2019_Final_Project.git'
	//		}
    //    }
        stage('maven') {
            steps {
                sh 'mvn install -Dmaven.test.skip=true'
            }
        }
        
	    stage('dockerhub') {
            environment {
     //Use Pipeline Utility Steps plugin to read information from pom.xml into env variables
     //         IMAGE = readMavenPom().getArtifactId()
                VERSION = readMavenPom().getVersion()
            }
		    steps {
	            sh "echo ${VERSION}"
                sh 'docker login -u bloodychaton -p $DHUB'
	            sh 'docker images'
		        sh 'docker push bloodychaton/projetfinal:${VERSION}'
		    }
        }
        stage('checkout3') {
            steps {
                sh 'echo $PATH'
                sh 'gcloud container clusters get-credentials test-cluster --zone europe-north1-a --project projet-final-243214'
            }
        }
        stage('namespace') {
            steps {
                sh 'kubectl create namespace test || exit 0'
            }
        }
        stage('clientapp') {
        steps {
                sh 'kubectl apply -f ./k8s/client_app.yaml'
            }
        }
        stage('serviceapp') {
        steps {
                sh 'kubectl apply -f ./k8s/service.yaml '
            }
        }     
    }
}