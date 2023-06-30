#! /bin/sh

if [ $# != 1 ]
then
    echo "usage: $(basename $0) clean|migrate" 1>&2
    exit 1
fi

case $1 in
    clean)
	action=flyway:clean
	;;
    migrate)
	action=flyway:migrate
	;;
    *)
	echo "action is clean or migrate, nothing else." 1>&2
	exit 1
esac
    
server=localhost
userID=flyway_user
[ "$server" = "localhost" ] && key="MySQL/local" || key=$server
password=$(pass Database/$key/$userID)

url="jdbc:mysql://$server:3306/blazarusermanagement?useSSL=true"

mvn -Dflyway.url="$url" -Dflyway.user="$userID" -Dflyway.password="$password" -Dflyway.sqlMigrationPrefix=DBR -Dflyway.locations=filesystem:`pwd` -Dflyway.cleanDisabled=false -Dflyway.table=schema_version $action

