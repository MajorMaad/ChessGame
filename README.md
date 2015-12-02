# ChessGame

## Auteurs

* Marie Darrigol
* Quentin Audinot

## Journalisation

Dans notre programme, tous les coups joués pendant une partie sont enregistrés et affichés, que ce soit des coups de l'IA ou du joueur humain.

-----------------------------------------------------------------------------------

Chaque coup valide est affiché à la fois dans la console du jeu et dans un fichier créé à la racine du projet, nommé "log.txt".

Les coups sont notés de la façon suivant :
	"[Player/AI]'s move : [valeur du mouvement (ex : a2a4)]"
Dans le fichier, chaque coup est écrit sur une ligne.

A chaque début de partie, le fichier est vidé. On ne peut ainsi stocker que les coups de la partie la plus récente.

-----------------------------------------------------------------------------------

Cet aspect du programme est géré par l'aspect FileWriterAspect. Il dispose de deux actions majeures : la création du fichier de journalisation et sa mise à jour.

* La création du fichier est prise en charge par le pointcut initialize, qui se lance avant l'exécution de la méthode main. Ce pointcut va ouvrir le fichier au chemin indiqué dans la variable outputPath, stockée dans l'aspect. Ensuite, il va effacer son contenu et le remplacer par une ligne en début de fichier.

* La mise à jour du fichier se fait dans un deuxième pointcut, writeMove, qui se lance après l'exécution de la méthode makeMove(Move), quelque soit la classe qui l'a utilisé (Player ou AI). L'affichage changera en fonction de la classe appelante. Ensuite, le programme ajoute une ligne au fichier de journalisation.
Notez que cette fonction ne se lance que si la valeur retournée par makeMove est true, ce qui signifierait que le mouvement a été validé par les autres aspects.


## Déplacements

Chaque coup est validé avant son exécution.

-----------------------------------------------------------------------------------

Il y'a un aspect par type de pièce. Exemple, pour la reine, on a le fichier QueenAspect.aj.

Chaque aspect va utiliser la fonction around afin de "remplacer" la fonction isMoveLegal propre à chaque pièce. En effet, en fonction du Move, celle-ci va retourner true ou false après vérification.

Donc si on essaye de déplacer une pièce en dehors d'échiquier ou dans une direction non correcte, cela renvoie false.
