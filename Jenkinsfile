pipeline { 
  
  /*
    agent any

    tools { 
      nodejs "NodeJS18"
    }*/

    agent {
        reuseNode true
        docker { image 'node:18.9-alpine3.15' }
    }
   
    environment {
         // Override HOME to WORKSPACE
        HOME = "${WORKSPACE}"
        // or override default cache directory (~/.npm)
        NPM_CONFIG_CACHE = "${WORKSPACE}/.npm"
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
