pipeline {
  environment {
    imagename = "localhost/alpine-webmin"
    registryCredential = 'local'
    dockerImage = ''
  }
  agent { dockerfile true }
  stages {
    stage('Cloning Git') {
      steps {
        git([url: 'https://github.com/arimal199/alpine-webmin.git', branch: 'main', credentialsId: 'local'])

      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build alpine-webmin
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push("$BUILD_NUMBER")
             dockerImage.push('latest')

          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $imagename:$BUILD_NUMBER"
         sh "docker rmi $imagename:latest"

      }
    }
  }
}