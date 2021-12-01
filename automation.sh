#getting in sudo mode
#sudo su
#Adding variables
name="nitish"
s3_bucket="upgrad-"$name

# Step 1
apt update -y

# Step 2 - checking if apache 2 is installed or not and if not installing it
isApacheInstalled=$(apt list -a apache2 | grep "installed" | wc -l)
if [ $isApacheInstalled -lt 1 ]
then
        echo "Installing apache2"
        apt install apache2
else
        echo "apache2 was installed"
fi

# Step 3 - Checking if apache 2 is running or not
isApacheRunning=$(service apache2 status | grep 'active (running)' | wc -l)
if [ $isApacheRunning -gt 0 ]
then
        echo "apache2 is running"
else
        echo "Starting apache2"
        service apache2 start
fi


# Step 4 - Checking if apache 2 is enabled or not
isApacheEnabled=$(systemctl is-enabled apache2)
if [ $isApacheEnabled == "enabled" ]
then
        echo "apache2 is enabled"
else
        echo "Enabling apache2"
        systemctl enable apache2
fi

# Step 5 - Compressing the file in tar and adding to required folder with required name
timestamp=$(date '+%d%m%Y-%H%M%S')
filename=$name"-httpd-logs-"$timestamp".tar"
tar -cvf $filename --absolute-names /var/log/apache2/*.log
#extracting file size
fileSize=$(ls -lh $filename | cut -d " " -f5)

mv $filename /tmp/
# Step 6 - Copying logs to S3 bucket
aws s3 cp /tmp/$filename s3://$s3_bucket/$filename

#Check if inventory.html is presnt and create if not there otherwise append the data
isInventory=$(ls /var/www/html/ | grep "inventory" | wc -l)
data="httpd-logs\t\t$timestamp\t\ttar\t\t$fileSize\n"
if [ $isInventory == 0 ]
then
	printf "Log Type\t\tDate Created\t\tType\t\tSize\n">/var/www/html/inventory.html
	printf $data>>/var/www/html/inventory.html
else
	printf $data>>/var/www/html/inventory.html
fi

#check if we have a cron job or not other wise schedule it
cronJob=$(ls /etc/cron.d/ | grep "automation" |wc -l)
if [ $cronJob -ge 1 ]
then
	echo "Cron Job is present"
else
	echo "Adding Cron Job"
	echo "0 0 * * * root /root/Automation_Project/automation.sh">/etc/cron.d/automation
fi
