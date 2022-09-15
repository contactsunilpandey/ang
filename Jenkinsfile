pipeline { 
    agent any

 tools { 
   nodejs "NodeJS18"
 }
   
   environment {
        CHROME_BIN = '/usr/bin/google-chrome'        
    }
  
  stages {
    stage('Check Node Version') {
            steps {
                sh 'node --version'
            }
        }
    
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
      emailext to: "forcicd@gmail.com",
      subject: "jenkins build:${currentBuild.currentResult}: ${env.JOB_NAME}",
      body: "${currentBuild.currentResult}: Job ${env.JOB_NAME}\nMore Info can be found here: ${env.BUILD_URL}",
      attachLog: true
      
     
    }
  }
  
}
