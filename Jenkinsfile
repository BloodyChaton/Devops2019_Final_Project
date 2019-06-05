pipeline {
    agent {
        label 'mavenslave'
    }

    // environment {
    //     SVC_ACCOUNT_KEY = credentials('jsonterraform')
    // }
    // tools {
    //     maven 'maven'
    // }
    stages {
        
        stage('checkout') {
            steps {
                git branch: 'features/luc_sshGCP', credentialsId: 'abc6116c-57e5-4151-ac31-8a621c480f72', url: 'https://github.com/BorisFyot/Devops2019_Final_Project.git'
			}
        }

        // stage('GCPcredentials') {
        //     steps {
        //         sh 'echo $SVC_ACCOUNT_KEY | base64 -d > united-lane-241907-c7fa43cedef5.json'
        //     }
        // }

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
                    sh 'ls'
                    sh 'pwd'
                    sh 'terraform init'
                }
            }
        }

        // stage('tfplan') {
        //     steps {
        //         sh 'terraform plan'
        //     }
        // }

        // stage('tfapply') {
        //     steps {
        //         sh 'terraform apply -auto-approve'
        //     }
        // }
        
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
        
    }
}