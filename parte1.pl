/* Insere um elemento no início de uma lista */
insereInicio(H, L, [H|L]):- !.

/* a) Um predicado que insira um elemento no final da lista. */
insereFim(T, [H], L):- insereInicio(H,[T],L), !.
insereFim(N, [H|T], L):- insereFim(N,T,X), insereInicio(H, X, L).

/* b) Um predicado que insira um elemento em uma determinada posição da lista. */
insereN(X,0,L,[X|L]).
insereN(X,N,[C|L],[C|R]):-N1 is N-1, insereN(X,N1,L,R).

/* c) Um predicado que remova um elemento em uma determinada posição da lista. */
removeind(0,[_|T],T):- !.
removeind(I,[H|T],R):- X is I - 1, removeind(X, T, Y), insereInicio(H, Y, R).

/* d) Um predicado que forneça a intersecção de duas listas. */
membro(X, [X | _]).
membro(X, [_ | C]) :-
    membro(X, C).

intersec([X | Y], L, [X |Z]) :-
    membro(X, L),
    intersec(Y, L, Z).
intersec([_ |X], L, Y) :-
    intersec(X, L, Y).
    intersec(_, _, []).

/* f) Um predicado que retorne o maior valor contido em uma lista numérica. */
maior([L],L).
maior([H|L],R) :- maior(L,A), (A > H -> R = A; R = H).

/* g) Um predicado denominado ordena(X, Y) onde Y é uma versão ordenada da lista X. */
ordena(X,Y):-
    sort(X,Y).

/* i) Escreva um predicado denominado palíndromo(X) que é verdadeiro se X é uma
lista cujos elementos invertidos produzem a mesma ordem original. */
palindromo(X):-
    reverse(X, X).

