/* LEGENDA PARA VARIAVEIS ---------------------------------------
	L == Lista
	X, Y, Z == Variáveis auxiliares
	Cab == Cabeça de uma lista
	Cald == Calda de uma lista
----------------------------------------------------------------- */

/* LEGENDA DE FUNÇÕES -------------------------------------------
	insereInicio( elemento, lista de entrada, lista de saida).
	membro(elemento, lista de entrada).
	insereInincio( elemento,lista de entrada, lista de saida).
	insereFim( lista de entrada, elemento, lista de saida).
	insereN( elemento, posicao, lista de entrada, lista de saida).
	removeN( posicao, lista de entrada, lista de saida).
	interseccao( lista de entra, lista de entrada, lista de saida).
----------------------------------------------------------------- */

/* Insere um elemento no início de uma lista. */
insereInicio(Y, [], [Y]).
insereInicio(Y, L, [Y|L]).

/* Verifica se um dado elemento esta contido na lista. */
membro(Y, [Y | _]).
membro(Y, [_ | Cald]) :- membro(Y, Cald).
remover(X,[X|C],C).	
remover(X,[Y|C],[Y|D]):-remover(X,C,D).

/* A) Um predicado que insira um elemento no final da lista. */
insereFim([], Y, [Y]).
	/*  Caso a lista esteja vazia Y é inserido na cabeca da lista de saída. */         
insereFim([Cab|Cald], Y, [Cab|Cald1]) :- insereFim(Cald, Y, Cald1).                 
	/*  A função passa a calda da lista para sua chamada recursiva até que a
	mesma se torne uma lista vazia, é ai então que se chega a condição de 
	parada na linha superior. */

/* B) Um predicado que insira um elemento em uma determinada posição da lista. */
insereN(X,0,Cald,[X|Cald]).
	/* Caso a posicao desejada seja 0 então a lista de saída recebe a variável
	comum cabeça e a lista de entrada como calda. */
insereN(X,Y,[Cab|Cald],[Cab|Cald1]):-Y1 is Y-1, insereN(X,Y1,Cald,Cald1).
	/* O predicado executa a chamada recursiva com as caldas das listas de entrada
	e saida alem da posicao desejada  com o decremento de 1, até o ponto em que a
	chamda chegue a caso base. */

/* C) Um predicado que remova um elemento em uma determinada posição da lista. */
removeN(0,[_|Cald],Cald):- !.
	/* No caso em que a posição em que se deseja excluir é o primeiro item da lista,
	a lista de saida recebe a lista sem a sua respectiva cabeça. */
removeN(Y,[Cab|Cald],L):- Y1 is Y - 1, removeN(Y1,Cald, L1), insereInicio(Cab, L1, L).
	/* O predicado faz a chamada recursiva decrementando o elemento posicao e chamando
	e a funcao de inserção no inicio na intencao de gerar uma sub lista, o que exclui
	a necessidade de reescrever a lista a cada modificacao. */   

/* D) Um predicado que forneça a intersecção de duas listas. */
interseccao([Cab | Cald], L, [Cab |Cald1]) :- membro(Cab, L), interseccao(Cald, L, Cald1).
interseccao([_ |Cald], L, L1) :- interseccao(Cald, L, L1). 
interseccao(_, _, []).

/* E) Um predicado que identifique se um conjunto de elementos está contido em uma
lista (os elementos do conjunto podem estar em qualquer ordem na lista). */
contido([Cab|_],L) :- membro(Cab,L).
contido([Cab|Cald], L):- membro(Cab,L), contido(Cald, L).

/* F) Um predicado que retorne o maior valor contido em uma lista numérica. */
maior([Y],Y).
maior([Cab|Cald],Z) :- maior(Cald,X), (X > Cab -> Z = X; Z = Cab).

/* G) Um predicado denominado ordena(X, Y) onde Y é uma versão ordenada da lista X. */
ordena([],[]).
ordena(L,L4):-  maior(L,X), remover(X,L,L2),insereInicio(X,L1,L4),ordena(L2,L1) . 

/* H) Um predicado para obter a soma dos N primeiros números naturais. */
nPrimeiros(0,0).
nPrimeiros(X,Y):- X1 is X-1, nPrimeiros(X1,Y1),Y is Y1 + X.

/* I) Escreva um predicado denominado palíndromo(X) que é verdadeiro se X é uma lista 
cujos elementos invertidos produzem a mesma ordem original. */
palindromo(X):- reverse(X, X).

/* J) Escreva um predicado denominado acomoda/2 cujo primeiro argumento é uma lista permitindo 
listas como elementos (ex. [a, [a, [b, c]], b, [c, d]]) e cujo segundo argumento é outra lista 
com todos os elementos da primeira acomodados em uma única lista (ex. [a, a, b, c, b, c, d]. */
%insereFim([], Y, [Y]).
concatena([],L,L).
concatena([X|L1],L2,[X|L3]):-concatena(L1,L2,L3).
lista(X) :- var(X) ,!,fail.
lista([]).
lista([_|T]) :- lista(T).
%acomoda([Cab|_],[Cab]).
%acomoda([Cab|Cald],L):- acomoda(Cab,L1),acomoda(Cald,L2), concatena(L1,L2,L).
%acomoda([],[]).
%acomoda([H|_],[H]).
%acomoda([H|T],L):- acomoda(H,L1),acomoda(T,L2),concat(L1,L2,L). 
%acomoda(H,[H]):- H\=[],H\=[_|_].
acomoda([], []).
acomoda(L, [H|[]]) :- lista(H), acomoda(L, H).
acomoda(L, [H|[]]) :- L = [H].
acomoda(L, [H|T]) :- acomoda(L1, [H]), acomoda(L2, T), concatena(L1, L2, L).