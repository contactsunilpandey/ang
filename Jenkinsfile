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

    stage("Build Docker Image"){
        agent any
        steps{
            sh "docker image rm ubuntu/ang-image"
            sh "docker build -f=Dockerfile_dev -t ubuntu/ang-image ."
        }
    }
     stage("Stop And Remove Existing Docker Container"){
        agent any
        steps{
            sh "docker stop ubuntu/ang-container"
            sh "docker rm ubuntu/ang-container"
            sh "docker run --name ubuntu/ang-container -it  -d -p 8888:80 ubuntu/ang-image"
        }
    }
    // stage('Dockerize') {
    //     agent { 
    //         dockerfile {
    //             filename  'Dockerfile_deployment'
    //             args  '--privileged -e WD="${WORKSPACE}"'
    //         } 
    //     }
    //     steps{
            
    //         echo 'ls workspace'
    //         sh 'ls -al ${WD}/dist/ang'

    //         echo 'Checking NGINX version'
    //         sh 'ls -al /usr/share/nginx/html'

    //     }
    // }
  }
}
