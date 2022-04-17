pipeline {
    agent {
        docker {
            image "maven:3.8.5-jdk-11"
        }
    }

    stages {
        stage("Test"){
            steps {
                sh "mvn test"
            }
        }
        stage("Build") {
            steps {
                sh "mvn -version"
                sh "mvn clean install"
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}