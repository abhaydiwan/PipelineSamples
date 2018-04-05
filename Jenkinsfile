import groovy.json.JsonSlurper
import net.sf.json.JSONObject
@Library('pipeline-library-demo')_
def sysIdRes = ''
node {
  
    stage("Deployment in QA Starts") {
        echo "We are going to deploy it in QA"
    }
    
  stage("create change request") {
    def response = serviceNow_createChange serviceNowConfiguration: [instance: 'dev53461', producerId: '33a646a24f8113000216224f9310c723'], credentialsId:'ad2298b0-fe86-4f89-9810-62360cc19939'
    def jsonSlurper = new JsonSlurper()
    def createResponse = jsonSlurper.parseText(response.content)
    print 'createResponse' + createResponse
    def changeNumber = createResponse.result.number
    sysIdRes = createResponse.result.sys_id
    }
   
  
  stage('Deploy approval'){
       input 'Update Change Request'
    }
  
  stage("Update Change Request") {
    def messageJsonUpdate = new JSONObject()
      messageJsonUpdate.putAll([
                short_description: 'My change order approved and in implemntation phase',
                description: 'My longer description of the change',
                state: '-1'  
        ])
  def responseUpdate = serviceNow_updateChangeItem serviceNowConfiguration: [instance: 'dev53461'], credentialsId: 'ad2298b0-fe86-4f89-9810-62360cc19939', serviceNowItem: [table: 'change_request', sysId: sysIdRes, body: messageJsonUpdate.toString()]
  print 'responseUpdate' +responseUpdate 
  }
  
 stage("Deployment in Prod Starts") {
        echo "We are going to deploy it in Prod"
        input "Close Change Request"
     
 }    
    stage("Close Change Request") {
    def messageJson = new JSONObject()
      messageJson.putAll([
                short_description: 'My change order is closed',
                description: 'My longer description of the change',
                state: '3'
        ])
  def response = serviceNow_updateChangeItem serviceNowConfiguration: [instance: 'dev53461'], credentialsId: 'ad2298b0-fe86-4f89-9810-62360cc19939', serviceNowItem: [table: 'change_request', sysId: sysIdRes, body: messageJson.toString()]
    }
    
}
