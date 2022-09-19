pipeline { 
  
  /*
    agent any

    tools { 
      nodejs "NodeJS18"
    }*/

    
   
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

            steps {
                echo 'Checking chrome binary'
                sh 'ls -al /usr/bin | grep chrom'
            }
            steps {
                echo 'Installing packages'
                sh 'npm install'
            }

            steps {
                echo 'Run test-headless npm run command'
                sh 'npm run test-headless'
            }
            steps {
                echo 'Building'
                sh 'npm run build'
            }
    }
    stage('Dockerize') {
        agent { 
            docker 'nginx:stable-alpine' 
        }

        steps {
            echo 'Checking NGINX version'
            sh 'nginx -v'
        }
        steps {
            echo 'ls workspace'
            sh 'ls -al ${WORKSPACE}'
        }
    }
  }
  
 post {
    always{
      emailext to: "forcicd@gmail.com",
      subject: "jenkins build:${currentBuild.currentResult}: ${env.JOB_NAME}",
      body: "${currentBuild.currentResult}: Job ${env.JOB_NAME}\nMore Info can be found here: ${env.BUILD_URL}",
      attachLog: true
      
      cleanWs()
    }
  }
  
}
