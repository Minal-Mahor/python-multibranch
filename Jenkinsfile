node {

	stage('Source Code Management')
	{
    checkout scm
    }
     
    stage('Docker Image'){
    docker.withRegistry('https://registry.hub.docker.com', 'dockerHub') {

        def customImage = docker.build("minalmahor/flaskApi"+":${BUILD_NUMBER}")

        /* Push the container to the custom Registry */
        customImage.push()
    }
   }
}