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
gcloud projects create $gcpprojectname --name $gcpprojectname
export CURRENT_GCP_PROJECT_REPO="github_saketh_ramanujam_$gcpprojectname"
gcloud config set project $gcpprojectname
gcloud config list
#folder configs
cd projectname
git init
git remote add origin https://github.com/sakethramanujam/$projectname
