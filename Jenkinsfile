node {
  checkout scm

  // Run tests
  stage 'Go tests'
  //docker.withRegistry('https://registry.polygon.duckdns.org:5000') {
    docker.image('registry.polygon.duckdns.org:5000/jenkins/golang-build').inside {
      sh('whoami')
      sh('go get -d -v')
      sh('go test')
    }
    //}
}
