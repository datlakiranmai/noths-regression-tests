pipeline {
    agent any
    parameters {
        string(defaultValue: 'shared', description: 'Enter the QA env name. Eg: For staging, enter "staging", For QA enter, "shared"', name: 'ENV_NAME')
        string(defaultValue: 'cucumber -p p1', description: 'test command to execute', name: 'TEST_COMMAND')
    }
    triggers {
        cron('15 23 * * 1-7')
    }
    stages {
        stage ('Show parameters') {
            steps {
                echo params.ENV_NAME
                echo params.TEST_COMMAND
            }
        }
        stage ('Build Docker Image') {
            steps {
                script {
                    docker.build(generateImageName())
                }
            }
        }
        stage('Build tests') {
            steps {
                echo "Building tests container"
                sh "docker-compose build tests"
            }
        }
        stage('Running Tests') {
            steps {
                script {
                    try {
                        sh "docker-compose up -d"
                        sleep 5
                        sh "docker-compose run -e ENV_ID=${params.ENV_NAME} tests ${params.TEST_COMMAND}"
                    }
                    finally {
                        sh "docker-compose down"
                    }
                }
            }
        }
    }
    post {
        always {
             archiveArtifacts artifacts: "output/dir/*"
        }
    }
}