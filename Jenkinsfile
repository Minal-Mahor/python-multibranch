pipeline { 

    environment { 

        registry = "minalmahor/FlaskWebApp" 

        registryCredential = 'dockerHub' 

        dockerImage = '' 

    }

    agent any 

    stages { 

        stage('Cloning Git') { 

            steps { 

                git 'https://github.com/YourGithubAccount/YourGithubRepository.git' 

            }

        } 

        stage('Building image') { 

            steps { 

                script { 

                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 

                }

            } 

        }

        stage('Deploy image') { 
            steps { 

                script { 

                    docker.withRegistry( '', registryCredential ) { 

                        dockerImage.push() 

                    }

                } 

            }

        } 

        stage('Cleaning up') { 

            steps { 

                sh "docker rmi $registry:$BUILD_NUMBER" 

            }

        } 

    }

}

