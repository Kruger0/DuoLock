
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
				
				[Dialog.Actor, ACTOR_CHAR2],
				[Dialog.Text, "Ao que indica tá tudo certo, vambora"],
			]
		},
		test : {
			events: [
				[Dialog.Actor, ACTOR_CHAR1],
				[Dialog.Text, "O homem é feito de casa, ou a casa é feita de carne?"],
			]
		},
		poison : {
			events: [
				[Dialog.Actor, ACTOR_CHAR1],
				[Dialog.Text, "Ih rapaz, essa parte tá cheia de veneno. Eu é que não vou andar por aqui"],
				[Dialog.Text, "Mas veneno não afeta robôs. Talvêz ele consiga passar por aqui"],
			]
		},
		water : {
			events: [
				[Dialog.Actor, ACTOR_CHAR2],
				[Dialog.Text, "Água detectada. Agente danoso. Possível dano interno. Buscando alternativas..."],
				[Dialog.Text, "Diretríz recomendada: Contatar humano."],
			]
		}
	}

	return dialogues;
}

