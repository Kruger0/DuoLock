
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
		tutorial: {
			events: [
				[Dialog.Actor, ACTOR_SYSTEM],
				[Dialog.Text, "Controles: [#FFFF20]WASD[#FFFFFF] ou Setas"],
				[Dialog.Text, "Utilize [#FFFF20][[E][#FFFFFF] para interagir com objetos"],
				[Dialog.Text, "Utilize [#FFFF20][[F][#FFFFFF] para trocar de personagem"],
				[Dialog.Text, "Utilize [#FFFF20][[R][#FFFFFF] para reiniciar a fase"],
				[Dialog.Text, "Utilize [#FFFF20][[Espaço][#FFFFFF] para pular diálogos que você possa achar desnecessariamente longos e esteja se perguntando o que o desenvolvedor pensou naquela hora..."],
			]
		},
		acid : {
			events: [
				[Dialog.Actor, ACTOR_CHAR1],
				[Dialog.Text, "Ih rapaz, essa parte tá cheia de ácido. Eu é que não vou andar por aqui"],
				[Dialog.Text, "Mas ácido não afeta metal. Talvêz o robô consiga passar por aqui"],
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

