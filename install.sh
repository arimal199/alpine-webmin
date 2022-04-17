mkdir -p /etc/rc.d/init.d/
cat <<EOF |  /opt/webmin-1.990/setup.sh
/etc/webmin
/var/log/webmin
/usr/bin/perl
83
ES4.0
10000
admin
admin
admin
n
y
EOF
cat <<EOF |  tee /etc/init.d/webmin
#!/sbin/openrc-run
WEBMIN=/etc/rc.d/init.d/webmin
start() { \${WEBMIN} start; }
stop() { \${WEBMIN} start; }
EOF
chmod a+x /etc/init.d/webmin

rc-update add webmin
rc-service webmin start