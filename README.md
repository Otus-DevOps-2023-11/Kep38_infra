#HW4
testapp_IP = 51.250.86.183 
testapp_port = 9292
Для автоматического развертывания ВМ в облаке запускаем скрипт create-reddit.sh.

yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --metadata-from-file user-data=/home/remi/.ssh/user-data.yaml

