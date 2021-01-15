# Anisble playbook to automate security features without breaking functionality

## This playbooks serves as basis for other playbooks in this repo

## Things to do...

- [ ] install Lynis and run as cronjob

- [ ] generate random password for non root user apon playbook execution

- [ ] generate random ssh port number apon playbook execution

- [ ] have ansible change ssh port number during playbook execution and use that port number until playbook finishes        

- [ ] install veracrypt and create automount and generate random passwords for encrypted contianers

- [ ] run bleachbit as cron job (maybe) or bleach certain parts of ubuntu with an Ansible task (automatic)

- [ ] make sure all developmet languages in common role are ready to use out of the box (no sourcing .bashrc or .profile)


useful commands....

Ansisble gather facts

```
ansible -m setup all -i ../../../Ansible-Inventory/localhosts 
```
Ansible Ping

```
ansible all -m ping -i ../../../Ansible-Inventory/localhosts 
```

run complete Ansible playbook with vault encryption and path to password file set path accordingly

```
ansible-playbook provision.yml --vault-password-file=/home/$USER/ansible-PASSWORDS/MYPASSWORD.txt -i hosts -u root 
```

run ansible playbook with tags

```
ansible-playbook provision.yml --vault-password-file=/home/$USER/ansible-PASSWORDS/MYPASSWORD.txt --tags "tag1,tag2,etc" -i hosts -u root 

ansible-playbook provision.yml --vault-password-file=/home/$USER/ansible-PASSWORDS/MYPASSWORD.txt --tags "tag1,tag2,etc" -i ../../../Ansible-Inventory/hosts
```

run ansible start at a certain task
```
ansible-playbook provision.yml --vault-password-file=/home/$USER/ansible-PASSWORDS/MYPASSWORD.txt --start-at-task="This is the task name" -i hosts -u root

ansible-playbook provision.yml --vault-password-file=/home/$USER/ansible-PASSWORDS/MYPASSWORD.txt --start-at-task="This is the task name" 
```
