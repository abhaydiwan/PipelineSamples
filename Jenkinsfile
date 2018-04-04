import groovy.json.JsonSlurper
@Library('pipeline-library-demo')_
node {
  
    stage("Deployment in QA Starts") {
        echo "We are going to deploy it in QA"
    }
    
  stage("create change order") {
    def response = serviceNow_createChange serviceNowConfiguration: [instance: 'dev53461', producerId: '33a646a24f8113000216224f9310c723'], credentialsId:'5bff3281-3406-4583-ac11-df0adb43f6c9'
    def jsonSlurper = new JsonSlurper()
    def createResponse = jsonSlurper.parseText(response.content)
    print 'createResponse' + createResponse
    def changeNumber = createResponse.result.number
    }
   
  
  stage('Deploy approval'){
       input "Deploy to prod?"
    }
  
  stage("update change order") {
    def response = serviceNow_createChange serviceNowConfiguration: [instance: 'dev53461', producerId: '33a646a24f8113000216224f9310c723'], credentialsId:'5bff3281-3406-4583-ac11-df0adb43f6c9'
    def jsonSlurper = new JsonSlurper()
    def createResponse = jsonSlurper.parseText(response.content)
    print 'createResponse' + createResponse
    def changeNumber = createResponse.result.number
    }
  
 stage("Deployment in Prod Starts") {
        echo "We are going to deploy it in Prod"
    }    
    
    
}
