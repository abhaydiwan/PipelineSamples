@Library('pipeline-library-demo')_
node {
    stage("stage 1") {
        echo 'Hello World'
        sayHello 'Abhay'
       script {
        def datas = readYaml file: 'repoValid.yaml'
        echo "Got version as ${datas.something} "
       }
        readYaml
        getBuildInfo 
    }
    stage("stage 2") {
        echo "We are at stage 2!"
    }
}
