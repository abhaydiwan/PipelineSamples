import groovy.json.JsonSlurper
@Library('pipeline-library-demo')_
node {
    stage("stage 1") {
        echo 'Hello World'
        sayHello 'Abhay'
    }
    stage("stage 2") {
        echo "We are at stage 2!"
    }
    
    stage('Fetch password details') {
withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: '5bff3281-3406-4583-ac11-df0adb43f6c9',
usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
println(env.USERNAME)
sh 'echo uname=$USERNAME pwd=$PASSWORD'
 }
}
    stage("create change order") {
    
    def response = serviceNow_createChange serviceNowConfiguration: [instance: 'dev53461', producerId: '33a646a24f8113000216224f9310c723'], credentialsId:'5bff3281-3406-4583-ac11-df0adb43f6c9'
    def jsonSlurper = new JsonSlurper()
    def createResponse = jsonSlurper.parseText(response.content)
    print 'createResponse' + createResponse
    def changeNumber = createResponse.result.number
    }
    
    
}
