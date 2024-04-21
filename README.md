# Kep38_infra
Kep38 Infra repository
#ДЗ №3
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


bastion_IP = 158.160.33.140
someinternalhost_IP = 10.128.0.26
#ДЗ №4
testapp_IP = 178.154.220.195 testapp_port = 9292
Для автоматического развертывания ВМ в облаке запускаем скрипт create-reddit.sh.

yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --metadata-from-file user-data=/home/remi/.ssh/user-data.yaml

