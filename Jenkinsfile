pipeline {
    environment {
        JAVA_TOOL_OPTIONS = "-Duser.home=/var/maven"
    }

    agent {
        docker {
            image "maven:3.8.5-jdk-11"
            args '-v $HOME:/var/maven'
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