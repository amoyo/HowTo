#Bluetoth raspberry pi Pulseaudio

* Utilise le profil bluetooth A2DP (Advanced Audio Distribution Profile)


## Installation des paquets nécessaire

```
apt-get install alsa-utils bluez bluez-tools pulseaudio-module-bluetooth python-gobject python-gobject-2
```

* bluez pour la gestion du bluetooth

## Ajout des droits nécessaire à l'utilisateur pi pour manipuler le bluetooth

```bash
sudo usermod -a -G lp pi
```

## Configuration bluetooth par default
```bash
sudo vim /etc/bluetooth/audio.conf
```

Modifier la ligne dans la section general
```bash
Enable=Source,Sink,Media,Socket
```

> Le nom du peripherique bluetooth est configurable dans `/etc/bluetooth/main.conf`
> La classe du bluetooth est aussi configurable dans ce fichier

```shell
sudo vim /etc/pulse/daemon.conf
resample-method = trivial
```

## Afficher la configuration des carte bluetooth
```bash
hciconfig -a
```

## Scan des peripherique bluetooth
```bash
hcitool scan
```

## Ping sur le protocole bluetooth
```bash
l2ping XX:XX:XX:XX:XX:XX
```

Connexion bluetooth vers un peripherique
```bash
hcitool cc XX:XX:XX:XX:XX:XX
```

## Rendre le bleutooth visible
```bash
hciconfig hci0 piscan
```

La ligne "UP RUNNING PSCAN ISCAN" permet de savoir si `iscan` est activé

La raspberry est maintenant connectable en bluetooth

Il est possible de configurer la connexion bluetooth avec la raspberry
```bash
bluez-simple-agent
```


```shell
$ bluetoothctl

agent on
default-agent
discoverable on
scan on

hciconfig hci0 class 0x200420
```
