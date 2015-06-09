// variables
set font = game.createFont("emulogic", 12, game.color.WHITE);

// stage
set stage = game.createStage(0, 0);
set gameLayer = stage.createLayer();
set scoreLayer = stage.createLayer();
gameLayer.createRepeatedImage("Sky");

scoreLayer
.createButton(font, "black", "debug", stage.getWidth() - 115, stage.getHeight() - 70)
.onTap ({ game.setDebug(!game.getDebug()); });

set player = gameLayer.createActor("player");
player.typeDynamic().hitSquare(0);
player.move(stage.getWidth()/2, stage.getHeight()/2);
player.setFriction(0);

stage.onKeyPulse((ch) {
	if (ch == game.key.LEFT) {
		// rotation à gauche
		print("gauche");
		set rotation = player.getRotation();
		player.rotate(rotation+1);
	}else if (ch == game.key.RIGHT) {
		// rotation à droite
		print("droite");
		set rotation = player.getRotation();
		player.rotate(rotation-1);
	}else if (ch == game.key.UP) {
		// gaz
		player.impulse(10,10);
	}else if (ch == game.key.SPACE) {
		// tir
		player.setVelocity(0,0);
	}
});
