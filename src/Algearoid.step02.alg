// variables
set font = game.createFont("emulogic", 12, game.color.WHITE);

// creation du stage
set stage = game.createStage(0, 0);

//creation d'un layer pour le jeu
set gameLayer = stage.createLayer();
// creation d'un layer pour les informations de debug
set debugLayer = stage.createLayer();

// creation d'un bouton qui affichera des détails de debug sur les actors
debugLayer
.createButton(font, "black", "debug", stage.getWidth() - 115, stage.getHeight() - 70)
.onTap ({ game.setDebug(!game.getDebug()); });

// creation de l'actor qui represéntera le vaisseau du joueur
set player = gameLayer.createActor("player");

// on défini la force qui sera donné à la poussée des réacteurs
set power = 1;

// On le place au centre pour démarrer
player.move(stage.getWidth()/2, stage.getHeight()/2);

// on limite la vitesse maximum pour garder le vaisseau controlable.
player.setMaxVelocity(1);

// le vaisseau aura des interaction avec d'autres objets
player.typeDynamic().hitSquare(0);

set rotation = player.getRotation();
// pour voir la valeur de la rotation, on crée un label 
set rotationLabel = debugLayer.createLabel(font, "rotation", rotation, stage.getHeight() - 20);
rotation.onChanged((v) { rotationLabel.setText("rotation: " .. v) })


// cette fonction va maintenir la valeur dans les limites de 0-360
set limiteRotation = function(valeur) {
	if (valeur < 0) {
		valeur = 360 + valeur;
	} else if (valeur > 360) {
		valeur = valeur - 360;
	}
	return valeur;
}

// gestion des actions du clavier
stage.onKeyPulse((ch) {
	// si on utilise la flèche gauche
	if (ch == game.key.LEFT) {
		// rotation à gauche
		rotation = limiteRotation(rotation + 5);
		player.rotate(rotation);
	}
	// si on utilise la flèche droite
	else if (ch == game.key.RIGHT) {
		// rotation à droite
		rotation = limiteRotation(rotation - 5);
		player.rotate(rotation);
	} else if (ch == game.key.UP) {
		// on calcule l'impulsion qu'on va donner
		player.impulse( power*math.sin(rotation), power*math.cos(rotation));	
	}
});
