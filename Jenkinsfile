pipeline {
    agent {
        docker {
            image 'maven:3.8.3-openjdk-17' 
            args '-v /root/.m2:/root/.m2' 
        }
    }
    stages {
        stage('Build') { 
            steps {
                sh 'mvn -B -DskipTests clean package' 
            }
        }
        stage('Test') { 
            steps {
                sh 'mvn test' 
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml' 
                }
            }
        }
        steps('Docker Build') {
            sh 'docker build -t jenkins-teste .'
        }
        steps('Docker Stop') {
            sh 'docker container stop jenkins-teste'
        }
        steps('Docker Run') {
            sh 'docker run --name jenkins-teste -d -p 8082:8082 jenkins-teste'
        }
    }
}