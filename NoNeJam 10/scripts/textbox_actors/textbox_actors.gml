
/*
+========================================================
||
||	Script de adicao dos atores.
||
||	Cada ator possui propriedades que sao aplicadas
||	no momento do diálogo.
||
+========================================================	
*/


// Exemplo de macro pra usar no nome dos atores
#macro ACTOR_SYSTEM		"system"
#macro ACTOR_ANNE		"anne"
#macro ACTOR_PLAYER		"player"
#macro ACTOR_SIGN		"wood_sign"
#macro ACTOR_SENSEI		"sensei"

///@ignore
function __textbox_actors() {
	static actors = {	
		system:		new TextboxActor("", undefined, snd_dialog_1, 1),
	
		anne:		new TextboxActor("[#6C88FF]Anne[/c]", spr_anne_portrait, snd_dialog_1, 1.2),
	
		player:		new TextboxActor("[#00C19A]Sam[/c]", spr_player_portrait, snd_dialog_1, 0.6),
	
		wood_sign:	new TextboxActor("[#D77E4B]Placa de madeira[/c]", spr_sign_dialog, snd_dialog_1, 1.0),
	
		sensei:		new TextboxActor("[#D50964]Sensei", spr_sensei_portrait, snd_dialog_1, 0.4)
	
	};

	return actors;
}