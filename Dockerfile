FROM java:openjdk-7-jre 




COPY /utils/ /target/utils/





RUN mkdir /target/tomcat.8080 && \

mkdir /target/tomcat.8080/webapps && \
mkdir /MYPERSDATA && \
chgrp -R 0 /target && \
chmod -R g=u /target && \
chgrp -R 0 /MYPERSDATA && \
chmod -R g=u /MYPERSDATA && \
chmod g=u /etc/passwd && \

chmod a+x /target/utils/fixuser && \
/target/utils/fixuser


ENV WAR_INI_WGET_URL=https://raw.githubusercontent.com/webjframework/webj/master


#RUN wget -c -N $WAR_INI_WGET_URL/WebJ.war  -P /target/utils/ && \
#wget -c -N $WAR_INI_WGET_URL/webjdata.ini  -P /target/utils/ && \
#cp /target/utils/*.ini /target/tomcat.8080/webapps





EXPOSE 8080


USER 10001


CMD wget -c -N $WAR_INI_WGET_URL/WebJ.war  -P /target/utils/ ;wget -c -N $WAR_INI_WGET_URL/webjdata.ini  -P /target/utils/;cp /target/utils/*.ini /target/tomcat.8080/webapps; java  -Xmx300m -Xss512k -Dfile.encoding=UTF-8  -jar /target/utils/webapp-runner.jar --port 8080 --expanded-dir-name WEBJ --expand-war /target/utils/WebJ.war

