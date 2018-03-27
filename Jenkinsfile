import groovy.json.JsonSlurper
@Library('pipeline-library-demo')_
node {
    stage("stage 1") {
        echo 'Hello World'
        sayHello 'Abhay'
        getBuildInfo 
    }
    stage("stage 2") {
        echo "We are at stage 2!"
    }
    stage("create change order") {
    
    def response = serviceNow_createChange serviceNowConfiguration: [instance: 'dev53461.service-now.com', producerId: 'abhay123'], credentialsId:'5bff3281-3406-4583-ac11-df0adb43f6c9'
    def jsonSlurper = new JsonSlurper()
    def createResponse = jsonSlurper.parseText(response.content)
    def sysId = createResponse.result.sys_id
    def changeNumber = createResponse.result.number
    }
    
    
}
