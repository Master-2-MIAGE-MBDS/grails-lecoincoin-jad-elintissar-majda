# grails-lecoincoin-jad-elintissar-majda
# grails-lecoincoin-jad-elintissar-majda

Video demonstrative  :https://drive.google.com/file/d/1kPDerD9dSxUeDhegdWuKQc6jOAC4Hbrd/view?usp=share_link

### 1. USER :


- Visualiser toutes les annonces disponibles dans le site 
- Visualiser une annonce specifique
- Visualiser ses propres annonces
- Modifier une de ses annonces 
- Ajouter une annonce
 
### 2. Admin :


- Visualiser toutes les annonces disponibles dans le site 
- Visualiser une annonce specifique
- Visualiser tous les utilisateurs
- Modifier un utilisateur 
- Ajouter un utilisateur
- Supprimer une annonce 
- Modifier une  annonces

    

### 3. MODERATOR :

Ce rôle est légèrement similaire à celui de l'admin, sa différence est dans le fait qui peut ni supprimer, ni ajouter une annonce ou un utilisateur, aussi il ne peut pas modifier le rôle d'un utilisateur étant un admin :

- Visualiser les annonces dans home exactement comme l'admin
- Visualiser une annonce specifique
- Visualiser tous les utilisateurs 
- Modifier un utilisateur 
- Modifier une des annonces 
  
### 4. API 

  Nous disposant d'un controller du nom de [ApiController.groovy] au sein de notre projet, il s'agit du moteur de notre API REST, il s'occupe de la gestion des différentes méthodes GET, PUT, PATCH, DELETE et POST ainsi que les réponses et les status de ces derniers tous en contrôle Lant la sécurité et les droits de la personne qui l'utilisent.

  L'annotation *@Secured* designe les personnes ayant un des roles mentionees ce qui lui permettra d'utiliser l'API ou non dans le cas contraire, dans notre cas, on donne l'acces a tout les utilisateurs ayant n'importe quel role des 3 etant donne que la gestion des droits ce fait dans le controller .
  
