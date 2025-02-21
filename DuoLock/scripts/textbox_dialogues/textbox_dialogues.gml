
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
		lore : {
			events : [
				[Dialog.Actor, ACTOR_SYSTEM],
				[Dialog.Text, "Após tropeçar de um alçapão enferrujado e cair em um buraco, você se viu numa espécie de labirinto, com portas e botões espalhados."],
				[Dialog.Text, "Voçê tenta apertá-los, porém estão muito distantes da porta. Não há como escapar daqui sozinho."],
				[Dialog.Text, "Olhando pro canto da sala, você encontra um robô, aparentemente desligado."],
				[Dialog.Text, "Parece ter tropeçado sozinho, e a queda fez a chave de energia ser desligada. Você liga ele."],
				[Dialog.Actor, ACTOR_CHAR2],
				[Dialog.Text, "Sequência de inicialização... Sistemas operantes... Pronto para continuar com o prococolo 'DuoLock'."],
				[Dialog.Actor, ACTOR_CHAR1],
				[Dialog.Text, "Protocolo o quê? Você consegue me ajudar a sair daqui?"],
				[Dialog.Actor, ACTOR_CHAR2],
				[Dialog.Text, "Assistente Autônomo de Liberação por Ativacão Dupla [#0CF1FF]CH4R-LE5[/c], ao seu dispor."],
				[Dialog.Actor, ACTOR_CHAR1],
				[Dialog.Text, "Beleza... eu me chamo... [#FFC825]Roberto[/c]. Vamos dar um fora daqui."],
				[Dialog.Callback, call_later, [1, time_source_units_seconds, function(){cam_tran_start(rm_level_1)}, false]],
			]
		},
		fim : {
			events : [
				[Dialog.Actor, ACTOR_CHAR1],
				[Dialog.Text, "Conseguimos! Escapamos da masmorra! Sabia que [rainbow]Trabalhando em Equipe[/rainbow] conseguiriamos!"],
				[Dialog.Actor, ACTOR_CHAR2],
				[Dialog.Text, "Assistente Autônomo de Liberação por Ativacão Dupla [#0CF1FF]CH4R-LE5[/c], concluindo suas operações!."],
				[Dialog.Callback, call_later, [1, time_source_units_seconds, function(){cam_tran_start(rm_credits)}, false]],
			]
		},
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
				[Dialog.Text, "Botões são ativados ao pisar em cima, e desativam ao sair dele."],
			]
		},
		lever : {
			events: [
				[Dialog.Actor, ACTOR_SYSTEM],
				[Dialog.Text, "Alavancas permanecerão ativas até serem manualmente desativadas. Se uma estiver ativada, ativar outra não mudará o sinal"],
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
		},
		bolinha: {
			events : [
				[Dialog.Actor, ACTOR_SYSTEM],
				[Dialog.Text, "Bolinhas são divertidas"],
				[Dialog.Text, "Menos quando te acertam na cara."],
			],
		},
		dino: {
			events : [
				[Dialog.Actor, ACTOR_SYSTEM],
				[Dialog.Text, "Me pergunto se este ovo de dinossauro ainda tem um mini T-Rex dentro"],
				[Dialog.Text, "Ou se virou uma omelete pré-histórica."],
			],
		},
		nave: {
			events : [
				[Dialog.Actor, ACTOR_SYSTEM],
				[Dialog.Text, "Uma espaçonave vermelha, que parece ter vindo de outra galáxia"],
				[Dialog.Text, "Atrás está escrito 'Feito na China'."],
			],
		},
		oni: {
			events : [
				[Dialog.Actor, ACTOR_SYSTEM],
				[Dialog.Text, "Onis são criaturas enormes e amedrontadoras que perseguiam samurais"],
				[Dialog.Text, "O canto dessa máscara está suja de bolo de aniversário."],
			],
		},
		controle: {
			events : [
				[Dialog.Actor, ACTOR_SYSTEM],
				[Dialog.Text, "Quem iria ver TV em uma masmorra?"],
				[Dialog.Text, "Talvês espíritos demoníacos entediados."],
			],
		},
	}

	return dialogues;
}

