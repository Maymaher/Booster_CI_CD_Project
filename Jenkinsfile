pipeline {
    agent any

    stages {
        stage('prepratiom') {
            steps {
                git "https://github.com/Maymaher/Booster_CI_CD_Project"
            }
        }
         stage('CI') {
            steps {
                   withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'mypass', usernameVariable: 'myname')])
                   {
                    sh """
                    docker build . -t maimaher/myimage5
                    docker login --username ${myname} --password ${mypass}
                    docker push maimaher/myimage5
                    
                    """
                   }
            }
        }
        
        stage('CD') {
            steps {
                   withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'mypass', usernameVariable: 'myname')])
                   {
                   
                   sh """
                    docker run -d -p 8000:8000 maimaher/myimage5
                    """
                   }
                   
            }
        }
    }
}
