FROM atlassian/default-image:4.20230308 as main

# Download and install compiled terraform cli binary
RUN wget https://releases.hashicorp.com/terraform/1.4.2/terraform_1.4.2_linux_amd64.zip
RUN unzip terraform_1.4.2_linux_amd64.zip && cp terraform /usr/local/bin/
RUN terraform version



# Install ansible
RUN apt-get update && \
  apt-get install -y gcc python3-dev libkrb5-dev && \
  apt-get install python3-pip -y && \
  pip3 install --upgrade pip && \
  pip3 install --upgrade virtualenv && \
  pip3 install ansible

# Install ssh pass 
RUN apt-get install sshpass

# Add linsync to bin 
COPY linsync-1.0.1-alpha/linsync /usr/local/bin/

WORKDIR /opt/atlassian/build
ENTRYPOINT ["/bin/bash"]
