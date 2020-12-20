pipeline {
    agent any 
    environment {
      PATH = "${PATH}:${getTerraformPath()}"
    }
    stages{
      stage('S3 Create Bucket'){
          steps{
              script{
                  createS3Bucket('cloudiartest123')
              }
          }
      }
      stage('terraform init and apply - dev'){
        steps{
          sh label: '', returnStatus: true, script: 'terraform workspace new dev'
          sh "terraform init"
          sh "terraform apply -var-file=dev.tfvars --auto-approve"

        }
    }
    stage('terraform init and apply - prod'){
        steps{
          sh label: '', returnStatus: true, script: 'terraform workspace new prod'
          sh "terraform init"
          sh "terraform apply -var-file=prod.tfvars --auto-approve" 
        }
    }
}
}
def getTerraformPath(){
    def tfHome = tool name: 'terraform-14', type: 'terraform'
    return tfHome
}
def createS3Bucket(bucketName){
    sh returnStatus: true, script: "aws s3 mb s3://${bucketName} --region us-east-1"
}



