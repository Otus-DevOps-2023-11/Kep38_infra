# Kep38_infra
Kep38 Infra repository

1

Подключения к someinternalhost в одну команду ssh -J appuser@178.154.221.218 appuser@10.128.0.4

2

Для подключениея по алиасу someinternalhost, добавляю конфигурацию в файл ~/.ssh/config:

Host someinternalhost
  HostName 10.128.0.4
  User appuser
  ProxyJump appuser@178.154.221.218

3

добавление сертификата через nip.io:

    Создал SSL-сертификат с помощью Certbot
    sudo certbot certonly --standalone -d 178.154.221.218.nip.io
    сгенерировал для doname_name  178.154.221.218.nip.io
    подключение к серверу через web по адресу 178.154.221.218.nip.io.
    
4
bastion_IP = 178.154.221.218
someinternalhost_IP = 10.128.0.4
