#!/bin/bash 
 
# Déclaration des variables par défaut
DEFAULT="Default.txt" 
FILEEXT=".ovpn" 
CRT=".crt" 
KEY=".3des.key" 
CA="ca.crt" 
TA="ta.key" 
 
# Demande du nom du client
echo "Entrez le nom d'un client existant :"
read NAME 
 
 
# On vérifie que la clé publique associé au nom du client existe 
if [ ! -f $NAME$CRT ]; then 
 echo "[ERREUR] Clé publique non trouvée : $NAME$CRT" 
 exit 
fi 
echo "Clé publique trouvée : $NAME$CR" 
 
 
# On vérifie qu'une clé privée existe pour ce client 
if [ ! -f $NAME$KEY ]; then 
 echo "[ERREUR] Clé privée 3DES non trouvée : $NAME$KEY" 
 exit 
fi 
echo "Clé privée trouvée : $NAME$KEY"

# On vérifie l'existence de la clé CA 
if [ ! -f $CA ]; then 
 echo "[ERREUR]: Clé publique CA non trouvée : $CA" 
 exit 
fi 
echo "Clé publique CA trouvée : $CA" 

# On vérifie l'existence de la clé tls-auth 
if [ ! -f $TA ]; then 
 echo "[ERREUR]: Clé privée tls-auth non trouvée : $TA" 
 exit 
fi 
echo "Clé privée tls-auth trouvée : $TA" 
 
# Prêt à générer le fichier de configuration
# On commence par insérer le fichier de base
cat $DEFAULT > $NAME$FILEEXT 
 
# On ajoute la clé publique du CA 
echo "<ca>" >> $NAME$FILEEXT 
cat $CA >> $NAME$FILEEXT 
echo "</ca>" >> $NAME$FILEEXT

# On ajoute la clé publique du client 
echo "<cert>" >> $NAME$FILEEXT 
cat $NAME$CRT | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' >> $NAME$FILEEXT 
echo "</cert>" >> $NAME$FILEEXT 
 
# On ajoute la clé privée du client
echo "<key>" >> $NAME$FILEEXT 
cat $NAME$KEY >> $NAME$FILEEXT 
echo "</key>" >> $NAME$FILEEXT 
 
# Enfin, on ajoute la clé tls-auth 
echo "<tls-auth>" >> $NAME$FILEEXT 
cat $TA >> $NAME$FILEEXT 
echo "</tls-auth>" >> $NAME$FILEEXT 
 
echo "Terminé ! $NAME$FILEEXT généré avec succès."

# Script written by Eric Jodoin
# Adapted/translated into French by Maxime Auvy