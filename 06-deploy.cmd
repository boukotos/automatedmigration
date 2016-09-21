del D:\Software\apache-tomcat-7.0.70\webapps\canon-1.7.war 
copy D:\automatedmigration\Canon\canon-j2ee\target\canon-j2ee.war D:\Software\apache-tomcat-7.0.70\webapps\canon-1.7.war
rmdir /q /S D:\Software\apache-tomcat-7.0.70\webapps\canon-1.7
call starts.bat tomcat7
cd D:\automatedmigration
