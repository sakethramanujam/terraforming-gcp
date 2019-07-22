#!/bin/bash
echo "Enter the name for project[local]"
read projectname
export CURRENT_PROJECT_NAME=$projectname
mkdir -p $projectname
mkdir -p $projectname/terraform
cp terraform_setup/* $projectname/terraform
python3 $(pwd)/create_repo.py $projectname
echo "Enter name for project[gcp]"
read gcpprojectname
# create a new gcloud project
gcloud projects create $gcpprojectname --name $gcpprojectname
# export CURRENT_GCP_PROJECT_REPO="github_saketh_ramanujam_$gcpprojectname"
# set projectname to current config scope
gcloud config set project $gcpprojectname
# App Engine Initilization
gcloud app create --region=asia-south1
echo "Creating App Engine Application in Asia South-1[Mumbai]"
# display current config
gcloud config list
# enable billing on project
gcloud beta billing projects link $gcpprojectname --billing-account <BILLING-ACCOUNT-ID>
<<''
    Enable appengine,cloudbuild,cloudrun apis on the project
    $ gcloud services enable <api/service name>
    To see the list of services on current project use 
    $ gcloud services list
    To find available services use 
    $ gcloud services list --available
''
gcloud services enable appengine.googleapis.com
gcloud services enable cloudbuild.googleapis.com
gcloud services enable run.googleapis.com
gcloud services enable compute.googleapis.com
gcloud services enable stackdriver.googleapis.com

# getting project number from id
project_num=$(gcloud projects list --filter=$gcpprojectname --format="value(PROJECT_NUMBER)")


# Role assignment
gcloud projects add-iam-policy-binding $gcpprojectname --member \
serviceAccount:$project_num@cloudbuild.gserviceaccount.com --role roles/editor

gcloud projects add-iam-policy-binding $gcpprojectname --member \
serviceAccount:$project_num@cloudbuild.gserviceaccount.com --role roles/storage.admin

gcloud projects add-iam-policy-binding $gcpprojectname --member \
serviceAccount:$project_num@cloudbuild.gserviceaccount.com --role roles/appengine.appAdmin



#folder configs
cd projectname
git init
git remote add origin https://github.com/sakethramanujam/$projectname
