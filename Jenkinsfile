pipeline {
    agent any
    options {
        buildDiscarder(logRotator(numToKeepStr: '2', daysToKeepStr: '1'))
    }
    triggers {
        pollSCM('H/2 * * * *')
    }
    tools {
        maven 'M3'
    }
    stages {
        stage('Build') {
            steps {
                git url: 'https://github.com/kennyk65/aws-cloudbuild-demo.git'
                sh 'mvn clean package'
            }
            post {
                success {
                    junit '**/target/surefire-reports/TEST-*.xml'
                    archiveArtifacts 'target/*.war'
                }
            }
        }
    }
}
