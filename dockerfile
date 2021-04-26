FROM tomcat:8

#Take the war and copy to webaaps of tomcat
COPY target/*.war /usr/local/tomcat/webapps/
