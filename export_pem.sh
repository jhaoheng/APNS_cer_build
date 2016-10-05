#!/bin/bash
#!/usr/bin/expect

source ./checkFile.sh

status=$(fileStatus)
# echo $status
IFS='+' read -a status_array <<< "$status"

if [[ ${status_array[0]} == true ]]; then
    if [[ ${status_array[2]} == dev ]]; then
        path=drawer/${status_array[1]}/dev

        cmd="openssl pkcs12 -in ./$path/developKey.p12 -out ./$path/apns_dev.pem -nodes -clcerts"
        print_cmd
        $( $cmd )
    else
        path=drawer/${status_array[1]}/pro

        cmd="openssl pkcs12 -in ./$path/proKey.p12 -out ./$path/apns_pro.pem -nodes -clcerts"
        print_cmd
        $( $cmd )
    fi
fi