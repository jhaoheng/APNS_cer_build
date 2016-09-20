# readme

一切都為了簡化 APNS 憑證，建立的問題  
因 php/python 需用 .pem 來與 APNS 進行驗證  
故利用簡易的 menu 來透過 openssl 將 .p12 -> .pem  
And you can test your pem to connect APNS for vertificate.

## info

Please confirm the 'package' file:
./main.sh
./export_pem.sh
./checkFile.sh
./drawer/<your product folder>/dev/
./drawer/<your product folder>/pro/

## How to use

1. 專案環境建立，可參考 /drawer/sample 檔案內容
	1. 在 `drawer/`，建立 [專案名稱]
	2. 在 [專案名稱] 下，建立 dev 與 pro 資料夾
	3. 在 dev / pro 放入檔案
		- develop.cer : from develop center, download **SSL Certificate** file from **Push Notifications**
		- developKey.p12 : from keychain, output **p12** file from **Apple Developemnt IOS Push Service: [bundle_id]**
2. 開啟 cmd，執行 `sh main.sh`
3. 選擇 2 : **Create 'PEM'**
	1. 輸入專案名稱
	2. 輸入 dev 或 pem

## How to TEST the created PEM

1. `sh main.sh`
2. 選擇 2(dev) or 3(pro)
3. SSL 訊息，**Verify return code: 0 (ok)** 代表成功

	```
	New, TLSv1/SSLv3, Cipher is AES256-SHA
	Server public key is 2048 bit
	Secure Renegotiation IS supported
	Compression: NONE
	Expansion: NONE
	SSL-Session:
	    Protocol  : TLSv1
	    Cipher    : AES256-SHA
	    Session-ID: 
	    Session-ID-ctx: 
	    Master-Key: 7A242B475AF0CFF21BA3FA375A0F3BA1C54ACC497848668ABEDBCF728E1BE525FD27FB6AA11DA82918AC7D83206588F0
	    Key-Arg   : None
	    Start Time: 1474354169
	    Timeout   : 300 (sec)
	    Verify return code: 0 (ok)
	---
	```

## Feature

1. 根據分類的專案，來進行 pem 憑證的建立
2. 根據 sandbox pem 的建立後，進行 openssl 的測試連接
3. 根據 production pem 的建立後，進行 openssl 的測試連接
4. Test your computer to connect APNS, the channel is working
5. If you don't know how to create 'APNS certificate', check out!(website)
6. Troubleshooting Push Notifications(website)

## new 

無需用兩張憑證合併
直接用 `openssl pkcs12 -in apns-dev-cert.p12 -out apns-dev-cert.pem -nodes -clcerts`
openssl pkcs12 -in demo.p12 -out demo.pem -nodes -clcerts