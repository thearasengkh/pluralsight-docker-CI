FROM centos:centos6

MAINTAINER nigelpoulton@hotmail.com

# Enable EPEL for Node.js
# RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

RUN yum -y install epel-release

# Install Node...
RUN yum install -y nodejs
RUN yum install -y npm

# Set npm strict ssl to false
RUN npm config set strict-ssl false

# Copy app to /src
COPY . /src

# Install app and dependencies into /src
RUN cd /src; npm install

EXPOSE 8080

CMD cd /src && node ./app.js