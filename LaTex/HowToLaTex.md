# LaTex

## Compilation

**Compilation du .tex en .pdf<br>**
`pdflatex text.tex`

### Autre Commande de compilation pour des format spécifique

Compilation du .tex en .dvi<br>
`latex test.tex`

Affichage de test.dvi<br>
` xdvi test.dvi`

Imprime test.dvi<br>
` dvips test.dvi`

Conversion .dvi => .ps <br>
` dvips test.dvi -o`

Conversion .ps => .pdf <br>
`ps2pdf test.ps`


## Syntaxe globale de LaTex
* une commande a commence par un "\"
* Les commande possede un type a precisé entre "{}"
* Elle possede aussi des option place entre "[]"
* Le commentaire sont reperé par %

### Exemple
```latex
	%Je suis un commentaire
	\commande{type}[arg1, arg2]
```

## Caractere speciaux
Liste des diffrent caractere speciaux :
*	$
* &
* %
* #
* \_
* {
* }
* ^
* \

Le caractere d'echapement de ces caratere speciaux est "\" (\\ ne fonctionne pas pour ecrire l'antislash, il faudras utiliser \textbackslash{})

## Package
LaTex peut être etendu grâce a des paquets
### Syntaxe
```
\usepackage[option]{package}
```
### Exemple
```
\usepackage[francais]{babel}
```

Cette commande doit etre placé dans le preambule du code (entre \documentclass et \begin{document})

### Liste de paquets
* inputenc => permet de precise l'encodage du fichier
	\usepackage[utf8]{inputenc}
* babel => permet de precisé la langue du document et d'obtenir des commande lié a la langue
	\usepackage[francais]{inputenc}
* layout => permet l'utilisation de layout grace a la commande layout (a utilisé avec geometry)
	\usepackage{layout}
* geometry => permet de modifie le layout
	\usepackage{geometry}
	\usepackage[top=2cm, bottom=2cm, left=2cm, right=2cm]{geometry}
* setspace => modifie l'interlignage du texte (utilise les environement)
	\usepackage{setspace}
	* environement: onehalfspace, doublespace (1.5 ou 2 fois plus grand)
	* commande dans le preambule :
		onehalfspace, doublespace <br>
		Appliqué a tous le document

## Environement
Les commandes \begin et \end permette de delimite un environement
### Syntaxe
```
\begin{type}
\end{type}
```
Le texte ecrie entre ces 2 commande appartiendront a l'environement precisé dans begin
<br>
\begin peut aussi prendre des options<br>
Le corps du document doit obligatoirement etre palcé dans l'environement document

## Type de documents (documentclass)
LaTex a besoins de savoir le type de document redigé afin qu'il respte les normes typographique et de mise en page
### Syntaxe
```
\documentclass{type}
```
** Type peut être egal a :**
* article : Si le document est un article
* book    : Si le document est un livre
* letter  : Si le document est une lettre
* lettre  : Si le document est une lettre  (au format français (crée par l'observatoire* de Genève))
* report  : Si le document est un rapport
* memoir  : Si le document est un memoire
* slides  : Si le document est une presentation
* beamer  : Format plus avancé de presentation

Les option pour cette commande peuvent changé :
<table>
<tr><td>** Fonction ** </td> <td> ** Valeur possible ** </td><td> ** Valeur par defaut ** </td></tr>
<tr><td>Format du papier</td><td>a4paper, a5paper, letterpaper, b5paper, ... </td><td> letterpaper</td></tr>
<tr><td>Taille de la police</td><td>10pt, 11pt, 12pt, ...</td><td>10pt</td></tr>
<tr><td>Alignement des equation</td><td>fleqn (a gauche)</td><td>centré</td></tr>
<tr><td>Colonnes</td><td>onecolumn, twocolumn</td><td>onecolumn</td></tr>
<tr><td>Premiere page du chapitre</td><td>openany, openright, ...</td><td>openright</td></tr>
<tr><td>Recto/Verso</td><td>oneside, twoside</td><td>article/report:oneside, book:twoside</td></tr>
</table>

Un document doit commencer par un documentclass

## Mise en page
### Structure du document
* \part{nom}       	  => Partie de nom <nom>
* \chapter{nom}    	  => Chapitre (pas possible pour les articles et lettre)
* \section{nom}       => Section
* \subsection{nom}    => sous-section
* \subsubsection{nom} => sous-sous-section
* \paragraph{nom}     => Paragraphe
* \subparagraph{nom}  => sous-paragraphe

L'ajout de "\*" a la fin de la commande permet d'evité la numerotation

## Annexe
### Syntaxe :
```
\appendix
```
A partir de cette commande tous les chapitres devienne annexe
Pour les articles (\chapter n'est pas disponible ) appendix jouera sur la numerotation des section

Pour la création d'un livre, la structure avec un preambules et avant-propos, chapitres, annexes, index/bibliographie peut etre interesante

* \frontmatter => preambule et avant-propos
* \mainmatter  => Chapitres
* \appendix 	 => Annexes
* \backmatter  => index/bibliographie/epilogue, ...

## Page de garde
Commande qui permetront de generé l'entête
* \title{Titre}        => Titre
* \author{nomsAuteurs} => Liste des auteurs
* \date{Date}          => Date

Apres \begin{document}, il faut construire le titre avec les info precisé avec les commandes d'avant<br>
`\maketitle`

(Voir le package fancy pour les header footer, ..., pour une mise en page plus pointus)

## Alignement de texte
LaTex justifie le texte par defaut, pour changé l'alignement, il faut changé d'environement
* flushright : Aligne le texte a droite
* flushleft  : Aligne le texte a gauche
* center     : Aligne le texte au centre

## Paragraphe, saut de ligne et de page
Deux saut de ligne succesif suffise a LaTex pour crée un paragraphe
\\ ou \newline permet de crée un saut de ligne
\newpage permet d'aller a la prochaine page

## Liste
Definie dans l'evironement itemize (liste a puce), enumerate (liste numeroté) et description (liste descriptif)
Chaque element de la liste doit etre precedé de la commande item

### Option
* Itemize :
	* Caractere de la puce (par defaut : "-" )
* Desciption :
	* Expresion a decrire

### Exemple
```LaTex
\begin{itemize}
	\item[M] blabla % La puce sera un M
	\item[L] blabla % La puce sera un l
	\item blabla % La puce sera un -
\end{itemize}
\begin{description}
	\item[Couleur] rouge % Couleur sera en gras puis rouge sera normal
\end{description}
```

## Style
* Numero de la page au milieu et en pied de page => plain
* Nom du chapitre et numero de page en en-tête   => headings
* Rien de le pied de page et dans l'en-tête      => empty

Pour modifier le style de la page, a mettre dans le preambule <br>
` \pagestyle{nomDuStyle} `

## Police
La gestion de la police introduit une nouvelle syntaxe dans LaTex <br>
	` {\commande texte} ` <br>
Cependant la syntaxe basic est toujours utilisable <br>
	`\commande{texte}`

### Taille de la police :
* \tiny         => Minuscule
* \scriptsize   => Très très petite
* \footnotesize => Très petite
* \small        => Petite
* \normalsize   => Normale (définie dans \documentclass)
* \large        => Légèrement plus grande que la normale
* \Large        => Grande
* \LARGE        => Très grande
* \huge         => Très très grande
* \Huge         => Énorme

### Modification du style de caratere :
le style des caractere peut etre modife soit par des commande (avec les deux syntaxe) ou par des environement

<table>
<tr><td>** \Commande ** </td><td> ** {\commande } ** </td><td> ** Environement ** </td><td> ** Description ** </td></tr>
<tr><td> </td><td> normalfont </td><td> rm </td><td> texte normal </tr>
<tr><td> textbf </td><td> bfseries </td><td> bf </td><td> Gras </tr>
<tr><td> textit </td><td> itshape </td><td> it </td><td> Italique </tr>
<tr><td> textsl </td><td> slshape </td><td> sl </td><td> Penché </tr>
<tr><td> texttt </td><td> ttfamily </td><td> tt </td><td> Machine a ecrire </tr>
<tr><td> textsc </td><td> scshape </td><td> sc </td><td> Petites majuscules </tr>
<tr><td> textsuperscript </td><td> </td><td> </td><td> Exposant </tr>
<tr><td> fbox </td><td> </td><td> </td><td> Encadrer (Parametrable) </tr>
<tr><td> ul </td><td> </td><td> </td><td> Soulignement (Package soul) </tr>
<tr><td> uuline </td><td> </td><td> </td><td> Double soulignement (Package ulem) </tr>
<tr><td> uwave </td><td> </td><td> </td><td> souvague </tr>
<tr><td> st </td><td> </td><td> </td><td> Barrer (Package soul) </tr>
</table>

LaTex peut se debrouiller seul pour mettre en avant des expression <br>
` \emph{texte} ` <br>
Si le texte est deja en italique emph met son texte d'une autre façon

## Coloration :
LaTex permet aussi de colorer le texte grâce au package color. Il gére par defaut 8 couleurs
* black, white, red, green, blue, yellow, magenta et cyan

### Syntaxe
`\textcolor{couleur}{texte a mettre en couleur}`
### Exemple
`\textcolor{red}{Texte en rouge} `

Il est possible que ces 8 coleurs ne soit satisfaisant, c'est pourquoi il existe la commande definecolor pour crée des couleur
### Syntaxe :
` \definecolor{nom de la couleur}{type}{niveau de couleur} `
### Exemple
`\definecolor{blouge}{rgb}{0.5, 0, 0.5}`
