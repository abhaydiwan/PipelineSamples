@Library("pipeline-library-demo") _
pipeline {
agent any
stages{
    stage('Execute ansible command'){
        agent any
        steps{
           
            runDocker('','',"ansible --version")   
        }
     }
  }
}
