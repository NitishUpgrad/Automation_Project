Problem Statement (Task 2)
Subtask Details
You have been assigned to write an automation bash script named ‘automation.sh’ to perform the following subtasks. 

(Hint: Running ./automation.sh with root privileges must do the following listed tasks.)

 

Your Script Should 
Perform an update of the package details and the package list at the start of the script.
sudo apt update -y
 

Install the apache2 package if it is not already installed. (The dpkg and apt commands are used to check the installation of the packages.)
Ensure that the apache2 service is running. 
Ensure that the apache2 service is enabled. (The systemctl or service commands are used to check if the services are enabled and running. Enabling apache2 as a service ensures that it runs as soon as our machine reboots. It is a daemon process that runs in the background.)
Create a tar archive of apache2 access logs and error logs that are present in the /var/log/apache2/ directory and place the tar into the /tmp/ directory. Create a tar of only the .log files (for example access.log) and not any other file type (For example: .zip and .tar) that are already present in the /var/log/apache2/ directory. The name of tar archive should have following format:  <your _name>-httpd-logs-<timestamp>.tar. For example: Ritik-httpd-logs-01212021-101010.tar                                                             Hint : use timestamp=$(date '+%d%m%Y-%H%M%S') )
The script should run the AWS CLI command and copy the archive to the s3 bucket. 
  
Your script must have a variable with a value as the name of your s3-bucket at the start. Use that variable at all places where the s3 bucket is to be referred to in the script. In the same manner, your script must initialise a variable with your name. 
This project involves learning new concepts. So, you are encouraged to Google the commands and try out different things such as learn about cron job, services and commands like systemctl, dpkg and apt.
Place your script in '/root/Automation_Project/' directory.
Always run scripts with root privileges or first switch to the root user with sudo su and then run the scripts.

