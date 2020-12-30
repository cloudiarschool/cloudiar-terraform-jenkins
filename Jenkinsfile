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
          sh "terraform workspace select dev"
          sh "ansible-playbook ansterraform.yml"

        }
    }
    stage('terraform init and apply - prod'){
        steps{
          sh "terraform init"
          sh label: '', returnStatus: true, script: 'terraform workspace new prod'
          sh "terraform workspace select prod"
          sh "ansible-playbook ansterraform.yml" 
        }
    }
}
}
def getTerraformPath(){
    def tfHome = tool name: 'terraform-14', type: 'terraform'
    return tfHome
}

def getAnsiblePath() {
    def ansHome = tool name: 'ansible', type: 'org.jenkinsci.plugins.ansible.AnsibleInstallation'
    return ansHome
}