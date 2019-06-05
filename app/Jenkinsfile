pipeline {
    agent {
        label 'mavenslave'
    }
    tools {
        maven 'maven'
    }
    stages {
        
        stage('checkout') {
            steps {
                git branch: 'features/app', credentialsId: 'abc6116c-57e5-4151-ac31-8a621c480f72', url: 'https://github.com/BorisFyot/Devops2019_Final_Project.git'
			}
        }
        
        stage('package') {
            steps {
                sh 'mvn install -Dmaven.test.skip=true'
            }
        }
        
        stage('image') {
            steps {
                sh 'docker build -t example:1 .'
            }
        }
    }
}