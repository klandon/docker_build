#Create by Kristopher Landon
#Base centos7 building for use mainly in Jenkins

FROM centos:centos7
MAINTAINER The CentOS Project <cloud-ops@centos.org>

RUN yum -y update; yum clean all
RUN yum -y install openssh-server passwd sudo wget; yum clean all
ADD ./create_user.sh /create_user.sh
RUN mkdir /var/run/sshd

#set root level access perms
RUN sed -i -e 's~^# %wheel\tALL=(ALL)\tALL~%wheel\tALL=(ALL) ALL~g' -e 's~\(.*\) requiretty$~#\1requiretty~' /etc/sudoers
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''


#user creation
RUN chmod 755 /create_user.sh
RUN ./create_user.sh

# Install Oracle Java8
ENV JAVA_VERSION 8u60
ENV JAVA_BUILD 8u60-b27

RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" \
 http://download.oracle.com/otn-pub/java/jdk/${JAVA_BUILD}/jdk-${JAVA_VERSION}-linux-x64.tar.gz && \
 tar -xvf jdk-${JAVA_VERSION}-linux-x64.tar.gz && \
 rm jdk*.tar.gz && \
 mv jdk* ${JAVA_HOME}

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

#network
EXPOSE 22

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
