FROM centos

MAINTAINER rns@rnstech.com

RUN yum update -y
RUN yum -y install java
RUN java -version

RUN mkdir /opt/tomcat/

WORKDIR /opt
RUN curl -O http://archive.apache.org/dist/tomcat/tomcat-7/v7.0.61/bin/apache-tomcat-7.0.61.tar.gz
RUN tar xzvf apache-tomcat-7.0.61.tar.gz  -C /opt/
RUN cp -R /opt/apache-tomcat-7.0.61/ /opt/tomcat/

WORKDIR /opt/tomcat/apache-tomcat-7.0.61/webapps
COPY target/webapp.war .

EXPOSE 8080

ENTRYPOINT ["/opt/tomcat/apache-tomcat-7.0.61/bin/catalina.sh", "run"]
