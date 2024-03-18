# Kep38_infra
Kep38 Infra repository

1

Подключения к someinternalhost в одну команду ssh -J appuser@158.160.33.140 appuser@10.128.0.26

2

Для подключениея по алиасу someinternalhost, добавляю конфигурацию в файл ~/.ssh/config:

Host someinternalhost
  HostName 10.128.0.26
  User appuser
  ProxyJump appuser@1158.160.33.140

3

добавление сертификата через nip.io:

    Создал SSL-сертификат с помощью Certbot
    sudo certbot certonly --standalone -d 158.160.33.140.nip.io
    сгенерировал для doname_name  158.160.33.140.nip.io
    подключение к серверу через web по адресу 158.160.33.140.nip.io.
    
4
bastion_IP = 158.160.33.140
someinternalhost_IP = 10.128.0.26
