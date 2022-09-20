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

     stage("Stop And Remove Existing Docker Container"){
        agent any
        steps{
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                sh "docker stop ubuntu-ang-container"
                sh "docker rm ubuntu-ang-container"
            }          
        }
    }

    stage("Try Remove Docker Image"){
        agent any
        steps{
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                sh "docker image rm ubuntu/ang-image" 
            }          
        }
    }

     stage("Build Docker Image"){
        agent any
        steps{           
            sh "docker build -f=Dockerfile_dev -t ubuntu/ang-image ."
        }
    }   

    stage("Run Docker Container"){
        agent any
        steps{          
            sh "docker run --name ubuntu-ang-container -it  -d -p 8888:80 ubuntu/ang-image"
        }
    }
   
  }

   post {    

    always{       
 node("mailer") {

 
            
        
        emailext to: "forcicd@gmail.com",
        subject: "jenkins build:${currentBuild.currentResult}: ${env.JOB_NAME}",
        body: "${currentBuild.currentResult}: Job ${env.JOB_NAME}\nMore Info can be found here: ${env.BUILD_URL}",
        attachLog: true
 
}
        //cleanWs()
    }
  }
}


// def tryRemoveExistingImages(myString) {
//     /* Dummy method to show User Aborts vs Build Failures */

//     echo "Attempting remove ubuntu/ang-image" + myString

//     try {
//         build (
//             job: "Dummy_Downstream_Job"
//         )

//     } catch (e) {
//         /* Build Aborted by user - Stop All Test Executions */
//         if (e.getMessage().contains("was cancelled") || e.getMessage().contains("ABORTED")) {

//             env.GLOBAL_BUILD_ABORTED = true
//         }
//         /* Throw the execiption to be caught by catchError() to mark the stage failed. */
//         throw (e)
//     }

//     // Do other stuff...
// }
