
# wanted
將 .sh -> command 再進行測試

# readme

一切都為了簡化 APNS 憑證，建立的問題  
因 php/python 需用 .pem 來與 APNS 進行驗證  
故利用簡易的 menu 來透過 openssl 將 .p12 -> .pem  
And you can test your pem to connect APNS for vertificate.

## Must do FIRST

- 在 ```./drawer/``` 下，建立 ```<productNmae folder>```，just like 
	- ```./drawer/sample/dev/``` : sandbox , development cer / p12 
	- ```./drawer/sample/pro/``` : production , cer / p12
- You can reference ```./drawer/sample``` folder.

## Feature

1. 根據分類的專案，來進行 pem 憑證的建立
2. 根據 sandbox pem 的建立後，進行 openssl 的測試連接
3. 根據 production pem 的建立後，進行 openssl 的測試連接
4. Test your computer to connect APNS, the channel is working
5. If you don't know how to create 'APNS certificate', check out!(website)
6. Troubleshooting Push Notifications(website)

## How to work

1. do it ```bash main.sh```
