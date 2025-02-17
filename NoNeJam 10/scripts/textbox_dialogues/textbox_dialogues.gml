
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
		tutorial: {
			events: [
				[Dialog.Actor, ACTOR_SYSTEM],
				[Dialog.Text, "Utilize [#FFFF20]WASD[#FFFFFF] ou [#FFFF20]Setas[#FFFFFF] para se mover."],
				[Dialog.Text, "Aperte [#FFFF20][[E][#FFFFFF] para interagir com objetos."],
				[Dialog.Text, "Aperte [#FFFF20][[F][#FFFFFF] para trocar de personagem."],
				[Dialog.Text, "Segure [#FFFF20][[R][#FFFFFF] para reiniciar a fase."],
				[Dialog.Text, "Segure [#FFFF20][[Esc][#FFFFFF] para voltar ao menu inicial."],
				[Dialog.Callback, function(){obj_gui.col_scl_default = 1}],
				[Dialog.Text, "Os indicadores no canto da tela monstram quais cores estão ativas."],
			]
		},
		button : {
			events: [
				[Dialog.Actor, ACTOR_SYSTEM],
				[Dialog.Text, "Botões são ativados ao pisar encima, e desativam ao sair dele."],
			]
		},
		lever : {
			events: [
				[Dialog.Actor, ACTOR_SYSTEM],
				[Dialog.Text, "Alavancas permanecerão ativas até serem manualmente desativadas."],
			]
		},
		colors : {
			events: [
				[Dialog.Actor, ACTOR_SYSTEM],
				[Dialog.Text, "Portas de cores diferentes só serão abertas pelo seu respectivo sinal."],
			]
		},
		inverted : {
			events: [
				[Dialog.Actor, ACTOR_SYSTEM],
				[Dialog.Text, "Portas invertidas estão fechadas quando o sinal está ligado, e abrem quando o sinal é desligado"],
			]
		},
		bueiro : {
			events: [
				[Dialog.Actor, ACTOR_SYSTEM],
				[Dialog.Text, "De onde tá vazando tudo isso?"],
			]
		},
		acid : {
			events: [
				[Dialog.Actor, ACTOR_CHAR1],
				[Dialog.Text, "Ai! Isso queima. Essa parte tá cheia de [#40FF60]ácido[/c]. Eu é que não vou andar por aqui."],
				[Dialog.Text, "Mas o ácido parece não afetar o metal..."],
				[Dialog.Text, "Talvêz o robô consiga passar."],
			]
		},
		water : {
			events: [
				[Dialog.Actor, ACTOR_CHAR2],
				[Dialog.Text, "[shake][[3RR0!!]. S1st3m4 em c0ntat0 c0m [#30F0F0][[ÁGU4].[/c] P0ssív3l dan0 1nt3rno. Recuar...[/shake]"],
				[Dialog.Text, "Buscando alternativas..."],
				[Dialog.Text, "Diretríz recomendada: Contatar humano."],
			]
		}
	}

	return dialogues;
}

