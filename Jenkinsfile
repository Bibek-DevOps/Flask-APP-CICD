pipeline {
    agent any
    stages {
        // stage'(check source code'){
        //     steps{
        //         checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'github', url: 'git@github.com:Bibek-DevOps/Flask-APP-CICD.git']]])
        //     }
        // }
        stage('Cleanup dangling images'){
            steps{
                sh '''
                docker rmi $(docker images -f 'dangling=true' -q) || true
                docker rmi $(docker images | sed 1,2d | awk '{print $3}') || true
                '''
        }
    }

        stage('Building Docker Image') {
    
            steps {
                echo '=== Building Docker Image ==='

                    script { 
                    app= docker.build("Bibek-DevOps/Flask-APP-CICD")
                    
                }
            }
            
        }
        
        stage('Push Docker Image') {
            steps {
                echo '=== Pushing Docker Image to Registary ==='
                script {
                    GIT_COMMIT_HASH = sh (script: "git log -n 1 --pretty=format:'%H'", returnStdout: true)
                    SHORT_COMMIT = "${GIT_COMMIT_HASH[0..7]}"
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerHubCredentials') {
                        app.push("$SHORT_COMMIT")
                        app.push("latest")
                    }
                }
            }
        }
        stage('Remove local images') {
            steps {
                echo '=== Delete the local docker images ==='
                sh("docker rmi -f Bibek-DevOps/Flask-APP-CICD:latest || :")
                sh("docker rmi -f Bibek-DevOps/Flask-APP-CICD:$SHORT_COMMIT || :")
            }
        }
    }
}