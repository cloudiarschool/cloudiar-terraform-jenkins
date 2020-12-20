pipeline {
    agent any 
    environment {
      PATH = "${PATH}:${getTerraformPath()}:${getAnsiblePath()}"

    }
    stages{
      stage('S3 Create Bucket'){
          steps{
              sh "ansible-playbook s3-bucket.yml"
          }
      }
      stage('terraform init and apply - dev'){
        steps{
          sh "terraform init"
          sh label: '', returnStatus: true, script: 'terraform workspace new dev'
          sh "terraform apply -var-file=dev.tfvars --auto-approve"

        }
    }
    stage('terraform init and apply - prod'){
        steps{
          sh "terraform init"
          sh label: '', returnStatus: true, script: 'terraform workspace new prod'
          sh "terraform apply -var-file=prod.tfvars --auto-approve" 
        }
    }
}
}
def getTerraformPath(){
    def tfHome = tool name: 'terraform-14', type: 'terraform'
    return tfHome
}
def getAnsiblePath(){
    def ansHome = ansiblePlaybook installation: 'ansible', playbook: ''
    return ansHome
}



