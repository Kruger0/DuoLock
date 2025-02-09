
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
		anne_1: {
			events: [
				[Dialog.Actor, ACTOR_ANNE],
				[Dialog.Text, "Que lugar inusitado para uma loja. Vê algo interessante, aqui?"],
			
				[Dialog.Actor, ACTOR_PLAYER],
				[Dialog.Text, "Parece que têm algumas [#ff3010]ervas e poções úteis[/c]. Talvez algo para nossa jornada."],
		
				[Dialog.Actor, ACTOR_ANNE],
				[Dialog.Text, "Você também está indo para a [#30f420]pousada na floresta[/c]?"],
			
				[Dialog.Actor, ACTOR_PLAYER],
				[Dialog.Text, "Sim, estou a caminho. O que o traz aqui?"],
			
				[Dialog.Actor, ACTOR_ANNE],
				[Dialog.Text, "Estou procurando abrigo e uma [rainbow]refeição quente[/rainbow]."],
			
				[Dialog.Actor, ACTOR_PLAYER],
				[Dialog.Text, "Parece que encontrou o lugar certo, então."],
			
				[Dialog.Actor, ACTOR_ANNE],
				[Dialog.Text, "Ah, desculpe, qual é o seu nome?"],
			
				[Dialog.Actor, ACTOR_PLAYER],
				[Dialog.Text, "Pode me chamar de [#00C19A]Sam[/c]. Prazer em conhecê-la."],
			
				[Dialog.Actor, ACTOR_ANNE],
				[Dialog.Text, "Igualmente, Sam. Vamos pegar alguma coisa para comer?"]
			]
		},
		
		sign_1: {
			events: [ 
				[Dialog.Actor, ACTOR_SIGN],
				[Dialog.Text, "Pousada da floresta a direitaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa."],
			
				//[Dialog.Callback, instance_create_depth, [mouse_x, mouse_y, 0, obj_trees]],
				[Dialog.Callback, window_center],
				
				[Dialog.Text, "Agora acho q foi"],
			
				//[Dialog.Actor, ACTOR_PLAYER],
				//[Dialog.Text, "Para a direita nós vamos!"],
			]
		},
		
		sign_2: {
			events: [
				[Dialog.Actor, ACTOR_SIGN],
				[Dialog.Text, "Pousada da floresta!"],
			
				[Dialog.Actor, ACTOR_PLAYER],
				[Dialog.Text, "Finalmente cheguei!"],
			]
		},
		
		sign_3: {
			events: [
				[Dialog.Actor, ACTOR_SIGN],
				[Dialog.Text, "Guarda putasso ao sul"],
				
				[Dialog.Actor, ACTOR_PLAYER],
				[Dialog.Text, "...guarda putasso?"],
				[Dialog.Text, "Vou investigar"],
			]
		},
		
		tree_1: {
			events:[
				[Dialog.Actor, ACTOR_PLAYER],
				[Dialog.Text, "É uma arvore."],
				[Dialog.Text, "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"],
			
				[Dialog.PortClear],
				[Dialog.Text, "De fato, era uma arvore."],
			]
		},
		
		test: {
			events: [
				[Dialog.Actor, ACTOR_SIGN],
				[Dialog.Text, "É apenas um texto."],
			
				[Dialog.Actor, ACTOR_SYSTEM],
				[Dialog.Text, "Mensagem do sistema."],
			]
		},
		
		vendor_1: {
			events: [
				[Dialog.PortName, "[rainbow]Vendedor[/rainbow]"],
				[Dialog.Text, "Loja do mercador da floresta!"],
				[Dialog.Text, "Os melhores suprimentos pra te manter acordado na sua jornada."],
				[Dialog.Text, "No momento sem estoque."],
			]
		},
		
		sensei_1: {
			events: [
				[Dialog.Actor, ACTOR_SENSEI],
				[Dialog.Text, "Fala meu fio"],
				
				[Dialog.Actor, ACTOR_ANNE],
				[Dialog.Text, "Com os atores, dá pra vários personagens"],
				
				[Dialog.Actor, ACTOR_PLAYER],
				[Dialog.Text, "Falarem na mesma conversa?"],
				
				[Dialog.Actor, ACTOR_SIGN],
				[Dialog.Text, "Isso mesmo. Tá olhando o quê? Nunca viu placas falarem??"],
				
				[Dialog.Actor, ACTOR_PLAYER],
				[Dialog.Text, "Estranho."],
				[Dialog.Text, "Bom, de qualquer maneira, vou indo nessa, ainda tem muita coisa pra resolver."],
				[Dialog.Text, "Até breve."],
			]
		},
		
		kobold_1: {
			events: [
				[Dialog.Text, "Rala fio"],
				[Dialog.Text, "Esqueceram de fazer meu portrait"],
				[Dialog.PortAnim, spr_kobold_portrait],
				[Dialog.Text, "Mas isso deve funcionar."],
				[Dialog.Text, "[rainbow]Funcionou."],
				[Dialog.Text, "Agora mete o pé"],
				
				[Dialog.Actor, ACTOR_PLAYER],
				[Dialog.Text, "Pode crê, mas antes, qualé teu nome?"],
				
				[Dialog.PortClear],
				[Dialog.VoicePitch, 1.0],
				[Dialog.PortAnim, spr_kobold_portrait],
				[Dialog.PortName, "Guarda desconhecido"],
				[Dialog.Text, "Ih, tem isso..."],
				[Dialog.PortName, "Jurací"],
				[Dialog.Text, "Pronto, sou o Jurací. Feliz agora?"],
				
				[Dialog.Actor, ACTOR_PLAYER],
				[Dialog.Text, "Um guarda putasso com essa voz?"],
				
				[Dialog.PortClear],
				[Dialog.VoicePitch, 1.0],
				[Dialog.PortAnim, spr_kobold_portrait],
				[Dialog.PortName, "Jurací"],
				[Dialog.Text, "Pois fique sabendo"],
				[Dialog.VoicePitch, 0.7],
				[Dialog.Text, "[speed, 0.5]Que eu posso ter"],
				[Dialog.VoicePitch, 0.5],
				[Dialog.Text, "[speed, 0.5][shake][c_red]A voz que eu quiser"],
				[Dialog.VoicePitch, 1.4],
				[Dialog.Text, "[/speed]Entendeu?"],
				
				[Dialog.Actor, ACTOR_PLAYER],
				[Dialog.Text, "Tendeu."],
			]
		},
	}

	return dialogues;
}

