#  Spring Boot vs AWS Elastic Beanstalk

Ensure you have installed the latest version of the AWS CLI and Docker. For more information, see the ECR documentation.

1 - Retrieve the login command to use to authenticate your Docker client to your registry.
Use AWS Tools for PowerShell:
 
  Invoke-Expression -Command (Get-ECRLoginCommand -Region us-east-2).Command

2 - Build your Docker image using the following command. For information on building a Docker file from scratch see the instructions here. You can skip this step if your image is already built:

   docker build -t fargate .

3 - After the build completes, tag your image so you can push the image to this repository:

   docker tag fargate:latest 138219537298.dkr.ecr.us-east-2.amazonaws.com/fargate:latest

4 - Run the following command to push this image to your newly created AWS repository:

   docker push 138219537298.dkr.ecr.us-east-2.amazonaws.com/fargate:latest