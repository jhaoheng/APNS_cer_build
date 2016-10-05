#!/bin/bash
#!/usr/bin/expect

source ./checkFile.sh

status=$(fileStatus)
echo $status
IFS='+' read -a status_array <<< "$status"

if [[ ${status_array[0]} == true ]]; then
    if [[ ${status_array[2]} == dev ]]; then
        path=drawer/${status_array[1]}/dev
        openssl x509 -in ./$path/develop.cer -inform der -out ./$path/develop.pem
        openssl pkcs12 -nocerts -out ./$path/developKey.pem -in ./$path/developKey.p12
        cat ./$path/develop.pem ./$path/developKey.pem > ./$path/apns_dev.pem
    else
        path=drawer/${status_array[1]}/pro
        openssl x509 -in ./$path/pro.cer -inform der -out ./$path/pro.pem
        openssl pkcs12 -nocerts -out ./$path/proKey.pem -in ./$path/proKey.p12
        cat ./$path/pro.pem ./$path/proKey.pem > ./$path/apns_pro.pem
    fi
fi
