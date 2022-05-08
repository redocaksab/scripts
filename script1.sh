
#!/bin/bash
#Script which checks that some service is running, if not starts it.

echo -e "\nChecking if cron.service is running...\n"

if status=$(systemctl status cron.service)
then
echo -e  "\033[32mCron.service is running!\033[0m"
else
     echo -e  "\033[31mCron.service is not running\033[0m"
     read -p "Do you want to start Cron.service?(Type yes or no) " answer
     case $answer in
        yes) echo -e  "\033[32mStarting Cron.Service ...\033[0m"
                   start=$(systemctl start cron.service)
             echo -e "Cron.service has been started";;
        no) echo "Ok(((!";;
     esac
fi




