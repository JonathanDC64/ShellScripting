
# Vagrant

## To download and store a box (OS) to your system

```bash
vagrant box add jasonc/centos7
```

## To initialize Vagrant projects (jasonc/centos is repo name on vagrant)

```bash
vagrant init jasonc/centos7
```

# To import the box into VirtualBox and start it

```bash
vagrant up # Will start all vagrant vms

vagrant up --provider virtualbox

vagrant up [VM_NAME] # VM_NAME is the one defined in the Vagrantfile
```

## To connect to vagrant vm via ssh

```bash
vagrant ssh # Works if there is a single vm
vagrant ssh [VM_NAME] # Default user: vagrant  password: vagrant (same for root account)

exit # To exit ssh
```

## To stop vm

```bash
vagrant halt # Halt all vms

vagrant halt [VM_NAME] # Halt specified vm
```

## to suspend vagrant vm

```bash
vagrant suspend [VM_NAME]
```

## To resume Vagrant vm

```bash
vagrant resume [VM_NAME]
```

## Check status of vm

```bash
vagrant status
```

## To delete a VM

```bash
vagrant destroy [VM_NAME]
```

## Vagrant file example

```vagrant
Vagrant.configure(2) do |config|
    config.vm.box = "jason/centos7"                     # Which OS to install
    config.vm.hostname = "linuxsvr1"                    # Hostname of the VM
    config.vm.network "private_network", ip: "10.2.3.4" # Assign static ip to VM
    config.vm.provider "virtualbox" do |vb|             # Which virtualization software to use
        vb.gui = true                                   # Whether to use headless mode (no GUI only command line) or not
        vm.memory = "1024"                              # How much memory to allocate to vm
    end
    config.vm.provision "shell"/, path: "setup.sh"      # Provisioning allows you to automatically install software (Uploads setup.sh to vm and executes it)
end
```
