node {
  checkout scm

  // Run tests
  stage 'Go tests'
  docker.withRegistry('https://registry.polygon.duckdns.org:5000', 'docker-registry-login') {
    docker.image('jenkins/golang-build2').pull();
  }

  docker.image('registry.polygon.duckdns.org:5000/jenkins/golang-build2').inside {
    sh('go get -d -v')
    sh('go test')
  }

  stage 'Build Docker image'
  def img = docker.build("registry.polygon.duckdns.org:5000/gceme:${env.BUILD_TAG}")
  img.push()

  stage 'Deploy to QA cluster'
  docker.image('registry.polygon.duckdns.org:5000/jenkins/kubectl').inside('--net=host') {
        sh("kubectl --kubeconfig=/kube/config get nodes")
	//sh("kubectl --namespace=staging --kubeconfig=/kube/config rollingupdate gceme-frontend --image=${img.id} --update-period=5s")
	sh("kubectl --namespace=staging --kubeconfig=/kube/config rollingupdate gceme-backend --image=${img.id} --update-period=5s")
  }
}
