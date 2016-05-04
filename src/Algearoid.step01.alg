// variables
set font = game.createFont("emulogic", 12, game.color.WHITE);

// creation du stage
// stage creation
set stage = game.createStage(0, 0);

// creation d'un layer pour le jeu
// game layer creation
set gameLayer = stage.createLayer();

// creation d'un layer pour les informations de debug (fixe)
// debugging and informations layer (fixed)
set debugLayer = stage.createLayer();

debugLayer
.createButton(font, "black", "debug", stage.getWidth() - 115, stage.getHeight() - 70)
.onTap ({ game.setDebug(!game.getDebug()); });

// creation de l'actor qui represéntera le vaisseau du joueur
// star ship player actor
set player = gameLayer.createActor("player");

// le vaisseau aura des interaction avec d'autres objets
// space ship will interact with other objects.
player.typeDynamic().hitSquare();

// On le place au centre pour démarrer
// Player should be on the center of the screen
player.move(stage.getWidth()/2, stage.getHeight()/2);

// le vaisseau aura des interaction avec d'autres objets
player.typeDynamic().hitSquare();

// gestion des actions du clavier
// keyboard actions management
stage.onKeyPulse((ch) {
	// si on utilise la flèche gauche
	if (ch == game.key.LEFT) {
		// rotation à gauche
		set rotation = player.getRotation();
		player.rotate(rotation+5);
	}
	// si on utilise la flèche droite
	else if (ch == game.key.RIGHT) {
		// rotation à droite
		set rotation = player.getRotation();
		player.rotate(rotation-5);
	}
});
