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
    /*stage('Run Test') {
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
    }*/
    stage('Dockerize') {
        agent { 
            dockerfile {
                filename  'Dockerfile'
                args  '--privileged -e WD="${WORKSPACE}"'
            } 
        }
        steps{
            
            echo 'ls workspace'
            sh 'ls -al ${WD}/ang/dist'

            echo 'Checking NGINX version'
            sh 'ls -al /usr/share/nginx/html'

        }
    }
  }
}
