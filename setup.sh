
function install_prerequisites() {
    sudo yum install -y jq
    sudo yum install -y wget
}

# Function to check if Terraform is installed already, if not, then download and installed the version of Terraform as required.
function install_terraform() {
    # Sticking to Terraform v1.1.7 as it was used for the development of this code-base
    TERRAFORM_VERSION="1.1.7"

    # Check if terraform is already installed and display the version of terraform as installed
    [[ -f ${HOME}/bin/terraform ]] && echo "`${HOME}/bin/terraform version` already installed at ${HOME}/bin/terraform" && return 0

    TERRAFORM_DOWNLOAD_URL=$(curl -sL https://releases.hashicorp.com/terraform/index.json | jq -r '.versions[].builds[].url' | egrep 'linux.*amd64' | egrep "${TERRAFORM_VERSION}" | egrep -v 'rc|beta|alpha')
    TERRAFORM_DOWNLOAD_FILE=$(basename $TERRAFORM_DOWNLOAD_URL)

    echo "Downloading Terraform v$TERRAFORM_VERSION from '$TERRAFORM_DOWNLOAD_URL'"

    # Download and install Terraform v1.1.7 as that is the version used for the development of this code-base.
    # TODO: Once Base and Ceiling versions have been validated, the code here will be modified to download the Ceiling version of terraform as required by the scripts in this code-base.
    mkdir -p ${HOME}/bin/ && cd ${HOME}/bin/ && wget $TERRAFORM_DOWNLOAD_URL && unzip $TERRAFORM_DOWNLOAD_FILE && rm $TERRAFORM_DOWNLOAD_FILE

    # Display an confirmation of the successful installation of Terraform.
    echo "Installed: `${HOME}/bin/terraform version`"
}

function install_kubectl() {
    # We will use Kubectl v1.23.0 because we faced some issues with using the latest version (v1.24.0).
    KUBECTL_VERSION="1.23.0"

    # Check if kubectl is already installed and display the version as installed.
    [[ -f ${HOME}/bin/kubectl ]] && echo "kubectl is already installed at ${HOME}/bin/kubectl" && return 0

    KUBECTL_DOWNLOAD_URL="https://dl.k8s.io/release/v$KUBECTL_VERSION/bin/linux/amd64/kubectl"

    echo "Downloading Kubectl v$KUBECTL_VERSION from '$KUBECTL_DOWNLOAD_URL'"

    # Download and install kubectl v1.23.0, move it to the bin folder
    mkdir -p ${HOME}/bin/ && cd ${HOME}/bin/ && curl -LO $KUBECTL_DOWNLOAD_URL && chmod +x kubectl
}

function install_aws_iam_authenticator() {
    # Using whatever was the latest stable version at the time of development.
    AWS_IAM_AUTH_VERSION="1.21.2"

    # Check if aws-iam-authenticator is already installed and display the version as installed.
    [[ -f ${HOME}/bin/aws-iam-authenticator ]] && echo "aws-iam-authenticator is already installed at ${HOME}/bin/aws-iam-authenticator" && return 0

    AWS_IAM_AUTH_DOWNLOAD_URL="https://s3.us-west-2.amazonaws.com/amazon-eks/$AWS_IAM_AUTH_VERSION/2021-07-05/bin/linux/amd64/aws-iam-authenticator"

    # Download and install aws-iam-authenticator v1.21.2, move it to the bin folder
    mkdir -p ${HOME}/bin/ && cd ${HOME}/bin/ && curl -o aws-iam-authenticator $AWS_IAM_AUTH_DOWNLOAD_URL && chmod +x aws-iam-authenticator
}

function deploy_panorama() {
    cd "${HOME}/lab-aws-zero-trust/terraform/panorama"

    # Initialize terraform
    echo "Initializing directory for lab resource deployment"
    terraform init

    # Deploy resources
    echo "Deploying Panorama Resources required for Palo Alto Networks Reference Architecture for Zero Trust with VM-Series on AWS"
    terraform apply -auto-approve

    if [ $? -eq 0 ]; then
        echo "Panorama for AWS Zero Trust Reference Architecture with VM-Series Lab Deployment Completed successfully!"
    else
        echo "Panorama for AWS Zero Trust Reference Architecture with VM-Series Lab Deployment Failed!"
        exit 1
    fi
}

function deploy_vmseries_lab() {
    # Assuming that this setup script is being run from the cloned github repo, changing the current working directory to one from where Terraform will deploy the lab resources.
    cd "${HOME}/lab-aws-zero-trust/terraform/vmseries"

    # Initialize terraform
    echo "Initializing directory for lab resource deployment"
    terraform init

    # Deploy resources
    echo "Deploying Resources required for Palo Alto Networks Reference Architecture for Zero Trust with VM-Series on AWS"
    terraform apply -auto-approve

    if [ $? -eq 0 ]; then
        echo "AWS Zero Trust Reference Architecture with VM-Series Lab Deployment Completed successfully!"
    else
        echo "AWS Zero Trust Reference Architecture with VM-Series Lab Deployment Failed!"
        exit 1
    fi
}

function deploy_cnseries_lab() {

    # Assuming that this setup script is being run from the cloned github repo, changing the current working directory to one from where Terraform will deploy the lab resources.
    cd "${HOME}/lab-aws-zero-trust/terraform/cnseries"

    # Initialize terraform
    echo "Initializing directory for lab resource deployment"
    terraform init

    # Deploy resources
    echo "Deploying Resources required for Palo Alto Networks Reference Architecture for Zero Trust with CN-Series on AWS"
    terraform apply -auto-approve

    if [ $? -eq 0 ]; then
        echo "AWS Zero Trust Reference Architecture with CN-Series Lab Deployment Completed successfully!"
    else
        echo "AWS Zero Trust Reference Architecture with CN-Series Lab Deployment Failed!"
        echo "Please try updating the kubeconfig and run setup again. Check the Lab Guide for more details."
        exit 1
    fi
}

install_prerequisites
install_terraform
deploy_panorama

# TODO: Need to improve this area
if [ $# -gt 0 ]
then
    if [ $1 == "vm" ]
    then
        deploy_vmseries_lab
    elif [ $1 == "cn" ]
    then
        install_kubectl
        install_aws_iam_authenticator
        deploy_cnseries_lab
    else
        echo "Bad argument!"
    fi
else
    # Deploy VM-Series lab if no argument is provided.
    deploy_vmseries_lab
fi