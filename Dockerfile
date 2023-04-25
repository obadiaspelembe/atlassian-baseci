FROM atlassian/default-image:4.20230308 as main

# Download and install compiled terraform cli binary
RUN wget https://releases.hashicorp.com/terraform/1.4.2/terraform_1.4.2_linux_amd64.zip
RUN unzip terraform_1.4.2_linux_amd64.zip && cp terraform /usr/local/bin/
RUN terraform version

# FROM golang:1.15 as builder
# # Download linsync
# RUN wget https://github.com/obadiaspelembe/linsync/archive/refs/tags/v1.0.1-alpha.zip
# RUN unzip v1.0.1-alpha.zip
# RUN cd linsync-1.0.1-alpha
# # Install dependencies and build
# RUN go install
# RUN go build
# Add linsync to bin 
# COPY linsync /usr/local/bin/

WORKDIR /opt/atlassian/build
ENTRYPOINT ["/bin/bash"]
