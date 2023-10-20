% Lucca Lucchin de Campos Costa
% Drayan Silva Magalhães
% Matheus Gabriel Pereira Nogueira
% João Vitor Zambão

% 4. O quebra-cabeça do Sudoku é um jogo de lógica e colocação de números. O objetivo é
% preencher um tabuleiro de 9x9 células, que está dividido em 9 quadrados de 3x3 células. As
% regras são simples:
% a. Cada linha do tabuleiro de 9x9 deve conter todos os dígitos de 1 a 9 sem repetições.
% b. Cada coluna do tabuleiro de 9x9 deve também conter todos os dígitos de 1 a 9 sem
% repetições.
% c. Cada um dos 9 quadrados de 3x3 deve conter todos os dígitos de 1 a 9 sem repetições.
% Algumas células já vêm preenchidas com números. Esses números são chamados de "dicas".
% O número de dicas e sua disposição variam em cada quebra-cabeça, e é com base neles que
% você deve completar o tabuleiro.
% O desafio aqui é usar Prolog para criar um solver de Sudoku que pode preencher qualquer
% tabuleiro 9x9 válido. O solver deve ser capaz de receber um tabuleiro parcialmente
% preenchido e devolver a solução completa. Para resolver, insira os números das "dicas" em
% uma lista de listas que represente o tabuleiro e execute sudoku(Tabuleiro). O Prolog
% preencherá os espaços vazios para completar o tabuleiro. No link a seguir você pode
% encontrar tabuleiros a serem resolvidos: Sudoku - New York Times Number Puzzles - The New
% York Times (nytimes.com) use o modo hard

sudoku(Lins) :-
    length(Lins, 9),
    maplist(same_length(Lins), Lins),
    append(Lins, Vs),
    Vs ins 1..9,
    maplist(all_distinct, Lins),
    transpose(Lins, Cols),
    maplist(all_distinct, Cols),
    Lins = [As, Bs, Cs, Ds, Es, Fs, Gs, Hs, Is],
    squares(As, Bs, Cs),
    squares(Ds, Es, Fs),
    squares(Gs, Hs, Is).

squares([], [], []).
squares([N1, N2, N3|Ns1],
        [N4, N5, N6|Ns2],
        [N7, N8, N9|Ns3]) :-
    all_distinct([N1, N2, N3, N4, N5, N6, N7, N8, N9]).

% sample query:
% 
% Lins = [[_,_,3,_,1,_,_,_,6],
% [_,1,_,_,5,8,_,_,_],
% [_,_,_,_,9,_,_,_,_],
% [5,_,_,_,_,_,_,4,1],
% [_,_,_,_,_,7,5,_,_],
% [2,_,4,_,_,_,8,_,_],
% [7,_,_,_,4,_,_,1,3],
% [_,9,_,_,_,2,_,_,_],
% [_,_,_,_,8,_,9,7,_]],
% sudoku(Lins),
% maplist(label, Lins),
% maplist(portray_clause, Lins).