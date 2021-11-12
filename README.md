# Description
This script for backup your mysql database and then push top object storage like AWS S3, Linode Object Storage, etc. You can download and try the restore script from [this repository](https://github.com/bangdoni/import-mysql-from-object-storage-by-date).

## How to use

- Download from this repository
- Change permission. chmod 755 backup-mysql-to-object-storage.sh
- ./backup-mysql-to-object-storage.sh
- Done

### Configure
- bucket_name is name of your bucket, example: backup-database
- object_url is your object URL, example: '.ap-south-1.linodeobjects.com'
- access_key is access key from your provider
- secret_key is secret key from your provider
- mysql_host is your mysql host, example: 'localhost'
- mysql_port is your mysql port, example: 3306
- mysql_user is your mysql user, example: 'root'
- mysql_password is your mysql passowrd, example: 'password'

### Requirement
- s3cmd installed, you can found on [this link](https://s3tools.org/s3cmd).


## License

MIT

## Donate
If you feel happy with this tool, please donate me on 
[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/bangdoni)

