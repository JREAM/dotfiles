#!/bin/bash
### Set Language
TEXTDOMAIN=virtualhost

### Set default parameters
action=$1
domain=$2
rootDir=$3
owner=$(who am i | awk '{print $1}')
sitesEnable='/etc/nginx/sites-enabled/'
sitesAvailable='/etc/nginx/sites-available/'
userDir='/var/www/'

if [ "$(whoami)" != 'root' ]; then
	echo $"You have no permission to run $0 as non-root user. Use sudo"
		exit 1;
fi

if [ "$action" != 'create' ] && [ "$action" != 'delete' ]
	then
		echo $"You need to prompt for action (create or delete) -- Lower-case only"
		exit 1;
fi

while [ "$domain" == "" ]
do
	echo -e $"Please provide domain. e.g.dev,staging"
	read domain
done

if [ "$rootDir" == "" ]; then
	rootDir=${domain//./}
fi

### if root dir starts with '/', don't use /var/www as default starting point
if [[ "$rootDir" =~ ^/ ]]; then
	userDir=''
fi

rootDir=$userDir$rootDir

if [ "$action" == 'create' ]
	then
		### check if domain already exists
		if [ -e $sitesAvailable$domain ]; then
			echo -e $"This domain already exists.\nPlease Try Another one"
			exit;
		fi

		### check if directory exists or not
		if ! [ -d $userDir$rootDir ]; then
			### create the directory
			mkdir $userDir$rootDir
			### give permission to root dir
			chmod 755 $userDir$rootDir
			### write test file in the new domain dir
			if ! echo "<?php echo phpinfo(); ?>" > $userDir$rootDir/phpinfo.php
				then
					echo $"ERROR: Not able to write in file $userDir/$rootDir/phpinfo.php. Please check permissions."
					exit;
			else
					echo $"Added content to $userDir$rootDir/phpinfo.php."
			fi
		fi

		### create virtual host rules file
		if ! echo $TEMPLATE_NGINX > $sitesAvailable$domain
		then
			echo -e $"There is an ERROR create $domain file"
			exit;
		else
			echo -e $"\nNew Virtual Host Created\n"
		fi

		### Add domain in /etc/hosts
		if ! echo "127.0.0.1	$domain" >> /etc/hosts
			then
				echo $"ERROR: Not able write in /etc/hosts"
				exit;
		else
				echo -e $"Host added to /etc/hosts file \n"
		fi

        ### Add domain in /mnt/c/Windows/System32/drivers/etc/hosts (Windows Subsytem for Linux)
		if [ -e /mnt/c/Windows/System32/drivers/etc/hosts ]
		then
			if ! echo -e "\r127.0.0.1       $domain" >> /mnt/c/Windows/System32/drivers/etc/hosts
			then
				echo $"ERROR: Not able to write in /mnt/c/Windows/System32/drivers/etc/hosts (Hint: Try running Bash as administrator)"
			else
				echo -e $"Host added to /mnt/c/Windows/System32/drivers/etc/hosts file \n"
			fi
		fi

		if [ "$owner" == "" ]; then
			chown -R $(whoami):www-data $userDir$rootDir
		else
			chown -R $owner:www-data $userDir$rootDir
		fi

		### enable website
		ln -s $sitesAvailable$domain $sitesEnable$domain

		### restart Nginx
		service nginx restart

		### show the finished message
		echo -e $"Complete! \nYou now have a new Virtual Host \nYour new host is: http://$domain \nAnd its located at $userDir$rootDir"
		exit;
	else
		### check whether domain already exists
		if ! [ -e $sitesAvailable$domain ]; then
			echo -e $"This domain dont exists.\nPlease Try Another one"
			exit;
		else
			### Delete domain in /etc/hosts
			newhost=${domain//./\\.}
			sed -i "/$newhost/d" /etc/hosts

			### Delete domain in /mnt/c/Windows/System32/drivers/etc/hosts (Windows Subsytem for Linux)
			if [ -e /mnt/c/Windows/System32/drivers/etc/hosts ]
			then
				newhost=${domain//./\\.}
				sed -i "/$newhost/d" /mnt/c/Windows/System32/drivers/etc/hosts
			fi

			### disable website
			rm $sitesEnable$domain

			### restart Nginx
			service nginx restart

			### Delete virtual host rules files
			rm $sitesAvailable$domain
		fi

		### check if directory exists or not
		if [ -d $userDir$rootDir ]; then
			echo -e $"Delete host root directory ? (s/n)"
			read deldir

			if [ "$deldir" == 's' -o "$deldir" == 'S' ]; then
				### Delete the directory
				rm -rf $userDir$rootDir
				echo -e $"Directory deleted"
			else
				echo -e $"Host directory conserved"
			fi
		else
			echo -e $"Host directory not found. Ignored"
		fi

		### show the finished message
		echo -e $"Complete!\nYou just removed Virtual Host $domain"
		exit 0;
fi

$TEMPLATE_NGINX = "
  server {
    server_name www.$domain;
    return 301 \$scheme://$domain.com\$request_uri;
  }

  }
  server {
    server_name           $domain;
    listen                80;
    root                  $userDir$rootDir;
    index                 index.php index.html index.htm;

    charset               utf-8;
    client_max_body_size  100M;
    fastcgi_read_timeout  1800;

    # Catch All
    error_page 404        /index.php;

    # Serve Static Files Directly
    location ~* \.(jpg|jpeg|gif|svg|css|png|js|ico|html|ttf|woff|otf|eot)$ {
      access_log          off;
      log_not_found       off;
      expires             max;
    }

    # Removes Trailing Slashes
    # @note: Prevents SEO duplicate content
    if (!-d \$request_filename) {
      rewrite ^/(.+)/\$ /\$1 permanent;
    }

    # Unless the Request is for a Valid Static File (above: image, js, css, etc.)
    # Then Send to Site Bootstrap
    if (!-e \$request_filename) {
      rewrite ^/(.*)\$ /index.php?/\$1 last;
      break;
    }

    # Remove Trailing 'index' from all Controllers
    if (\$request_uri ~* index/?\$) {
      rewrite ^/(.*)/index/?\$ /\$1 permanent;
    }

    location ~ \.php$ {
      fastcgi_split_path_info ^(.+\.php)(/.+)\$;
      fastcgi_pass        unix:/var/run/php/php7.2-fpm.sock;
      fastcgi_index       index.php;
      include             fastcgi_params;

      fastcgi_param       PATH_INFO         \$fastcgi_path_info;
      fastcgi_param       SCRIPT_FILENAME   \$document_root\$fastcgi_script_name;
    }

    location ~ /\.ht {
      deny          all;
    }

  }
"
