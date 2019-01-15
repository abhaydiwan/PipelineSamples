@Library("pipeline-library-demo") _
pipeline {
agnet any
stages{
    stage('Execute ansible command'){
        agent any
        steps{
           
            runDocker('','',"ansible --version")   
        }
     }
  }
}
