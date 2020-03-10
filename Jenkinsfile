pipeline {
    agent {label 'docker-slave'}
    stages {
        stage('Source') { //get code
            steps {
            git branch: 'master',
                credentialsId: 'github-ssh-key',
                url: 'git@github.com:Deadricss5/app.git'
            }
        }
        stage('Test'){
            steps {
                findFiles(glob: '**.html')
            }
        }
        stage('Deploy'){
            steps{
            sh 'cp * /home/centos/www/'
            sh 'sleep 2'
            sh 'docker start my-project-app'
            }
        }
    }
        post {
        always {
            echo 'One way or another, I have finished'
            deleteDir() /* clean up our workspace */
            sh 'sleep 60'
            sh 'docker kill my-project-app'
        }
        success {
            echo 'Success'
        }
        unstable {
            echo 'I am unstable :/'
        }
        failure {
            echo 'I failed :('
            mail to: 'fspmss5@outlook.com',
             subject: "Failed Pipeline: ${currentBuild.fullDisplayName}",
             body: "Everything is broken and doesn't work ${env.BUILD_URL}"
        }
        changed {
            echo 'Things were different before...'
        }
    }
}

