node {
  checkout scm

  // Run tests
  stage 'Go tests'
  docker.withRegistry('https://registry.polygon.duckdns.org:5000', 'e0d827a5-3c67-4c96-a262-c59919ed25ee') {
    def golang = docker.image('jenkins/golang-build')
    //sh "docker pull --all-tags ${golang.imageName()}"
    golang.pull()
    golang.inside {
      sh('go get -d -v')
      sh('go test')
    }
  }
}
