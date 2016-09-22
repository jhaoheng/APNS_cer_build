#!/bin/bash

function print_cmd (){
        echo ""
        echo "+++"
        echo "The cmd is :"
        # echo $cmd
        echo "\033[1;32m $cmd \033[0m"
        echo "+++"
        echo ""
        echo "."
        echo ".."
        echo "..."
}

# 詢問是否建立 pem 或者 直接執行測試
echo ""
echo ""
echo "************************"
echo "1. Create 'PEM' ..."
echo "2. openssl, use dev to connect APNS(return code = 0 or 20,success)"
echo "3. openssl, use pro to connect APNS(return code = 0 or 20,success)"
echo "4. Test your computer to connect APNS, the channel is working"
echo "5. If you don't know how to create 'APNS certificate', check out!(website)"
echo "6. Troubleshooting Push Notifications(website)"
echo "7. Create curl HTTP/2 cmd"
echo ""
read -p "Insert number : " selected

# 選擇路徑位置
echo "==========="
if [[ $selected == 1 || $selected == 2 || $selected == 3 || $selected == 7 ]]; then
    ls -al ./drawer
    echo ""
    echo "Please select you product path...."
    read -p "floder is : " filePath

    echo "=================="
    echo "you choice floder is : "$filePath
    echo "=================="

    if [[ $selected == 1 || $selected == 7 ]]; then
        echo ""
        echo "Please choice you want to create mode:(dev or pro)"
        read -p "Mode is dev/pro : " mode

        if [[ $selected == 1 ]]; then
            source export_pem_2.sh

        elif [[ $selected == 7 ]]; then
            read -p "bundle id is : " bundleid

            path=drawer/$filePath/$mode
            if [[ $mode == 'dev' ]]; then
                url='https://api.development.push.apple.com/3/device'
            else 
                url='https://api.push.apple.com/3/device'
            fi

            read -p "token is : " token
            cmd="curl -d '{\"aps\":{\"alert\":\"hi\",\"sound\":\"default\"}}' --cert ./$path/apns_$mode.pem --http2 $url/$token -H \"apns-topic: $bundleid\""
            print_cmd cmd
            echo "\033[1;33m===>Please use this cmd to push message \033[0m"
        fi

    elif [[ $selected == 2 || $selected == 3 ]]; then
        if [[ $selected == 2 ]]; then
            path=drawer/$filePath/dev
            # cmd="openssl s_client -connect gateway.sandbox.push.apple.com:2195 -cert ./$path/develop.pem -key ./$path/developKey.pem"
            
            cmd="openssl s_client -connect api.development.push.apple.com:443 -cert ./$path/apns_dev.pem"
        elif [[ $selected == 3 ]]; then
            path=drawer/$filePath/pro
            # cmd="openssl s_client -connect gateway.push.apple.com:2195 -cert ./$path/pro.pem -key ./$path/proKey.pem"
            
            cmd="openssl s_client -connect api.push.apple.com:443 -cert ./$path/apns_pro.pem"
        fi
        print_cmd cmd
        sleep 1 | $cmd
    fi

elif [[ $selected == 4 ]]
then
    cmd="telnet 1-courier.push.apple.com 5223"
    print_cmd cmd
    sleep 2 | $cmd

    cmd="telnet gateway.sandbox.push.apple.com 2195"
    print_cmd cmd
    sleep 2 | $cmd

    cmd="telnet gateway.push.apple.com 2195"
    print_cmd cmd
    sleep 2 | $cmd

elif [[ $selected == 5 ]]
then
    open https://developer.apple.com/library/ios/documentation/IDEs/Conceptual/AppDistributionGuide/AddingCapabilities/AddingCapabilities.html#//apple_ref/doc/uid/TP40012582-CH26-SW11

elif [[ $selected == 6 ]]
then
    open https://developer.apple.com/library/ios/technotes/tn2265/_index.html#//apple_ref/doc/uid/DTS40010376
fi

echo ""
echo ""
echo "Finish..."


