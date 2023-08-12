@Library('my-shared-library') _

pipeline{

    agent any

    parameters{

        choice(name: 'action', choices: 'create\ndelete', description: 'Choose create/Destroy')
        string(name: 'ImageName', defaultValue: 'java_app', description: 'name of Docker build ')
        string(name: 'ImageTag', defaultValue: 'v1', description: 'tag of Docker build ')
        string(name: 'DockerHubUser', defaultValue: 'allan1804', description: 'name of Application ')



    }

    stages{
         
        stage('Git Checkout'){
                    when { expression {  params.action == 'create' } }
            steps{
            gitCheckout(
                branch: "main",
                url: "https://github.com/Allanrodriques/java_app.git"
            )
            }
        }
         stage('Unit Test maven'){
         
         when { expression {  params.action == 'create' } }

            steps{
               script{
                   
                   mvnTest()
               }
            }
        }
         stage('Integration Test maven'){
         when { expression {  params.action == 'create' } }
            steps{
               script{
                   
                   mvnIntegrationTest()
               }
            }
        }
        stage('Static code analysis: Sonarqube'){
         when { expression {  params.action == 'create' } }
            steps{
               script{
                   
                   def SonarQubecredentialsId = 'updated-api'
                   staticCodeAnalysis(SonarQubecredentialsId)
                }
            }
        }
        stage('Quality Gate Status Check: Sonarqube'){
         when { expression {  params.action == 'create' } }
            steps{
               script{
                   
                   def SonarQubecredentialsId = 'updated-api'
                   QualityGateStatus(SonarQubecredentialsId)
                }
            }
        }
        stage('Maven Build : maven'){
         when { expression {  params.action == 'create' } }
            steps{
               script{
                   mvnBuild()
               }
            }
        }
        stage('Docker Image Build'){
         when { expression {  params.action == 'create' } }
            steps{
               script{
                   
                   dockerBuild("${params.ImageName}","${params.ImageTag}", "${params.DockerHubUser}")
               }
            }
        }
        stage('Docker Image Scan: Trivy'){
         when { expression {  params.action == 'create' } }
            steps{
               script{
                   
                   dockerImageScan("${params.ImageName}","${params.ImageTag}", "${params.DockerHubUser}")
               }
            }
        }
        stage('Docker Image Push: Dockehub'){
         when { expression {  params.action == 'create' } }
            steps{
               script{
                   
                   dockerImagePush("${params.ImageName}","${params.ImageTag}", "${params.DockerHubUser}")
               }
            }
        }
        stage('Docker Image Cleanup: Dockehub'){
         when { expression {  params.action == 'create' } }
            steps{
               script{
                   
                   dockerImageCleanup("${params.ImageName}","${params.ImageTag}", "${params.DockerHubUser}")
               }
            }
        }


    } 
}  

