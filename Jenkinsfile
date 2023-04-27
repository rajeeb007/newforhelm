pipeline {
    agent any
    environment{
        DOCKERHUB_CREDENTIALS = credentials('docker_key')
    }
    stages{
        stage('git checkout'){
            steps{
                git branch: 'main', credentialsId: 'git_key', url: 'https://github.com/rajeeb007/newforhelm.git'
            }
        }
        stage('code scanner') {
            steps {
                withSonarQubeEnv(credentialsId: 'sonar_key',installationName:'sonarqube') {
                    sh 'mvn sonar:sonar'
    
               }
            
            }
        }
        stage('docker image building') {

            steps {

                sh 'docker build -t rajeeb007/for_helm:1.1 .'
               
            }

        }
        stage('Login') {

            steps {

                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'

            }

        }
        stage('pushing to docker hub') {

            steps {

                sh 'docker push rajeeb007/for_helm:1.1'

            }

        }    

    }
}