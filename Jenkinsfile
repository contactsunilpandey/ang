pipeline { 
  agent any

 tools { 
   nodejs "NodeJS18"
 }
  
  stages {
    stage('Test npm') {
        steps {
          sh 'npm install'
        }
    }
    stage('Build') {
        steps {
          sh 'ng build'
        }
    }
  }
}
