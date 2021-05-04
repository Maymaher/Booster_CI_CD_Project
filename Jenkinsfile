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
                    docker build . -t maimaher/myimage4
                    docker login --username ${myname} --password ${mypass}
                    docker push maimaher/myimage4
                    
                    """
                   }
            }
        }
        
        stage('CD') {
            steps {
                   withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'mypass', usernameVariable: 'myname')])
                   {
                   
                   sh """
                    docker run -d -p 3000:3000 maimaher/myimage4
                    """
                   }
                   
            }
        }
    }
}
