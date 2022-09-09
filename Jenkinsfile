node {
 agent any
 
 tools {nodejs "NodeJS18"}
 
 stage("Checkout SCM"){
  git branch:'main', url:'https://github.com/contactsunilpandey/ang.git'
 }
 stage("Install NPM") {
  sh 'npm install'
 }
}
