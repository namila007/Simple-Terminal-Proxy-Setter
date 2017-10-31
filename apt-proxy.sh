#!/bin/bash
#clear

if [[ "$(whoami)" != "root" ]];then
	echo -e "run in sudo mode"
	exit 1
fi 


updatefile(){

	#cat << EOT >> /etc/apt/apt.conf

	echo -e ""http://cachex.pdn.ac.lk:3128";" >> /etc/apt/apt.conf
	echo -e ""https://cachex.pdn.ac.lk:3128";" >> /etc/apt/apt.conf
	echo -e "Acquire::http::Proxy "http://cachex.pdn.ac.lk:3128";">> /etc/apt/apt.conf
	echo -e "Acquire::https::Proxy "http://cachex.pdn.ac.lk:3128";" >> /etc/apt/apt.conf
	
}	

removelines(){
	sed -i '/"http://cachex.pdn.ac.lk:3128"/d' /etc/apt/apt.conf
	sed -i '/"https://cachex.pdn.ac.lk:3128"/d' /etc/apt/apt.conf
	sed -i '/Acquire::http::Proxy "http://cachex.pdn.ac.lk:3128"/d' /etc/apt/apt.conf
	sed -i '/Acquire::https::Proxy "http://cachex.pdn.ac.lk:3128"/d' /etc/apt/apt.conf
}

HELP(){
	echo -e "Help: to add proxy settings run apt-proxy.sh -p "
	echo -e "Help: to remove proxy settings run apt-proxy.sh -up "
}
#update
if [[ $1 == "-p" ]]; then
	removelines
	updatefile
	echo -e "/etc/apt/apt.conf file were updated"
	exit 0
elif [[ $1 == "-up" ]]; then
	removelines
	echo -e "/etc/apt/apt.conf file were updated"
	exit 0
else
	HELP
	exit 1
fi

