pipeline {
    environment {
        USER = "ecovalciuc-bookscatalog"
        AWS_REGION = "us-east-1"
        SONAR_TKN = "ecovalciuc-sonar-token"
        ECR_REPO = "315727832121.dkr.ecr.us-east-1.amazonaws.com"
        
        VER_ID = "v_${BUILD_NUMBER}"
        GIT_COMMIT_HASH = sh (script: "git log -n 1 --pretty=format:'%H'", returnStdout: true)
        SHORT_COMMIT = "${GIT_COMMIT_HASH[0..7]}"
    }
    
    agent {
        node {
            label 'Slave01'
        }
    }
  
    stages {

        // Building .NET App. From GitLab repository. Testing and Scaning the code using SonarScanner
        stage('BUILDING and SCANNING') {
            when {
                branch 'master'
            }
            steps {
                echo "-> --> ---> -----> --------> -------------> --------------------->- Build..."
                withCredentials([string(credentialsId: 'ecovalciuc-sonar-token', variable: 'SONAR_LOGIN_TOKEN')]) {
                    sh "docker build --build-arg SONAR_LOGIN_TOKEN=${SONAR_LOGIN_TOKEN} -t ${USER}:${VER_ID} ."
                }
            }
        }

        // Push image to ECR in AWS. Version should be the commit ID
        stage('PUSHING docker image') {
            when {
                branch 'master'
            }
            steps {
                echo '-> --> ---> -----> --------> -------------> --------------------->- Push...'
                script {
                    docker.withRegistry(
                        'https://315727832121.dkr.ecr.us-east-1.amazonaws.com',
                        'ecr:us-east-1:aws-ecr-cred') {
                            docker.image("${USER}:${VER_ID}").push("latest")
                            docker.image("${USER}:${VER_ID}").push("${VER_ID}_${SHORT_COMMIT}")
                            }
                }
            }
        }

        // Deployment Step
        stage('DEPLOYMENT') {
            when {
                branch 'master'
            }
            steps {
                echo '-> --> ---> -----> --------> -------------> --------------------->- Deployment Running...'
                sh "kubectl apply -f ns_dotnet.yaml"
                sh "kubectl get namespaces"
                // sh "sed -i s/latest/${VER_ID}_${SHORT_COMMIT}/g depl_dotnet.yaml"
                sh "kubectl apply -f depl_dotnet.yaml"
                sh "kubectl get all -n ecovalciuc-dotnet-prod"
                sh "kubectl describe deployment -n ecovalciuc-dotnet-prod"
            }
        }
    }
    // CleanUP Step
    post {
        always {
            echo '-> --> ---> -----> --------> -------------> --------------------->- CleanUP...'
            // cleanWs()
            sh 'docker images -a | grep -e "sec" -e "min"'
            sh 'docker system prune -f --filter "label=project=ecovalciuc-bookscatalog"'
            sh 'docker rmi ${USER}:${VER_ID}'
            sh 'docker rmi ${ECR_REPO}/${USER}:latest'
            sh 'docker rmi ${ECR_REPO}/${USER}:${VER_ID}_${SHORT_COMMIT}'
            sh 'docker images -a | grep -e "hours"'
        }
    }
}
