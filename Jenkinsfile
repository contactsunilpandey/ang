pipeline { 
  agent any

 tools { 
   nodejs "NodeJS18"
 }
  
  stages {
    stage('Install Packages') {
        steps {
          sh 'npm install'
        }
    }
     stage('Test') {
        steps {
          sh 'npm run test-headless'
        }
    }
    stage('Build') {
        steps {
          sh 'npm run build'
        }
    }
  }
  
 post {
    always{
      emailext to: "forcidcd@gmail.com",
      subject: "jenkins build:${currentBuild.currentResult}: ${env.JOB_NAME}",
      body: "${currentBuild.currentResult}: Job ${env.JOB_NAME}\nMore Info can be found here: ${env.BUILD_URL}"
      cleanWs()
    }
  }
  
}
