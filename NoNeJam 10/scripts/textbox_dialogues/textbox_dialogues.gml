
/*
+========================================================
||
||	Script de adicao dos diálogos.
||	
||	Cada linha é composta de um identificador, podendo 
||	ter em seguida um ou mais conteúdos.
||	
+========================================================
*/

///@ignore
function __textbox_dialogues() {
	static dialogues = {
		char1_test : {
			events: [
				[Dialog.Actor, ACTOR_CHAR1],
				[Dialog.Text, "Vamo testar esse sistema de diálogo aqui?"],
				[Dialog.Text, "Ao que indica tá tudo certo, vambora"],
				
				[Dialog.Actor, ACTOR_CHAR2],
				[Dialog.Text, "Vamo testar esse sistema de diálogo aqui?"],
				[Dialog.Text, "Ao que indica tá tudo certo, vambora"],
			]
		}
	}

	return dialogues;
}

