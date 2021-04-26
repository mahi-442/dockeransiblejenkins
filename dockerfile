FROM tomcat:8

#Take the war and copy to webaaps of tomcat
COPY target/*.war /opt/tomcat8/webapps/
