% Lucca Lucchin de Campos Costa
% Drayan Silva Magalhães
% Matheus Gabriel Pereira Nogueira
% João Vitor Zambão

% 1. Em um universo paralelo, Marcelo, Paulo e Augusto estão presos em uma masmorra escura
% e fria. Em desespero por uma saída os três rapazes encontram três portas de cores diferentes,
% vermelha, azul e verde. Atrás de uma destas portas está o caminho da liberdade. Atrás das
% outras duas portas está Drogon sedento de sangue. Abrir uma destas portas significa morte
% certa. Não bastasse isso, mesmo no escuro é possível ver uma inscrição em cada porta:
% a. Porta Vermelha: A liberdade está atrás desta porta;
% b. Porta Azul: A liberdade não está atrás desta porta;
% c. Porta Verde: A liberdade não está atrás da porta Azul.
% Sabendo que, pelo menos uma as três declarações é verdadeira e que pelo menos
% uma das declarações é falsa, que porta leva a liberdade?

redIsTrue(red).

blueIsTrue(red).
blueIsTrue(green).

greenIsTrue(red).
greenIsTrue(green).

oneTrue(red):- 
    blueIsTrue(red); greenIsTrue(red); redIsTrue(red).
oneTrue(blue):- 
    blueIsTrue(blue); greenIsTrue(blue); redIsTrue(blue).
oneTrue(green):- 
    blueIsTrue(green); greenIsTrue(green); redIsTrue(green).

oneFalse(red):-
    \+ (blueIsTrue(red), greenIsTrue(red), redIsTrue(red)).
oneFalse(blue):-
    \+ (blueIsTrue(blue), greenIsTrue(blue), redIsTrue(blue)).
oneFalse(green):-
    \+ (blueIsTrue(green), greenIsTrue(green), redIsTrue(green)).

freedom(red):- oneTrue(red), oneFalse(red).
freedom(blue):- oneTrue(blue), oneFalse(blue).
freedom(green):- oneTrue(green), oneFalse(green).

% sample query:
% 
% freedom(red).
% freedom(blue).
% freedom(green).