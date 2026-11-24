FROM tomcat:10.1-jdk17
ENV JAVA_OPTS="-Xmx350m -Xms128m"
RUN rm -rf /usr/local/tomcat/webapps/*
COPY target/web-pendaftaran-jsp.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]