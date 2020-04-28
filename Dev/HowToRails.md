# HowTo Ruby on Rails
## Documentation :

* https://www.grafikart.fr/
* http://api.rubyonrails.org

## Pour créer un projet
```bash
rails new <nomProjet>
```

Choisir la base de donnée à utiliser avec Rails (Instale tout seul les gems qu'il a besoin)
```bash
	rails new <nomProjet> --database=mysql
```

* `rails s[erver]` permet de lancer le serveur web
* `rails c[onsole]` permet de lancer une console avec le framework chargé

La configuration de la base de donnée se fait dans le fichier `config/database.yml`

Les routes sont definie dans le fichier `config/route.rb`
```ruby
# Syntaxe :
	get '/url', to: '<controler#action>'
# Exemple :
	get '/Bienvenue', to:  'pages#wellcome'
```

## Controller

Un controller est une classe qui contient plusieurs méthodes appellées `Action`, il se stitue dans `app/controller`
La convention, pour le nomage des controllers est  la suivante :
```b
Syntaxe :
  <type>_controller.rb
Exemple :
  # Pour que le cotroller gère des pages
  pages_controller.rb
```

### Générer un controller
```bash
rails g[enerate] controller <actions>
```
Ils contiennent une classe nommé `<Type>Controller`
Les controllers doivent hériter de `ApplicationController` (situé dans le dossier `app/controller`).

Chaque méthode créée dans cette classe est une action (appellée depuis `routes.rb`)

Chaque `Action` doit avoir une vue (en html.erb (embeded ruby)). Cette vue permettra d'afficher les informations sur une page web

Les vues sont placées dans le dossier `Views` et un nouveau dossier devra être créé pour chaque `Controller`


## Migration

Les migration definissent les modifications à appliquer sur une table de la base de données. Elles sont situé dans le dossier `db/`

Elles facilitent les deploiements.

Grâce au systeme de convention la clef primaire est deja créer

### Creation d'une table (fichier migration)
```bash
rails g[enerate] migration CreatePosts title:string content:text
```
Créer une table `Posts` avec les champs `title` comme chaine de caractère et `content` comme texte

### Appliquer les migration
```bash
rails db:migrate
```

### Rollback d'une migration
```bash
rails db:rollback
```


## Model
Les modèles interagisent avec la base de données. Ils sont situés dans le dossier `app/model`

* Leur convention de nommage est le nom de la table de la base de données au singulier
* Un model est une classe
* Elles héritent de `ApplicationRecorder`
* Elle represente la table de la BDD
```Ruby
	Model.find(id) :# Fait une recherche et retourne la ligne id de la table
	# select * from Table where ID = 1 en SQL
```

```ruby
# Model represente l'objet

# Récupérer l'information d'une colonne
Model.find(id).<NomCol>
Model.find(id)[:col]
# Récupérer du premier enregistrement
Model.first
# Récupérer du dernier enregistrement
Model.last
# Récupérer le nombre enregistrement
Model.count
# Récupérer tous les enregistrement
Model.all
# Modifier une colonne
Model.find(id)[:col] = 'azerty'
# Sauvegarder les informations en base de données
Model.find(id).save
# Supprimer une information
Model.find(id).destroy
# Ajouter un enregistrement
## Methdoe new
p = Model.new(name: "Azerty")
p.save
## Methode create
Model.create (name: "Azerty")
# Modifier un enregistrement
Model.find(id).update(name: "Ytreza")
```

## Validation des informations

Cette validation se fait dans les modèles

```ruby

# Validation de la presence d'un champ
validates <field>, prensence: true

# Avec un message
validates <field>, prensence: {message: "msg"}

# Validation de la taille ou regex
validates <field>, length: {is/min/max: taille}
validates <field>, length: {in: 3..20}
validates <field>, format: {with: '/regex/'}

# Validation du caractère unique du champ
validates <field>, uniqueness: true

# Validation de la coche d'une case
validates <field>, acceptance: true

# Validation de la confirmation du mot de passe
validates <field>, confirmation: true

# Verification uniquement pendant une action
, on: <action>
# Acceptation des champs vide
, allow_blank: true
, allow_nil: true

# Renvoie d'exeptiopn
strict: <method>

# Avec une fonction
if: :<nomfocntion>

validate :<fonctionPerso>
errors.add(<field>, <msg>)
```

### Vérification des modèles

```Ruby
<objetModel>.valid? # true si valide
<objetModel>.invalid? # true si invalide

# Récupérer l'erreur
err = <objetModel>.errors[<field>]

# Récupérer les détails de l'erreur
err = <objetModel>.errors.details[<field>]

# Récupérer le message d'erreur
msgErr = <objetModel>.errors.message
msgErr = <objetModel>.errors.full_messages

# Forcer la sauvegarde de l'enregistrement
<objetModel>.save(validate: false)
```


render 'edit' => fait l'action edit

les langues sont gerées dans `config/locale`

CRUD (Create, Read, Update, Delete):

resource :post
Créer les diferentes routes pour le CRUD

params[:id] contient le numero de l'id passer dans l'url
