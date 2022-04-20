pipeline {
    environment {
        JAVA_TOOL_OPTIONS = "-Duser.home=/home/cloud/maven-repo"
    }
    agent any

    stages {
        stage("Build") {
            steps {
                sh "mvn -version"
                sh "mvn clean install"
            }
        }
    }

    post {
        success {
            sshagent(['prod_server']) {
                sh "ssh -o StrictHostKeyChecking=no root@vm.smallville.cloud.bme.hu -p 1685 'bash -s' < stop_jar.sh"
                sh 'scp -P 1685 -o StrictHostKeyChecking=no $WORKSPACE/target/onlab-0.0.1-SNAPSHOT.jar root@vm.smallville.cloud.bme.hu:/home/cloud/onlab'
                sh "ssh -o StrictHostKeyChecking=no root@vm.smallville.cloud.bme.hu -p 1685 'bash -s' < start_jar.sh"
            }
        }

        cleanup {
            cleanWs()
        }
    }
}