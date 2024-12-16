#!/bin/bash
ip_addr=$(ip addr show ens33 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)
echo "Die IP-Adresse ist: $ip_addr"
fourth_octet=$(echo $ip_addr | cut -d '.' -f 4)
new_octet=$(( ($fourth_octet & 128) | 2 ))
proxy_ip_addr=$(echo $ip_addr | sed "s/\(.*\.\)$fourth_octet/\1$new_octet/")

echo "Proxy-Adresse: $proxy_ip_addr"

if [ ! -f /etc/apt/apt.conf.d/80-proxy ]; then
	echo "Acquire::http::Proxy \"http://$proxy_ip_addr:3128\";" | sudo tee -a /etc/apt/apt.conf.d/80-proxy
	echo "Acquire::https::Proxy \"http://$proxy_ip_addr:3128\";" | sudo tee -a /etc/apt/apt.conf.d/80-proxy
else
	echo "Proxy-Datei ist schon vorhanden"
fi
#
# Feste Proxykonfiguation für alle Nutzer
if ! grep -q "^export http_proxy=" /etc/environment; then
	echo "export http_proxy=http://$proxy_ip_addr:3128" | sudo tee -a  /etc/environment
else
	echo "http_proxy ist schon in /etc/environment konfiguriert"
fi

if ! grep -q "^export https_proxy=" /etc/environment; then
	echo "export https_proxy=http://$proxy_ip_addr:3128" | sudo tee -a /etc/environment
else
	echo "https_proxy ist schon in /etc/environment konfiguriert"
fi

if ! grep -q "^export no_proxy" /etc/environment; then
	echo "export no_proxy=\"localhost,127.0.0.1,::1\"" | sudo tee -a /etc/environment
else
	echo "no_proxy ist schon in /etc/environment konfiguriert"
fi
#
# Für Snap
sudo snap set system proxy.http="http://$proxy_ip_addr:3128"
sudo snap set system proxy.https="http://$proxy_ip_addr:3128"
