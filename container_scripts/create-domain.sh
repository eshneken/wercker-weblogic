# Auto generate Oracle WebLogic Server admin password
#ADMIN_PASSWORD=$(date| md5sum | fold -w 8 | head -n 1)
ADMIN_PASSWORD="welcome1"

sed -i -e "s|ADMIN_PASSWORD|$ADMIN_PASSWORD|g" /u01/oracle/create-wls-domain.py

# Create an empty domain
wlst.sh -skipWLSModuleScanning /u01/oracle/create-wls-domain.py
mkdir -p ${DOMAIN_HOME}/servers/AdminServer/security/
echo "username=weblogic" > /u01/oracle/user_projects/domains/$DOMAIN_NAME/servers/AdminServer/security/boot.properties
echo "password=$ADMIN_PASSWORD" >> /u01/oracle/user_projects/domains/$DOMAIN_NAME/servers/AdminServer/security/boot.properties
${DOMAIN_HOME}/bin/setDomainEnv.sh
