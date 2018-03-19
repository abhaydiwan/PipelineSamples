@Library('pipeline-library-demo')_
node {
    stage("stage 1") {
        echo 'Hello World'
        sayHello 'Abhay'
        readGroovyYaml('/tmp/repoValid.yml')
        
    }
    stage("stage 2") {
        echo "We are at stage 2!"
    }
}
