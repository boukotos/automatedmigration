cd pearlchain
set JAVA_HOME=C:\Program Files\Java\jdk1.8.0_91
call "D:\automatedmigration\apache-maven-3.3.3\bin\mvn" -T 1C clean install -DskipTests=true -Pcore-modules
cd ..
cd canon
set JAVA_HOME=C:\Program Files\Java\jdk1.8.0_91
call "D:\automatedmigration\apache-maven-3.3.3\bin\mvn" -T 1C clean install -DskipTests=true
cd ..
