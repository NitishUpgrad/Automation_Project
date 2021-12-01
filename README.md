Task 2:

Note : Please get into sudo mode by command "sudo su" before running the script"

automation.sh script is added with following steps :

1. To apt update -y 
2. Checking if apache isntalled, if not installing it
3. CHecking if apache is runnning, if not starting the service
4. Checking if apache is enabled or not, if not enabling the service
5. Compressing the file with right name and moving in right folder
6. Moving compressed file for s3 bucket



Task 3:
1. Updating above script so that we log every entry we make in s3 for our book keeping
2. Scheduling a cron job so that this service is trigger automatically after 1 day at 00:00
