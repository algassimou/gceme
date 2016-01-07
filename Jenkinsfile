node {
  checkout scm

  // Run tests
  stage 'Go tests'
  docker.image('golang').inside {
    sh('go get -d -v')
    sh('go test')
  }	
}
