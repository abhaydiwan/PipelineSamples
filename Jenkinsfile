import groovy.json.JsonSlurper
import net.sf.json.JSONObject
@Library('pipeline-library-demo')_

node {
  
    stage("Deployment in QA Starts") {
        echo "We are going to deploy it in QA"
    }
    
  stage("create change request") {
    def response = serviceNow_createChange serviceNowConfiguration: [instance: 'dev53461', producerId: '33a646a24f8113000216224f9310c723'], credentialsId:'5bff3281-3406-4583-ac11-df0adb43f6c9'
    def jsonSlurper = new JsonSlurper()
    def createResponse = jsonSlurper.parseText(response.content)
    print 'createResponse' + createResponse
    def changeNumber = createResponse.result.number
    def sysIdRes = createResponse.result.sys_id
    }
   
  
  stage('Deploy approval'){
       input "Deploy to prod?"
    }
  
  stage("update change request") {
    def messageJsonUpdate = new JSONObject()
      messageJsonUpdate.putAll([
                short_description: 'My change order approved',
                description: 'My longer description of the change'
        ])
  def response = serviceNow_UpdateChangeItem serviceNowConfiguration: [instance: 'dev53461'], credentialsId: '5bff3281-3406-4583-ac11-df0adb43f6c9', serviceNowItem: [table: 'change_request', sysId: sysIdRes, body: messageJsonUpdate.toString()]
    }
  
 stage("Deployment in Prod Starts") {
        echo "We are going to deploy it in Prod"
    }    
  stage('Close Change Request'){
       input "Deploy to prod?"
    }
  stage("update change request") {
    def messageJson = new JSONObject()
      messageJson.putAll([
                short_description: 'My change order is closed',
                description: 'My longer description of the change'
        ])
  def response = serviceNow_UpdateChangeItem serviceNowConfiguration: [instance: 'dev53461'], credentialsId: '5bff3281-3406-4583-ac11-df0adb43f6c9', serviceNowItem: [table: 'change_request', sysId: sysIdRes, body: messageJson.toString()]
    }
    
}
