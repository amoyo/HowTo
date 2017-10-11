# Securité des accès et accès distants

## Mots de passe
C'est un systeme simple d'acces a une machine, il permet l'authentification. La dificulté d'un mot de passe est de trouver les caracteristique pour que le mot de passe soit bon.

* Le mot de passe doit etre > 8 (plus il y a de caractere plus il sera compliqué a craqué)
* Un mot de passe doit etre tapé vite
* Melanger les caractere (Chiffre, Speciaux, majuscule, Minuscule)
* Le mot de passe doit souvent changé
* Le mot de passe ne doit pas avoir de rapport avec l'utilisateur
* Le mot de passe ne doit pas contenir des mot du dictionaire
* Un mot de passe ne doit jamais etre ecrit ou communiqué

### Creation d'un mot de passe
Partir d'une phrase qui as du sens

` Le reseau Et la Plongé sont mes 2 passions ! `

En extraire les initial, remplacé des lettre par des chiffre, mettre des majuscule

` LrElPsM2p!`

Logiciel permetant de generé des mots de passe (libre) :
* pwgen
* crpg

## Connexion à distance securisé
### Quelque notions de Securité
#### Confidentialité
* Le rendre illisible, chiffré afin qu'il soit lisible que par ce qui sont autorisé
* Le message doit etre lisible uniquement par le destinataire
* Un message non-chiffré est un message clair (il est donc lisible par tous le monde)
* Une message chiffré est incomprensible par tous le monde, pour qu'il soit comprensible il faut le dechifrer

#### Authentification
* Permet de s'assurer l'identité d'une personne

#### La non-repudiation
* Mechanisme qui permet de signé (engagement)

#### L'integrité
* Permet de dire que les information sont conforme (falsification, modification)

### Comment garantir l'intégrité
#### La notion d'empreinte
C'est la maniere la plus simple de verifier l'intergrité d'un fichier a l'aide d'une empreinte. Il est realisé grâce un algorithme de hashage. L'algorithme extrait l'empreintre du fichier si des empreinte sont differente pour un meme fichier alors celui ci a etait modifié

L'empreinte sera trés differentes pour 2 fichiers semblable (forte dissemblance)

L'algorithme de hashaqe est a sens unique. Il est imposible de reconstitué les données

Les mot de passe sous linux sont stocké hashé. Pour testé le mot de passe, il teste juste le hash du mot de passe tapé avec le hash stocké

Rainbow table : Enorme tableau qui contient une grande grande quantité de hash differents qui permet notament les attaque en brut force

Algorithme de hashage :
* md5 (Message Digest 5)
	* 128 bits
* SHA ( Secure Hash Algorithm)
	* SHA1 160 Bits
	* SHA-512 512 Bits

#### Chiffré a l'aide d'un algorithme secret

Methode simple. Utilisation d'un language secret et connue par les personnes qui veulent l'utilisé.
Si une personne de malintentioné connais le language, il peut déchiffre tous les messages

* ** Message Clair **
	* `Voici mon message`
* ** Message Crypté **
	* ` icioV nom egassem `

Il est simple a mettre en place mais facile a dechiffré

#### Chiffré a l'aide d'un algorithme public et clé secrete

> Tous le monde connais l'algorithme mais "personne" connais la clé

L'algorithme est public mais le chiffrement est caracterisé par une clé

Une clé est une variable dans l'algorithme qui change le chiffrement

Alice envoie a bob un message chiffré a l'aide d'un algorithme public et d'une clé<br>
Bob reçois le message chiffré d'alice

Algorithme : lettre + n (n est la clé)

* ** Message clair **
	* Voici mon message
* ** Message chiffré **
	* clé = 2
		* ` yrlfl prq phvvdfh `
	* clé = 3
		* ` xxqkek oqp oguuicig `

##### Chiffrement sysmetrique
Le chiffrement et le dechiffrement utilise la meme clé

Elle est rapide (plus rapide que le chiffrement asymetrique)

* Elle ne permet que la confidentialité (pas l'authetification)
* Lors de l'envoie de la clé celle ci peut être intercepté
* Il faut un moyen securisé pour envoyé les clés
* Plus le nombre de participant augmente plus le nombre de clé a generé augmente ((N(N - 1)) / 2)

###### Algorithme de chiffrement sysmetrique
* DES
	* Data Encryption Standard
* 3DES
	* Triple DES
* AEZ
	* Advanced Encryption Standard
* Blowfish

##### Chiffrement asymetrique
Les clés sont par couple. Chaque personne as un couple clé privé/public.<br>
Les 2 clés fonctionne ensemble mais il est imposible de trouver la clé privé a partir de la clé public et vice versa. <br>
La clé privé doit resté secrete alors que la clé public peut etre connus de tous le monde.

Un message chiffré avec la clé public du corespondant peut etre uniquement dechiffré avec la clé privé <br>** (Confidentialité) **

Un message chiffré avec la clé privé peut etre uniquement dechiffré avec la clé privé<br>
** (Authentifiction + Confidentialité) **

##### Avantage
` Gestion et distribution des clés beaucoup plus aissés qu'avec le chiffrement symetrique`<br>
` Permet l'authentification et la non repondation `

##### Desavantage
` Le chiffrement est lent. Demande de nombreux calcul`

##### Algorithme
* RSA
* DSA (Digital Signature Algorithm)
* Diffic-Hellman

### Mélange les chiffrements
#### Echange sécurisé <br>Authentification + Confidentialité + Non-repudiation + Intégrité
Alice envoie un message a Bob :
* Hashage du message ** (Intégrité) **
* Chiffrement du hashage avec sa clé privé (Signature) ** (Authentification + non-repudation) **
* Chiffrement du message avec la clé public de Bob ** (Confidentialité) **
* Envoie du message chiffré et du hash signé a Bob

Bob reçois le message d'Alice
* Recois le message chiffré d'alice
	* Dechiffrement du messgae avec sa clé privé
* Recois l'empreinte du message signé
	* Dechiffremenet de l'empreinte avec la clé public d'Alice
- Verification de l'integrité du message

#### Echange de clés symetrique

Alice envoie la clé symetrique a Bob

* Hashage de la clé sysmetrique
* Signature de l'empreinte de la clé symetrique
* Chifrement symetrique de la clé symetrique avec la clé public de Bob
* Envoie a Bob de l'empreinte signé et de la clé symetrique chiffré

Bob recois la clé symetrique d'alice

* Dechiffrement de la clé symetrique avec a la clé privé de Bob
* Dechiffrement de l'empreinte signé d'alice de la clé symetrique (clé public Alice)
* Comparaison des empreinte des 2 clé

****
## Algorithme
* Lors du chiffrement, plus la taille  de la clé est importante plus il est dur a cassé mais le de/chiffrement est plus long.
* Contrainte en securite : Trouver le compromis entre securité et contrainte
Il existe des legislation pour le chiffrement, par exemple il est interdit de chiffré un * message en ~1024 bits
* Les algorithme sont géneralement basé sur des calcul de nombre premier
* Les algos utilise des methodes qu'un ordinateur a du mal a utilisé

## Certificat
* Il existe des organisme qui gere les clé privée. Il reference les clé public des entreprise. Lorsque qu'un navigateur va sur un site chiffré, il va recuperer la clé public * de l'entreprise grâce a un certificat
* C.A (Certifacate Authority) : Organisme de delivration de certificat
* Les C.A coute generalement cher mais il existe des C.A gratuit libre
* Les certificat reponde a la norme X509
* Les certificat sont révocable

## Accés distants
* SSL = SSH + TLS
* SSH = tunel chiffré d'envoie de données
* Le SSH ne se limite pas au terminal
* Le SSH est encapsulable dans d'autre protocole

## Notion cryptographique
* Un texte clair est un message que tous le monde peut interpréter
* Le résultat du chiffrement donne un texte chiffré (ou cryptogramme)
* L'action inverse s'appelle le dechiffrement, elle permet de restutuer le texte en clair
* Le decryptage consiste a retrouvé le message clair corespand au message chiffré sans la clé
* L'art de chiffrer et de dechiffrer s'appelle cryptographie, les specialistes en la * matieres sont des cryptographes
* Ceux qui s'ammusent a essayer (et parfois meme a arriver) a dechiffrer un message sans en conaitre la ou les clés (decrypter) sont les cryptanalystes, ils font de la cryptanalyse
* La branche mathematique sur laquelle s'appuient la cryptographie et le pratiquants est le cryptologue.
