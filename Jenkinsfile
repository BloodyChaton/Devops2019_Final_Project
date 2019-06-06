pipeline {
    agent {
        label 'mavenslave'
    }

    environment {
        SVC_ACCOUNT_KEY = credentials('json2')
    }
    tools {
        maven 'maven'
    }
    stages {
        
        stage('checkout') {
            steps {
                git branch: 'features/luc_sshGCP', credentialsId: 'abc6116c-57e5-4151-ac31-8a621c480f72', url: 'https://github.com/BorisFyot/Devops2019_Final_Project.git'
			}
        }

        stage('GCPcredentials') {
            steps {
                sh 'touch ./united-lane-241907-c7fa43cedef5.json'
                sh 'echo $SVC_ACCOUNT_KEY | base64 -d > GCP_test/united-lane-241907-c7fa43cedef5.json'
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
        stage('checkout2') {
            steps {
                git branch: 'features/app', credentialsId: 'abc6116c-57e5-4151-ac31-8a621c480f72', url: 'https://github.com/BorisFyot/Devops2019_Final_Project.git'
			}
        }
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
	            sh 'docker images'
		        sh 'docker push borisfyot/app:${VERSION}'
		    }
        }
        stage('checkout3') {
            steps {
                sh 'echo $PATH'
                sh 'gcloud container clusters get-credentials test-cluster --zone europe-north1-a --project united-lane-241907'
                git branch: 'features/kubernetes', credentialsId: 'abc6116c-57e5-4151-ac31-8a621c480f72', url: 'https://github.com/BorisFyot/Devops2019_Final_Project.git'
            }
        }
        stage('namespace') {
            steps {
                sh 'kubectl create namespace test || exit 0'
            }
        }
        stage('clientapp') {
        steps {
                sh 'kubectl apply -f ./test/client_app.yaml'
            }
        }
        stage('serviceapp') {
        steps {
                sh 'kubectl apply -f ./test/service.yaml '
            }
        }     
    }
}