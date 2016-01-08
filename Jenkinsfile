node {
  checkout scm

  // Run tests
  stage 'Go tests'
  docker.withRegistry('https://registry.polygon.duckdns.org:5000') {
    def golang = docker.image('jenkins/golang-build')
    sh "docker pull --all-tags ${golang.imageName()}"
    golang.inside {
      sh('go get -d -v')
      sh('go test')
    }
  }
}
