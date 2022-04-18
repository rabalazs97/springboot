pipeline {
    environment {
        JAVA_TOOL_OPTIONS = "-Duser.home=/home/cloud/maven-repo"
    }
    agent {
        docker {
            image "maven:3.8.5-jdk-11"
            args '-v $WORKSPACE:/home/cloud/maven-repo/.m2 -e MAVEN_CONFIG=/home/cloud/maven-repo/.m2'
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