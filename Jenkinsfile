node {
  checkout scm

  // Run tests
  stage 'Go tests'
  docker.withRegistry('https://registry.polygon.duckdns.org:5000', 'docker-registry-login') {
    def golang = docker.image('jenkins/golang-build2')
    sh "docker pull --all-tags ${golang.imageName()}"
    //golang.pull()
    golang.inside {
      sh('go get -d -v')
      sh('go test')
    }
  }
}
