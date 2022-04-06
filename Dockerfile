FROM debian
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install ssh wget git unzip screen -y
RUN mkdir /run/sshd 
RUN echo 'wget -O install.sh https://github.com/ycj1379/bthua/raw/main/bt.sh && bash install.sh' >>/iy.sh
RUN echo 'rm -f /www/server/panel/data/admin_path.pl' >>/iy.sh
RUN echo '/usr/sbin/sshd -D' >>/iy.sh
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:iceyear|chpasswd
RUN chmod 755 /iy.sh
EXPOSE 8888
CMD  /iy.sh
