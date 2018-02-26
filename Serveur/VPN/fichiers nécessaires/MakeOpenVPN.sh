#!/bin/bash 
 
# D�claration des variables par d�faut
DEFAULT="Default.txt" 
FILEEXT=".ovpn" 
CRT=".crt" 
KEY=".3des.key" 
CA="ca.crt" 
TA="ta.key" 
 
# Demande du nom du client
echo "Entrez le nom d'un client existant :"
read NAME 
 
 
# On v�rifie que la cl� publique associ� au nom du client existe 
if [ ! -f $NAME$CRT ]; then 
 echo "[ERREUR] Cl� publique non trouv�e : $NAME$CRT" 
 exit 
fi 
echo "Cl� publique trouv�e : $NAME$CR" 
 
 
# On v�rifie qu'une cl� priv�e existe pour ce client 
if [ ! -f $NAME$KEY ]; then 
 echo "[ERREUR] Cl� priv�e 3DES non trouv�e : $NAME$KEY" 
 exit 
fi 
echo "Cl� priv�e trouv�e : $NAME$KEY"

# On v�rifie l'existence de la cl� CA 
if [ ! -f $CA ]; then 
 echo "[ERREUR]: Cl� publique CA non trouv�e : $CA" 
 exit 
fi 
echo "Cl� publique CA trouv�e : $CA" 

# On v�rifie l'existence de la cl� tls-auth 
if [ ! -f $TA ]; then 
 echo "[ERREUR]: Cl� priv�e tls-auth non trouv�e : $TA" 
 exit 
fi 
echo "Cl� priv�e tls-auth trouv�e : $TA" 
 
# Pr�t � g�n�rer le fichier de configuration
# On commence par ins�rer le fichier de base
cat $DEFAULT > $NAME$FILEEXT 
 
# On ajoute la cl� publique du CA 
echo "<ca>" >> $NAME$FILEEXT 
cat $CA >> $NAME$FILEEXT 
echo "</ca>" >> $NAME$FILEEXT

# On ajoute la cl� publique du client 
echo "<cert>" >> $NAME$FILEEXT 
cat $NAME$CRT | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' >> $NAME$FILEEXT 
echo "</cert>" >> $NAME$FILEEXT 
 
# On ajoute la cl� priv�e du client
echo "<key>" >> $NAME$FILEEXT 
cat $NAME$KEY >> $NAME$FILEEXT 
echo "</key>" >> $NAME$FILEEXT 
 
# Enfin, on ajoute la cl� tls-auth 
echo "<tls-auth>" >> $NAME$FILEEXT 
cat $TA >> $NAME$FILEEXT 
echo "</tls-auth>" >> $NAME$FILEEXT 
 
echo "Termin� ! $NAME$FILEEXT g�n�r� avec succ�s."

# Script written by Eric Jodoin
# Adapted/translated into French by Maxime Auvy