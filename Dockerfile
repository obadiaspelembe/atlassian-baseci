FROM atlassian/default-image:4.20230308 as main-img

# Download and install compiled terraform cli binary
RUN wget https://releases.hashicorp.com/terraform/1.4.2/terraform_1.4.2_linux_amd64.zip
RUN unzip terraform_1.4.2_linux_amd64.zip && cp terraform /usr/local/bin/
RUN terraform version

WORKDIR /opt/atlassian/build
ENTRYPOINT ["/bin/bash"]
