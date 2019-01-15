@Library("pipeline-library-demo") _
pipeline {
agent any
stages{
    stage('Execute python command'){
        agent any
        steps{
            runDocker('','',"python --version")   
        }
     }
    stage('Execute ansible command'){
        agent any
        steps{
            runDocker('','',"ansible --version")   
        }
     }
    stage('Execute terraform command'){
        agent any
        steps{
            runDocker('','',"terraform --version")   
        }
     }
  }
}
