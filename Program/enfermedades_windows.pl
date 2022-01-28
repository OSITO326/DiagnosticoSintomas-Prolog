%Uso de Librerias
:-use_module(library(pce)).
:-use_module(library(pce_style_item)).

esrespuesta('si').
esrespuesta('no').


%Gripe-Resfrio
espregunta('Tiene dolor de garganta?',X):-esrespuesta(X).
espregunta('Tiene tos?',X):-esrespuesta(X).
espregunta('Tiene abundante secreción?',X):-esrespuesta(X).
espregunta('Tiene sensación de cansancio?',X):-esrespuesta(X).
espregunta('Tiene irritación ocular?',X):-esrespuesta(X).
espregunta('Tiene fiebre continua?',X):-esrespuesta(X).
espregunta('Tiene dolor de cabeza?',X):-esrespuesta(X).
espregunta('Tiene vómitos?',X):-esrespuesta(X).
espregunta('Tiene diarrea?',X):-esrespuesta(X).
espregunta('Tiene congestión nasal?',X):-esrespuesta(X).
espregunta('Tiene dolores musculares?',X):-esrespuesta(X).
%DENGUE
espregunta('Tiene dolor de cabeza?',X):-esrespuesta(X).
espregunta('Tiene dolor intenso en el cuerpo?',X):-esrespuesta(X).
espregunta('Tiene tos seca?',X):-esrespuesta(X).
espregunta('Tiene dolor ocular?',X):-esrespuesta(X).
espregunta('Tiene dolor en las articulaciones?',X):-esrespuesta(X).
espregunta('Tiene diarrea?',X):-esrespuesta(X).
espregunta('Tiene muchas manchas de sangre bajo la piel?',X):-esrespuesta(X).
espregunta('Tiene insuficiencia renal?',X):-esrespuesta(X).
%CORONAVIRUS
espregunta('Dolor de cabeza?',X):-esrespuesta(X).
espregunta('Fiebre?',X):-esrespuesta(X).
espregunta('Tos seca?',X):-esrespuesta(X).
espregunta('Dificultad respiratoria?',X):-esrespuesta(X).
espregunta('Congestion nasal?',X):-esrespuesta(X).
espregunta('Orina amarilla?',X):-esrespuesta(X).
espregunta('Diarrea?',X):-esrespuesta(X).
espregunta('Neumonia?',X):-esrespuesta(X).
espregunta('Infeccion en los oidos?',X):-esrespuesta(X).
espregunta('Nauseas?',X):-esrespuesta(X).
espregunta('Malestar general?',X):-esrespuesta(X).
espregunta('Sudoracion?',X):-esrespuesta(X).
%PRINCIPAL
espregunta('Fiebre alta 40 C ?',X):-esrespuesta(X).
espregunta('Dificultades respiratorias ?',X):-esrespuesta(X).
espregunta('Congestion nasal ?',X):-esrespuesta(X).

%RECOMENDACIONES
recomendaciones:-new(D,dialog('RECOMENDACIONES')),
         new(L,label(n,'',font('times','roman',19))),
         new(L2,label(n,'',font('times','roman',17))),

         mostrar('C:/programa/recomendaciones.jpg',D),


         send(D,append,L),
         send(D, append,L2),
         send(D,open).
%INTEGRANTES
integrantes:-new(D,dialog('INTEGRANTES')),
         new(L,label(n,'',font('times','roman',19))),
         new(L2,label(n,'',font('times','roman',17))),

         mostrar('C:/programa/integrantes.jpg',D),


         send(D,append,L),
         send(D, append,L2),
         send(D,open).
main:-
        new(D,dialog('SISTEMA DE DIAGNOSTICO DE ENFERMEDADES')),
        send(D,size,size(560,400)),
        send(D,colour,colour(black)),
        send(D, append, new(Menu, menu_bar)),
        send(Menu, append, new(Iniciar, popup(iniciar))),
        send(Menu, append, new(Recomendaciones, popup(recomendaciones))),
        send(Menu, append, new(Integrantes, popup(integrantes))),
        send_list(Iniciar, append,
                         [ menu_item(iniciar, message(@prolog,pp))
                         ]),
        send_list(Recomendaciones, append,
                         [ menu_item(recomendaciones, message(@prolog, recomendaciones))
                         ]),
        send_list(Integrantes, append,
                         [ menu_item(integrantes, message(@prolog, integrantes))
                         ]),
        mostrar('C:/programa/enfermera.jpg',D,Menu),
        send(D,open,point(200,200)).

halt.qsave_program('C:/programa/ejecutable.exe', [stand_alone(true), goal(main)]).

mostrar(V,D,M):- new(I, image(V)),
        new(B, bitmap(I)),
        new(F2, figure),
        send(F2, display, B),
        new(D1, device),
        send(D1, display, F2),
        send(D, display, D1),
        send(D1,below(M)).

pp:-new(D,dialog('PREGUNTAS')),
        new(Pre1,menu('Fiebre alta 40 C ?')),
       send_list(Pre1,append,[si , no]),
        new(Pre2,menu('Dificultades respiratorias ?')),
        send_list(Pre2,append,[si,no]),
        new(Pre3,menu('Congestion nasal ?')),
        send_list(Pre3,append,[si,no]),
          send(D,append(Pre1)),
       send(D,append,Pre2),
       send(D,append,Pre3),

      new(B,button(siguiente,and(message(@prolog,principal,Pre1?selection,Pre2?selection,Pre3?selection),message(D,destroy)))),
      send(D,append,B),
      send(D,default_button,siguiente),
        send(D,open,point(350,350)).



%PARA DENGUE
principal(P1,P2,P3):-
espregunta('Fiebre alta 40 C ?',P1),P1='si',
espregunta('Dificultades respiratorias ?',P2),P2='no',
espregunta('Congestion nasal ?',P3),P3='no',
pl.
%PARA CORONA
principal(P1,P2,P3):-
espregunta('Fiebre alta 40 C ?',P1),P1='no',
espregunta('Dificultades respiratorias ?',P2),P2='si',
espregunta('Congestion nasal ?',P3),P3='no',
ph.
%GRIPE-RESFRIO
principal(P1,P2,P3):-
espregunta('Fiebre alta 40 C ?',P1),P1='no',
espregunta('Dificultades respiratorias ?',P2),P2='no',
espregunta('Congestion nasal ?',P3),P3='si',
pho.

principal(_,_,_):-new(D,dialog('ERROR')),
new(L,label(l,'ELIJA SOLO UNA OPCION',font('times','roman',16))),
send(D,append,L),
send(D,open,point(350,350)).

%gripe/resfrio
pho:-new(D,dialog('PREGUNTAS')),
        new(Pre1,menu('Tiene dolor de garganta?')),
       send_list(Pre1,append,[si , no]),
        new(Pre2,menu('Tiene tos?')),
        send_list(Pre2,append,[si,no]),
        new(Pre3,menu('Tiene abundante secreción?')),
        send_list(Pre3,append,[si,no]),
        new(Pre4,menu('Tiene sensación de cansancio?')),
        send_list(Pre4,append,[si,no]),
        new(Pre5,menu('Tiene irritación ocular?')),
       send_list(Pre5,append,[si,no]),
        new(Pre6,menu('Tiene fiebre continua?')),
         send_list(Pre6,append,[si,no]),
         new(Pre7,menu('Tiene dolor de cabeza?')),
         send_list(Pre7,append,[si,no]),
         new(Pre8,menu('Tiene vómitos?')),
         send_list(Pre8,append,[si,no]),
         new(Pre9,menu('Tiene diarrea?')),
         send_list(Pre9,append,[si,no]),
         new(Pre10,menu('Tiene congestión nasal?')),
         send_list(Pre10,append,[si,no]),
         new(Pre11,menu('Tiene dolores musculares?')),
         send_list(Pre11,append,[si,no]),
       send(D,append(Pre1)),
       send(D,append,Pre2),
       send(D,append,Pre3),
       send(D,append,Pre4),
       send(D,append,Pre5),
       send(D,append(Pre6)),
       send(D,append(Pre7)),
       send(D,append(Pre8)),
       send(D,append(Pre9)),
       send(D,append(Pre10)),
       send(D,append(Pre11)),
       new(B1,button(atras,and(message(@prolog,pp),message(D,destroy)))),
                new(B,button(siguiente,message(@prolog,grippe_resfrio,Pre1?selection,Pre2?selection,Pre3?selection,Pre4?selection,Pre5?selection,Pre6?selection,Pre7?selection,Pre8?selection,Pre9?selection,Pre10?selection,Pre11?selection))),
                 send(D,append,B1),
                send(D,append,B),

        send(D,open,point(300,300)).
%gripe
grippe_resfrio(P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11):-
        espregunta('Tiene dolor de garganta?',P1),P1='si',
        espregunta('Tiene tos?',P2),P2='si',
        espregunta('Tiene abundante secreción?',P3),P3='si',
        espregunta('Tiene sensación de cansancio?',P4),P4='si',
        espregunta('Tiene irritación ocular?',P5),P5='no',
        espregunta('Tiene fiebre continua?',P6),P6='si',
        espregunta('Tiene dolor de cabeza?',P7),P7='si',
        espregunta('Tiene vómitos?',P8),P8='si',
        espregunta('Tiene diarrea?',P9),P9='si',
        espregunta('Tiene congestión nasal?',P10),P10='no',
        espregunta('Tiene dolores musculares?',P11),P11='si',

        pf2('C:/programa/gripe.jpg','','C:/programa/recomendacion_gripe2.jpg').
%resfrio comun
grippe_resfrio(P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11):-
        espregunta('Tiene dolor de garganta?',P1),P1='si',
        espregunta('Tiene tos?',P2),P2='si',
        espregunta('Tiene abundante secreción?',P3),P3='si',
        espregunta('Tiene sensación de cansancio?',P4),P4='no',
        espregunta('Tiene irritación ocular?',P5),P5='si',
        espregunta('Tiene fiebre continua?',P6),P6='no',
        espregunta('Tiene dolor de cabeza?',P7),P7='no',
        espregunta('Tiene vómitos?',P8),P8='no',
        espregunta('Tiene diarrea?',P9),P9='no',
        espregunta('Tiene congestión nasal?',P10),P10='si',
        espregunta('Tiene dolores musculares?',P11),P11='no',
%falta recomendacion resfrio
   pf4('C:/programa/resfrio.jpg','','C:/programa/recomendacion_resfrio.jpg').
grippe_resfrio(_,_,_,_,_,_,_,_,_,_,_):-new(D,dialog('ERROR')),
new(L,label(l,'SINTOMA NO DETERMINADO',font('times','roman',16))),
send(D,append,L),
send(D,open,point(350,350)).

%PANTALLA DE CORONAVIRUS
ph:-new(D,dialog('PREGUNTAS')),
        new(Pre1,menu('Dolor de cabeza?')),
       send_list(Pre1,append,[si , no]),
        new(Pre2,menu('Fiebre?')),
        send_list(Pre2,append,[si,no]),
        new(Pre3,menu('Tos seca?')),
        send_list(Pre3,append,[si,no]),
        new(Pre4,menu('Dificultad respiratoria?')),
        send_list(Pre4,append,[si,no]),
        new(Pre5,menu('Congestion nasal?')),
       send_list(Pre5,append,[si,no]),
        new(Pre6,menu('Orina amarilla?')),
         send_list(Pre6,append,[si,no]),
          new(Pre7,menu('Diarrea?')),
         send_list(Pre7,append,[si,no]),
         new(Pre8,menu('Neumonia?')),
         send_list(Pre8,append,[si,no]),
         new(Pre9,menu('Infeccion en los oidos?')),
         send_list(Pre9,append,[si,no]),
         new(Pre10,menu('Nauseas?')),
         send_list(Pre10,append,[si,no]),
         new(Pre11,menu('Malestar general?')),
         send_list(Pre11,append,[si,no]),
         new(Pre12,menu('Sudoracion?')),
         send_list(Pre12,append,[si,no]),

       send(D,append(Pre1)),
       send(D,append,Pre2),
       send(D,append,Pre3),
       send(D,append,Pre4),
       send(D,append,Pre5),
       send(D,append(Pre6)),
       send(D,append(Pre7)),
       send(D,append(Pre8)),
       send(D,append(Pre9)),
       send(D,append(Pre10)),
       send(D,append(Pre11)),
       send(D,append(Pre12)),

       new(B1,button(atras,and(message(@prolog,pp),message(D,destroy)))),
                new(B,button(siguiente,message(@prolog,coronavirus,Pre1?selection,Pre2?selection,Pre3?selection,Pre4?selection,Pre5?selection,Pre6?selection,Pre7?selection,Pre8?selection,Pre9?selection,Pre10?selection,Pre11?selection,Pre12?selection))),
        send(D,append,B1),
      send(D,append,B),
        send(D,open,point(300,300)).


%Coronavirus
coronavirus(P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12):-
espregunta('Dolor de cabeza?',P1),P1='si',
espregunta('Fiebre?',P2),P2='si',
espregunta('Tos seca?',P3),P3='si',
espregunta('Dificultad respiratoria?',P4),P4='si',
espregunta('Congestion nasal?',P5),P5='no',
espregunta('Orina amarilla?',P6),P6='si',
espregunta('Diarrea?',P7),P7='si',
espregunta('Neumonia?',P8),P8='si',
espregunta('Infeccion en los oidos?',P9),P9='no',
espregunta('Nauseas?',P10),P10='si',
espregunta('Malestar general?',P11),P11='si',
espregunta('Sudoracion?',P12),P12='no',
        pf11('C:/programa/coronavirus.jpg','','C:/programa/recomendacion_corona.jpg').
%Posible coronavirus
coronavirus(P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12):-
espregunta('Dolor de cabeza?',P1),P1='no',
espregunta('Fiebre?',P2),P2='si',
espregunta('Tos seca?',P3),P3='no',
espregunta('Dificultad respiratoria?',P4),P4='si',
espregunta('Congestion nasal?',P5),P5='no',
espregunta('Orina amarilla?',P6),P6='si',
espregunta('Diarrea?',P7),P7='si',
espregunta('Neumonia?',P8),P8='si',
espregunta('Infeccion en los oidos?',P9),P9='no',
espregunta('Nauseas?',P10),P10='no',
espregunta('Malestar general?',P11),P11='si',
espregunta('Sudoracion?',P12),P12='no',
        pf1('C:/programa/coronavirus.jpg','','C:/programa/posible_corona.jpg').

coronavirus(_,_,_,_,_,_,_,_,_,_,_,_):-new(D,dialog('ERROR')),
new(L,label(l,'SINTOMA NO DETERMINADO',font('times','roman',16))),
send(D,append,L),
send(D,open,point(350,350)).


%DENGUE
pl:-new(D,dialog('PREGUNTAS')),
         new(Pre1,menu('Tiene dolor de cabeza?')),
       send_list(Pre1,append,[si , no]),
        new(Pre2,menu('Tiene dolor intenso en el cuerpo?')),
        send_list(Pre2,append,[si,no]),
        new(Pre3,menu('Tiene tos seca?')),
        send_list(Pre3,append,[si,no]),
        new(Pre4,menu('Tiene dolor ocular?')),
        send_list(Pre4,append,[si,no]),
        new(Pre5,menu('Tiene dolor en las articulaciones? ')),
       send_list(Pre5,append,[si,no]),
        new(Pre6,menu('Tiene diarrea?         ')),
       send_list(Pre6,append,[si , no]),
        new(Pre7,menu('Tiene muchas manchas de sangre bajo la piel?          ')),
        send_list(Pre7,append,[si,no]),
        new(Pre8,menu('Tiene insuficiencia renal?        ')),
        send_list(Pre8,append,[si,no]),
          send(D,append(Pre1)),
       send(D,append,Pre2),
       send(D,append,Pre3),
       send(D,append,Pre4),
       send(D,append,Pre5),
       send(D,append(Pre6)),
       send(D,append,Pre7),
       send(D,append,Pre8),

       new(B1,button(atras,and(message(@prolog,pp),message(D,destroy)))),
      new(B,button(siguiente,message(@prolog,dengue,Pre1?selection,Pre2?selection,Pre3?selection,Pre4?selection,Pre5?selection,Pre6?selection,Pre7?selection,Pre8?selection))),
      send(D,append,B1),
      send(D,append,B),
        send(D,open,point(300,300)).
%DENGUE
dengue(P1,P2,P3,P4,P5,P6,P7,P8):-
    espregunta('Tiene dolor de cabeza?',P1),P1='si',
    espregunta('Tiene dolor intenso en el cuerpo?',P2),P2='si',
    espregunta('Tiene tos seca?',P3),P3='no',
    espregunta('Tiene dolor ocular?',P4),P4='si',
    espregunta('Tiene dolor en las articulaciones?',P5),P5='si',
    espregunta('Tiene diarrea?',P6),P6='no',
    espregunta('Tiene muchas manchas de sangre bajo la piel?',P7),P7='si',
    espregunta('Tiene insuficiencia renal?',P8),P8='no',
    pf3('C:/programa/dengue.jpg','','C:/programa/recomendacion_dengue.jpg').
%POSIBLE CASO DE DENGUE
dengue(P1,P2,P3,P4,P5,P6,P7,P8):-
        espregunta('Tiene dolor de cabeza?',P1),P1='no',
        espregunta('Tiene dolor intenso en el cuerpo?',P2),P2='si',
        espregunta('Tiene tos seca?',P3),P3='no',
        espregunta('Tiene dolor ocular?',P4),P4='si',
        espregunta('Tiene dolor en las articulaciones?',P5),P5='no',
        espregunta('Tiene diarrea?',P6),P6='no',
        espregunta('Tiene muchas manchas de sangre bajo la piel?',P7),P7='si',
        espregunta('Tiene insuficiencia renal?',P8),P8='no',
        pf5('C:/programa/dengue.jpg','POSIBLE DENGUE','C:/programa/recomendacion_posible_dengue.jpg').
dengue(_,_,_,_,_,_,_,_):-new(D,dialog('ERROR')),
new(L,label(l,'SINTOMA NO DETERMINADO',font('times','roman',16))),
send(D,append,L),
send(D,open,point(350,350)).


image(X):-new(D,dialog('PLAGA')),
        mostrar1(X,D),
%       new(B,label(salir,message(D,destroy))),
        %send(D,append,B),
        send(D,open).




mostrar1(V,D):- new(I, image(V)),
        new(B, bitmap(I)),
        new(F2, figure),
        send(F2, display, B),
        new(D1, device),
        send(D1, display, F2),
        send(D, display, D1).


%POSIBLE CORONA
pf1(X,Y,Z):-new(D,dialog('POSIBLE SINTOMA || RECOMENDACIONES')),
          mostrar2(X,D,20,30),
         send(D, append(label(n,'POSIBLE CORONAVIRUS',font('times','roman',18)))),
         send(D, append(label(n,Y))),
         mostrar2(Z,D,50,510),
         send(D,open).

%CORONA
pf11(X,Y,Z):-new(D,dialog('SINTOMA || RECOMENDACIONES')),
          mostrar2(X,D,30,40),
          new(L,label(n,'USTED TIENE CORONAVIRUS',font('times','roman',18))),
         send(D, append(label(n,Y))),
         send(D, append, L),
         mostrar2(Z,D,50,550),
         send(D,open).


%GRIPE
pf2(X,Y,Z):-new(D,dialog('SINTOMA || RECOMENDACIONES')),
          mostrar2(X,D,40,30),
          new(L,label(n,'USTED TIENE GRIPE',font('times','roman',18))),
         send(D, append(label(n,''))),
         send(D, append(label(n,Y))),
         send(D,append,L),
          mostrar2(Z,D,35,560),
         send(D,open).
%RESFRIO COMUN
pf4(X,Y,Z):-new(D,dialog('SINTOMA || RECOMENDACIONES')),
          mostrar2(X,D,40,40),
          new(L,label(n,'USTED TIENE RESFRIO',font('times','roman',18))),
         send(D, append(label(n,Y))),
         send(D,append,L),
          mostrar2(Z,D,35,560),
         send(D,open).

%DENGUE
pf3(X,Y,Z):-new(D,dialog('SINTOMA || TRATAMIENTO || RECOMENDACIONES')),
          mostrar2(X,D,20,30),
           new(L,label(n,'USTED TIENE DENGUE',font('times','roman',18))),
          send(D,append,L),
           mostrar2(Z,D,10,510),
         send(D,open).

%POSIBLE DENGUE
pf5(X,Y,Z):-new(D,dialog('POSIBLE SINTOMA || RECOMENDACIONES')),
          mostrar2(X,D,20,30),
          new(L,label(n,'POSIBLE DENGUE',font('times','roman',18))),
          send(D,append,L),
          mostrar2(Z,D,10,510),
          send(D,open).



mostrar(V,D):- new(I, image(V)),
        new(B, bitmap(I)),
        new(F2, figure),
        send(F2, display, B),
        new(D1, device),
        send(D1, display, F2),
        send(D, display, D1).

mostrar2(V,D,X,Y):- new(I, image(V)),
        new(B, bitmap(I)),
        new(F2, figure),
        send(F2, display, B),
        new(D1, device),
        send(D1, display, F2),
        send(D, display, D1),
        send(D,display,D1,point(X,Y)).
