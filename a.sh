cd /var/lib/jenkins/workspace/linux36-job1/ 
tar czvf code.tar.gz index.html 
scp code.tar.gz www@192.168.7.105:/data/tomcat/tomcat_appdir/
scp code.tar.gz www@192.168.7.106:/data/tomcat/tomcat_appdir/

ssh www@192.168.7.105 "/etc/init.d/tomcat  stop && rm -rf /data/tomcat/tomcat_webdir/myapp/* && cd /data/tomcat/tomcat_appdir &&  tar xvf code.tar.gz  -C /data/tomcat/tomcat_webdir/myapp/"
ssh www@192.168.7.106 "/etc/init.d/tomcat  stop && rm -rf /data/tomcat/tomcat_webdir/myapp/* && cd /data/tomcat/tomcat_appdir && tar xvf code.tar.gz  -C /data/tomcat/tomcat_webdir/myapp/"


ssh www@192.168.7.105 "/etc/init.d/tomcat  start"
ssh www@192.168.7.106 "/etc/init.d/tomcat  start"

