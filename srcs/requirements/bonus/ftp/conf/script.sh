#! /bin/bash

service vsftpd start

useradd -m -s /bin/bash "$FTP_USER"

echo "$FTP_USER:$FTP_PASSWORD" | /usr/sbin/chpasswd

mkdir -p /var/ftp

chown -R $FTP_USER /var/ftp

chmod -R 755 /var/ftp

cp /etc/vsftpd.conf /etc/vsftpd.conf.bak

echo "listen=YES
local_enable=YES
write_enable=YES
local_umask=022
dirmessage_enable=YES
use_localtime=YES
xferlog_enable=YES
connect_from_port_20=YES
chroot_local_user=NO
secure_chroot_dir=/var/run/vsftpd/empty
pam_service_name=vsftpd
pasv_enable=Yes
pasv_min_port=30000
pasv_max_port=30009
user_sub_token=$USER1
local_root=/var/ftp
userlist_enable=YES
userlist_file=/etc/vsftpduserlist.conf
userlist_deny=NO" > /etc/vsftpd.conf

echo "$FTP_USER" > /etc/vsftpduserlist.conf

service vsftpd stop

exec vsftpd 