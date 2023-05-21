FROM atlassian/default-image:4.20230308 as main

# Download and install compiled terraform cli binary
RUN wget https://releases.hashicorp.com/terraform/1.4.2/terraform_1.4.2_linux_amd64.zip
RUN unzip terraform_1.4.2_linux_amd64.zip && cp terraform /usr/local/bin/
RUN terraform version

# Install ansible
RUN apt update
RUN apt-add-repository --yes --update ppa:ansible/ansible
RUN apt install ansible

# Add linsync to bin 
COPY linsync-1.0.1-alpha/linsync /usr/local/bin/

WORKDIR /opt/atlassian/build
ENTRYPOINT ["/bin/bash"]
