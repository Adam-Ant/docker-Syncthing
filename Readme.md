#SyncThing
A dockerfile to run SyncThing. It expects a  partition to store data mapped to /home/syncthing/.config/syncthing in the container, and a volume where your synced folders are stored at /home/syncthing/volumes. Enjoy!

Thjis repo also includes an example docker-compose file to use with this repo.
##Example run command
/docker run -d --restart=always --name SyncThing -v /volumes:/home/syncthing/volumes -v /opt/syncthing:/home/syncthing/.config/syncthing -p 8384:8384 -p 22000:22000 -p 21027:21027/udp adamant/syncthing