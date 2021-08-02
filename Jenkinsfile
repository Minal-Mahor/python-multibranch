pipeline { 

    environment { 

        registry = 'minalmahor/flaskapi'

        registryCredential = 'dockerHub' 

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

                    dockerImage = docker.build registry +'dev'+ ":$BUILD_NUMBER" 

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
                tag="$registry+'dev'+:$BUILD_NUMBER"

                sh "docker rmi $tag"

            }

        } 

    }

}
