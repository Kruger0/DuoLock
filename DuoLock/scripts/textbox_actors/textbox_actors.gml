
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
		char1:		new TextboxActor("[#FFC825]Roberto[/c]", spr_char1_portrait, snd_dialog_1, 1.1),	
		char2:		new TextboxActor("[#0CF1FF]CH4R-LE5[/c]", spr_char2_portrait, snd_dialog_1, 0.9),
	};

	return actors;
}