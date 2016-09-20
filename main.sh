#!/bin/bash

# 詢問是否建立 pem 或者 直接執行測試
echo ""
echo "Create bt MAX HU 20160201"
echo "Please confirm the 'package' file:"
echo "./main.sh"
echo "./export_pem.sh"
echo "./checkFile.sh"
echo "./drawer/<your product folder>/dev/"
echo "./drawer/<your product folder>/pro/"
echo "Put your cer/key on '<your product folder>/dev/' or '<your product folder>/pro/', FIRST"
echo ""
echo "************************"
echo "1. Create 'PEM' from dev/ or pro/..."
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
    read -p "file path is : " filePath

    echo "=================="
    echo "you choice path is : "$filePath
    echo "=================="

    if [[ $selected == 1 ]]; then
        echo ""
        echo "Please choice you want to create mode:(dev or pro)"
        read -p "Mode is : " mode
        source export_pem.sh

    elif [[ $selected == 2 ]]; then
        path=drawer/$filePath/dev
        echo $path
	cmd="openssl s_client -connect gateway.sandbox.push.apple.com:2195 -cert ./$path/develop.pem -key ./$path/developKey.pem"
	echo $cmd
        sleep 2 | openssl s_client -connect gateway.sandbox.push.apple.com:2195 -cert ./$path/develop.pem -key ./$path/developKey.pem
    elif [[ $selected == 3 ]]; then
        path=drawer/$filePath/pro
        sleep 2 | openssl s_client -connect gateway.push.apple.com:2195 -cert ./$path/pro.pem -key ./$path/proKey.pem
    fi

elif [[ $selected == 4 ]]
then
    sleep 2 | telnet gateway.sandbox.push.apple.com 2195

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
