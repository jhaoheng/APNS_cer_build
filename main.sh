#!/bin/bash

function print_cmd (){
        echo ""
        echo "+++"
        echo "The cmd is :" $cmd
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
echo ""
read -p "Insert number : " selected

# 選擇路徑位置
echo "==========="
if [[ $selected == 1 || $selected == 2 || $selected == 3 ]]; then
    ls -al ./drawer
    echo ""
    echo "Please select you product path...."
    read -p "floder is : " filePath

    echo "=================="
    echo "you choice floder is : "$filePath
    echo "=================="

    if [[ $selected == 1 ]]; then
        echo ""
        echo "Please choice you want to create mode:(dev or pro)"
        read -p "Mode is : " mode
        source export_pem.sh

    elif [[ $selected == 2 || $selected == 3 ]]; then
        if [[ $selected == 2 ]]; then
            path=drawer/$filePath/dev
            cmd="openssl s_client -connect gateway.sandbox.push.apple.com:2195 -cert ./$path/develop.pem -key ./$path/developKey.pem"
        elif [[ $selected == 3 ]]; then
            path=drawer/$filePath/pro
            cmd="openssl s_client -connect gateway.push.apple.com:2195 -cert ./$path/pro.pem -key ./$path/proKey.pem"
        fi
        print_cmd cmd
        sleep 2 | $cmd
    fi

elif [[ $selected == 4 ]]
then
    cmd="telnet gateway.sandbox.push.apple.com 2195"
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


