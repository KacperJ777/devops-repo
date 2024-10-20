FROM quay.io/centos/centos:stream9

# Update and install necessary packages, including openssh-server and python3-pip
RUN yum -y update && \
    yum -y install openssh-server python3 python3-pip && \
    yum clean all

# Add a remote user and set up SSH key-based authentication
RUN useradd remote_user && \
    echo "remote_user:1234" | chpasswd && \
    mkdir -p /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh && \
    chown remote_user:remote_user /home/remote_user/.ssh

# Copy the public key into the authorized_keys file for SSH access
COPY remote-key.pub /home/remote_user/.ssh/authorized_keys
RUN chown remote_user:remote_user /home/remote_user/.ssh/authorized_keys && \
    chmod 600 /home/remote_user/.ssh/authorized_keys

# Generate SSH host keys if they don't exist and clean yum caches
RUN ssh-keygen -A && \
    yum clean all

# Install MySQL and the AWS CLI using pip
RUN yum -y install mysql && \
    pip3 install awscli --upgrade

# Expose SSH port and start the SSH server
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
