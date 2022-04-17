pipeline {
    agent {
        docker {
            image "maven:3.8.5-jdk-11"
            args '-v $HOME/.m2:/root/.m2'
        }
    }

    stages {
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