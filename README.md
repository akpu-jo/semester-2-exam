# semester-2-exam
# Deploying Laravel app on a Vagrant cluster
 This project is completed as part of altschool end of semester exermination project

 ## Initializing the VM
 The project uses a Master and Slave architecture. The master node contains the application's source code while the slave node is configured to manage the scripts and monitor server uptime

 ## Installation
 Clone the github repository into a folder
 Ensure Vagrant and Virtualbox is installed and running on your machine

 In the terminal run
```cd vagrant```
 ```vagrant up```

 This should initialise the VMs and clone the laravel app from https://github.com/laravel/laravel

 The app should now be running on *192.168.56.20*
 ![image](https://github.com/akpu-jo/semester-2-exam/assets/63398509/52d9fc28-04d1-4338-b40c-10e591372035)


 ## Slave setup
 To access the slave machine run
 
 ```cd vagrant```
 ```vagrant ssh slave```

 make sure you are in the vagrant folder before running the vagrant comands
 Once in the slave machine, configure the ssh to communicate with the master node, run the following comands

 ```ssh-keygen```
 This should generate an ssh key.To copy the key into the master node run the comand below

 ```ssh-copy-id vagrant@192.168.56.20```
 when prompted, type `yes` 
 The password has been included in the submitted link as part of the applications credentials.

 ## Running Ansible playbooks
 The slave node is cofigured to run 2 ansible playbooks, one to check server uptime and the other to run the masterscript.sh

 ### Monitoring server Uptime
 In the slave node cd into etc/ansible

 ```cd /etc/ansible```
 ```ansible-playbook uptime.yml -i inventory```

 This should activate the cronjob for checking uptime every 12 hours. the output of the checks are recoreded in a file; uptime.log which can be found in the vagrant folder.
 ![image](https://github.com/akpu-jo/semester-2-exam/assets/63398509/b30e0a2d-058a-4afc-84f1-a3312b605099)


 ### Running the Masterscript
 From the slave node it is possible to run the masterscript.sh which will setup the LAMP server and clone the github repository NB: this step is done automatically when the project was innitialized

 from the slave node

 ```cd /etc/ansible```
 ```ansible-playbook playbook.yml -i inventory```

 
