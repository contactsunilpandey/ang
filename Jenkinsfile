pipeline {   

    agent none
   
    environment {
         // Override HOME to WORKSPACE
        HOME = "${WORKSPACE}"
        // or override default cache directory (~/.npm)
        NPM_CONFIG_CACHE = "${WORKSPACE}/.npm"

        CHROME_BIN = "/usr/bin/chromium-browser"
    }

  stages {
    stage('Run Test') {
        agent {
            dockerfile {
                filename  'Dockerfile_alpinenode'
                args  '--privileged'
            }
        }
        steps{
                            
            echo 'Checking chrome binary'
            sh 'ls -al /usr/bin | grep chrom'
        
            echo 'Installing packages'
            sh 'npm install'
        
            echo 'Run test-headless npm run command'
            sh 'npm run test-headless'
        
            echo 'Building'
            sh 'npm run build'                
        }
    }
    stage('Dockerize') {
        agent { 
            docker 'nginx:stable-alpine' 
        }
        steps{
            
            echo 'Checking NGINX version'
            sh 'nginx -v'
        
            echo 'ls workspace'
            sh 'ls -al ${WORKSPACE}'
            
        }
    }
  }
}
