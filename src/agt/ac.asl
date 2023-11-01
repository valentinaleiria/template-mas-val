// Agent gui in project aula10

/* Initial beliefs and rules */

temperatura_de_preferencia(jonas,25).

/* Initial goals */

!inicializar_AC.

+!inicializar_AC
  <- 	makeArtifact("ac_quarto","artifacts.AC",[],D);
  	   	focus(D);
  	   	!definir_temperatura;
  	   	!!climatizar.

+alterado : temperatura_ambiente(TA) & temperatura_ac(TAC)
  <-  .drop_intention(climatizar);
  	  .print("Houve intera��o com o AC");
  	  .print("Temperatura Ambiente: ", TA);
 	  .print("Temperatura Desejada: ", TAC);
  	  !!climatizar.
      
+closed  <-  .print("Close event from GUIInterface").
   
 +!definir_temperatura: temperatura_ambiente(TA) & temperatura_ac(TAC) 
 			& temperatura_de_preferencia(User,TP) & TP \== TD & ligado(false)
 	<-  definir_temperatura(TP);
 		.print("Definindo temperatura baseado na prefer�ncia do usu�rio ", User);
 		.print("Temperatura: ", TP).
 	
 +!definir_temperatura: temperatura_ambiente(TA) & temperatura_ac(TAC) & ligado(false)
 	<-  .print("Usando ultima temperatura");
 		.print("Temperatura: ", TAC).
 		
 		
 +!climatizar: temperatura_ambiente(TA) & temperatura_ac(TAC) & TA \== TAC & ligado(false)
 	<-   ligar;
 		.print("Ligando AC");
 		.print("Temperatura Ambiente: ", TA);
 		.print("Temperatura Desejada: ", TAC);
 		.wait(1000);
 		!!climatizar.
 		
 +!climatizar: temperatura_ambiente(TA) & temperatura_ac(TAC) & TA \== TAC & ligado(true) 
 	<-  .print("Aguardando regularizar temperatura para desligar!");
 		.print("Temperatura Ambiente: ", TA);
 		.print("Temperatura Desejada: ", TAC);
 		.wait(1000);
 		!!climatizar.
 		 	
  +!climatizar: temperatura_ambiente(TA) & temperatura_ac(TAC) & TA == TAC & ligado(true) 
 	<-   desligar;
 		.print("Desligando AC");
 		.print("Temperatura Ambiente: ", TA);
 		.print("Temperatura Desejada: ", TAC).

 +!climatizar 
 	<- 	.print("Nao foram implementadas outras opcoes");
 		.print("TEMPERATURA REGULARIZADA").


