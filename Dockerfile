# pull the official base image
FROM centos:7

# set work directory
WORKDIR /app
COPY . /app
RUN yum install -y curl unzip ansible\
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && yum install -y yum-utils \
    && yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo \
    && yum -y install packer

CMD ["/bin/bash"]
