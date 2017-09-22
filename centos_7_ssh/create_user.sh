#!/bin/bash

__create_user() {
# Create a user to SSH into as.
useradd dockeruser
SSH_USERPASS=SuperS3cr3t
echo -e "$SSH_USERPASS\n$SSH_USERPASS" | (passwd --stdin dockeruser)
echo ssh dockeruser password: $SSH_USERPASS
usermod -aG wheel dockeruser

}

# Call all functions
__create_user
