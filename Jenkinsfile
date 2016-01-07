node {
  checkout scm

  // Run tests
  stage 'Go tests'
  docker.withRegistry('https://192.168.0.23:5000') {
    docker.image('golang-build').inside {
      sh('whoami')
      sh('go get -d -v')
      sh('go test')
    }
  }
}
