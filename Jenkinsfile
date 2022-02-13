pipeline {
    agent any
    tools {
        go 'go1.16'
    }
    environment {
        GO114MODULE = 'on'
        CGO_ENABLED = 0 
    }
    stages {        
        stage('Pre Test') {
            steps {
                echo 'Installing dependencies'
                sh 'go version'
                sh 'go get -u golang.org/x/lint/golint'
            }
        }
    } 
}