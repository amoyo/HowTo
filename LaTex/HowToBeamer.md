# Beamer
Beamer ("Bimer") est le powerpoint de LaTex<br>
Beamer est un documentType<br>
Elle succede slide, seminar (trop simple), pdfscreen et prosper<br>

Une frame (aussi appelé transparent) est une slide qui contient un contenu

Il est compilé en pdf et il permet d'integrer des video, transition, etc ...

Il est aussi possible d'appliquer des theme sur les presentation et meme de le créer

+ Passer d'une classe rapport a une classe Beamer facilement
+ Portabilité : il compile un PDF
+ Tous les atous LaTex (Formule mathematique)
+ L'adaptabilité des themes
+ Gratuit et libre

## Preambule
Utilisation de la classe
``` LaTex
	\documentclass{beamer}
```
Utilisation d'un theme
### Syntaxe
``` LaTex
\usetheme{theme}
```

Liste des theme disponible
* Warsaw


## Creation d'une slide
La creation d'une slide se fait grâce a l'environement frame
### Syntaxe
``` LaTex
\begin{frame}
		.
		.
		.
\end{frame}
```

Une frame est généralement composé d'un titre, d'un sous-titre et du texte.

## Titre de la frame
### Syntaxe
``` LaTex
\frametitle{Titre}
```
## Sous-titre de la frame
### Syntaxe
``` LaTex
\framesubtitle{Sous Titre}
```

La frame peut avoir un label, une reference qui permetra de l'apelé depuis une autre frame. Ce label est passé en option de l'environement frame
### Syntaxe
label=<nom du label>
### Exemple
``` LaTex
\begin{frame}[label=pageune]
\end{frame}
```

## frame "fragile"
une frame fragile est une frame où le compilateur considére le texte a l'interieur comme du texte (il ne reconais plus les commande, caratere speciaux, ...).

fragile est une option de l'evironement frame
### Syntaxe
``` LaTex
fragile
```
### Exemple
``` LaTex
\begin{frame}[fragile]
	\includegraphics{} % \includegraphics{} sera affiché tels quelle dans la frame
\end{frame}
```

## Verbatim
Le verbatim est une police machine a ecrire.
### Methode 1
Pour une frame fragile<br>
Il faut utilisé l'environement `verbatim`
#### Syntaxe
``` LaTex
\begin{verbatim}
	\begin{frame}[fragile]
	\end{frame}
\end{verbatim}
```
### Methode 2
Il faut utilisé l'environement `semiverbatim`
#### Syntaxe
``` LaTex
\begin{semiverbatim}
\end{semiverbatim}
```

## Frame sans theme
Pour declarer une frame sans theme, il faut passer en option plain lors de la creation de la frame
Syntaxe :
``` LaTex
\begin{frame}[plain]
\end{frame}
```
Il est toujours possible d'ajouter un titre mais celui-ci va appaître selon le theme (si il doit etre dans un rectangle bleu, il le serra)

## Gestion du texte
	Les frames integre une option qui permet de gerer la taille du texte contenue dans une frame, si celui doit debordé il serra afficher dans une autre frame
### Syntaxe
\begin{frame}[allowframebreaks]
\end{frame}
### Exemple
\begin{frame}[allowframebreaks]
	loreum[10]
\end{frame}

## Page de titre
``` LaTex
	\author{Auteurs}
	\title[sous titre]{titre}
	\institute{institue}
	\date{date}

	\begin{frame}
		\titlepage
	\end{frame}
```

## Sommaire
Comme dans les autres classe beamer integre des sommaires
<br>`\tableofcontents[opt, opt2]`<br>
Celui ci doit ce trouver dans une frame (comme la page de titre)

###  Option
* currentsection : Indiquera la section en cours ainsi que sa sous section en cours. Le reste apparaitra en transparent.
* currentsubsection : Ne seront transparents que les sous sections n'étant pas en cours.
* hideallsubsections : N'affichera plus du tout les sous sections.
* hideothersubsections : Affichera tout, sauf les sous sections des sections n'étants pas en cours.
* pausesections : Fera une pause avant d'afficher le nom de la section suivante. Il faudra donc cliquer pour faire apparaitre la section n°2, puis re-cliquer pour faire apparaitre la section n°3, ...
* pausesubsections : Pareil qu'au dessus, sauf que là ce sera aussi pareil pour les sous sections, on affichera donc tout, un à un.

## Afficher une frame a chaque debut de section
``` LaTex
	AtBeginSection{Commande}
	AtBeginSubSection{Commande}
```

## Modifier la marge
``` LaTex
\setbeamersize{}
```
### Option
* text margin left=(taille de la marge)
* text margin right=(taille de la marge)
