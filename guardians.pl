% Lucca Lucchin de Campos Costa
% Drayan Silva Magalhães
% Matheus Gabriel Pereira Nogueira
% João Vitor Zambão

% 2. Em um universo onde todos, menos você, mentem, você precisa chegar ao centro de um
% labirinto para impedir a destruição de uma galáxia muito, muito distante. Finalmente, depois
% de horas de caminhada você chegou a um ponto onde existem três possíveis estradas. A
% estrada à sua esquerda está pavimentada com ouro, a estada à sua frente está pavimentada
% com o mais fino Mármore de Carrara e a estrada à sua direita é pavimentada com pequenas
% pedras preciosas. Cada estrada é protegida por um guardião e, antes que você perguntasse
% qualquer coisa, eles começam a falar:
% a. O Guardião da Estrada Dourada diz: “Esta estrada irá levá-lo diretamente ao centro
% do labirinto. Contudo, se pedras preciosas o levarem ao centro então o mármore
% também levará”.
% b. O Guardião da Estrada de Mármore de Carrara diz: “Nem ouro, nem pedras preciosas
% o levarão ao centro do labirinto”.
% c. O Guardião da Estrada de Pedras preciosas diz: “Siga o ouro e você chegará ao centro
% do labirinto, siga o mármore e estará perdido”.
% Escolha a estrada que o levará ao centro do labirinto antes que seja tarde.

statement(gold, RightPath) :- 
    gold \= RightPath,
    stones == RightPath;
    marble \= RightPath.

statement(marble, RightPath) :-
    gold == RightPath;
    stones == RightPath.

statement(stones, RightPath) :-
    gold \= RightPath;
    marble == RightPath.

answer(Path) :-
    member(Path, [gold, stones, marble]),
    statement(gold, Path),
    statement(marble, Path),
    statement(stones, Path).

% sample query:
% 
% answer(Path).