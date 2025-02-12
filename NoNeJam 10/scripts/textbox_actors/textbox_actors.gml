
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
#macro ACTOR_CHAR1		"char1"
#macro ACTOR_CHAR2		"char2"

///@ignore
function __textbox_actors() {
	static actors = {	
		system:		new TextboxActor("", undefined, snd_dialog_1, 1),
		char1:		new TextboxActor("[#ff8080]Human 1[/c]", spr_char1_portrait, snd_dialog_1, 0.9),	
		char2:		new TextboxActor("[#8080ff]Robot 2[/c]", spr_char2_portrait, snd_dialog_1, 1.1),
	};

	return actors;
}