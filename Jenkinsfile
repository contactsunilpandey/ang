node { 
  agent { label 'master' }

 tools { nodejs "NodeJS18" }
 
  stage('Test npm') {
      steps {
        sh """
          npm --version
        """
      }
  }
 
 stage("Checkout SCM"){
  git branch:'main', url:'https://github.com/contactsunilpandey/ang.git'
 }
 stage("Install NPM") {
  sh 'npm install'
 }
}
