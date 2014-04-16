#!/bin/bash
set -e
echo "Installing Koppelpunt ${deployed.name}"
cd ${deployed.configDir}
find ${deployed.configDir} -type f  -printf '%P\n' |
while read f
do
  echo "Processing $f"
  encoded=`base64 $f`
  request="<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\"><soapenv:Body><dp:request xmlns:dp=\"http://www.datapower.com/schemas/management\" domain=\"${deployed.container.name}\"><dp:set-file name=\"local:///ilf-properties/$f\">$encoded</dp:set-file></dp:request></soapenv:Body></soapenv:Envelope>"
  curl -s -S -k -u ${deployed.container.username}:${deployed.container.password} -d "$request" ${deployed.container.managementUrl} -o result.xml
  echo "DataPower says:"
  xmllint --format result.xml
  grep "OK" result.xml
done
