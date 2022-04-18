pipeline {
    agent {
        docker {
            image "maven:3.8.5-jdk-11"
            args "-v $WORKSPACE:/home/cloud/maven-repo -w /home/cloud/maven-repo"
            reuseNode true
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