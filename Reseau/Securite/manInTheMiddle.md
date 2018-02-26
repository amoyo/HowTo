# Introduction

L'attaque de l'homme du millieu (Man in the middle) consiste a une interface de se placer discretement dans une connection entre deux terminaux.

Cette attaque peut avoir comme consequence que l'homme du milleu intercepte et modifie les messages echangés entre les deux terminaux victimes

# Faiblesse

L'attaque de l'homme du millieu est réaliser grâce a une "faiblesse" du protocol ARP, en effet celui-ci n'est pas un protocole en mode connecté. C'est a dire que une machine n'a pas besoins d'etablir une connection avec une autre pour peupler sa table. Donc la table se met a jour dés qu'une requete ARP est reçue.

Les enregistrement ARP n'ont pas une durée de vie longue, les requêtes ARP doivent donc être envoyé regulierement.

# Éxploitation

## Scénario
Jack est l'homme du millieu<br>
Bob envoie un message a Alice

L'éxploitatio de cette faiblesse consiste a envoyé regulierement des requetes ARP avec l'assotiation <IP Cible> <@Mac ManInTheMidle> au victimes
* IP Cible : Adresse IP de la victime
	* IP de Bob si la requete est envoyé a Alice (et vice versa)
* @Mac     : Adresse MAC de l'homme du millieu
	* @MAC de Jack

Ainsi Jack recevra alors le message emit par Bob

# En pratique

## Logiciels
* dsniff : Outil et ensemble d'outils permettant le sniffing de paquets
	* arpspoof : Utilisé pour le ARP Spoofing (éxploitation ARP)


## Attaque

```bash
arpspoof -t <IP Victime> <IP a usurper>
```
* -t : Cible

Activation du forwarding de paquets
```bash
sudo sysctl -w net.ipv4.ip_forward=1
```

## Petit plus
* mitmproxy : Proxy http.
	* `mitmproxy -T -p 8080` lancement du proxy sur le port 8080
	* Configuration de la redirection du traffic
	```bash
	sudo iptables -t nat -A PREROUTING -p tcp --destination-port 80 -j REDIRECT --to-port 8080
	```
* ssltrip : Coupure protocolaire du SSL/TLS (HTTPS)

# Solution

* `arpalert` peut prévenir de ce genre d'attaque
* Configurer l'enregistrement ARP de la passerelle dans les terminaux en statique
```bash
arp -s <IP_PASSERELLE> <@MAC>
```
