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
}
