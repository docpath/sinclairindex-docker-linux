#!/bin/bash

sinclairdb_file='/usr/local/docpath/sinclair_pack/sinclair_index/configuration/dpsinclair-db.xml'
database_host="${DP_DB_HOST}"
database_port="${DP_DB_PORT}"
database_user="${DP_DB_USER}"
database_pass="${DP_DB_PASS}"
database_name="${DP_DB_NAME}"

echo '<?xml version="1.0" encoding="UTF-8"?><configurations>  <activeDatabaseId>1</activeDatabaseId><database id="1">' >> "$sinclairdb_file"
echo "<databaseHost>$database_host</databaseHost>" >> "$sinclairdb_file"  
echo '<databaseWinAuth>false</databaseWinAuth>' >> "$sinclairdb_file"
echo "<databasePort>$database_port</databasePort>" >> "$sinclairdb_file" 
echo '<databaseType>MySQL</databaseType>' >> "$sinclairdb_file"
echo "<databaseUser>$database_user</databaseUser>" >> "$sinclairdb_file"
echo "<databasePass>$database_pass</databasePass>" >> "$sinclairdb_file"
echo "<databaseName>$database_name</databaseName>" >> "$sinclairdb_file"
echo '</database></configurations>' >> "$sinclairdb_file"

cat /usr/local/docpath/sinclair_pack/sinclair_index/configuration/dpsinclair-db.xml

cd /usr/local/docpath/licenseserver/licenseserver/Bin
./startServer.sh

cd /usr/local/docpath/sinclair_pack/sinclair_index
exec java -jar dpsinclairindex.war
