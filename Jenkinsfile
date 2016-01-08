node {
  checkout scm

  golang = docker.image('registry.polygon.duckdns.org:5000/jenkins/golang-build')
  
  // Run tests
  stage 'Go tests'
  docker.withRegistry('https://registry.polygon.duckdns.org:5000') {
    //docker.image('registry.polygon.duckdns.org:5000/jenkins/golang-build').inside {
    golang.pull()
    golang.inside {
      sh('go get -d -v')
      sh('go test')
    }
    }
}
