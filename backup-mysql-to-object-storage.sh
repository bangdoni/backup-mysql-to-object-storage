#!/bin/bash

current_date=`date +"%d-%b-%Y"`

# temporary folder
temporary_folder='/your/temporary/path'


# object storage
bucket_name=bucket-name
object_url=${bucket_name}'.ap-south-1.linodeobjects.com' #example
access_key=''
secret_key=''

# mysql
mysql_host='localhost'
mysql_port=3306
mysql_user='user'
mysql_password='password'

# create directory by date
mkdir -p ${temporary_folder}/${current_date}

# generate list of database
mysql -u ${mysql_user} -h ${mysql_host} -p${mysql_password} -Bse 'show databases' > databaselist.txt

cat databaselist.txt | while read line
do
	db_name=$line
		if [ $line != "information_schema" ] ;
		then

			mysqldump --skip-lock-tables -u ${mysql_user} -h ${mysql_host} -P ${mysql_port} -p${mysql_password} ${db_name} | gzip > ${temporary_folder}/${current_date}/${db_name}-${current_date}.sql.gz

		fi
done

# sync to object storage
s3cmd sync --server-side-encryption ${temporary_folder}/${current_date} s3://${bucket_name}/

# remove a temporary folder
rm -rf ${temporary_folder}
