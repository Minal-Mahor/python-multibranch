pipeline { 

    environment { 

        registry = 'minalmahor/flaskapi'

        registryCredential = 'dockerHub' 
         branch= "$registry:prod"

        dockerImage = '' 

    }

    agent any 

    stages { 

        stage('Cloning Git') { 

            steps { 

                git 'https://github.com/Minal-Mahor/python-multibranch.git' 

            }

        } 

        stage('Building image') { 

            steps { 

                script { 

                    dockerImage = docker.build registry +':prod'+ "$BUILD_NUMBER" 

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
               

                sh "docker rmi $branch$BUILD_NUMBER"

            }

        } 

    }

}
