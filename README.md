# Useful First-Steps

For PVE bash lovers

## Steps

- Update and Upgrade
- Install neovim
- Install git
- Configure git
- Install oh my bash

## Ease of Use

- Combined in one shell script `setup.sh`

## Content of setup.sh Script

```sh
#!/bin/bash

# Check if both username and email are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <username> <email>"
    exit 1
fi

echo "===== Setup for Customization of Proxmox ====="

apt-get update
apt-get -y upgrade
apt-get -y install neovim git

# Set Git global configuration
git config --global user.name "$1"
git config --global user.email "$2"

# Display the updated Git global configuration
echo "Git global configuration updated:"
echo "User Name: $(git config --global user.name)"
echo "User Email: $(git config --global user.email)"

echo "Instsalling color theme: oh my bash"
bash -c "$(wget https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)"
```


