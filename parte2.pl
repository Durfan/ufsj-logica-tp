peixes(Y):- salmao(Y);tubarao(Y).     % Se X é um salmão, então ele é peixe
canario(piupiu).                      % Porque não consigo isso
morcego(vamp).                        % vamp é um morcego
avestruz(xica).                       % xica é um avestruz
vaca(mimosa).                         % mimosa é uma vaca
salmao(alfred).                       % alfred é um salmão
tubarao(tutu).                        % tutu é um tubarão
peixes(nemo).                         % nemo é um peixe
passaros(X):-canario(X);avestruz(X).  % Se X é canário, então ele é um passaro
mamiferos(X):-morcego(X).             % um morcego é um mamífero
%passaros(X):-avestruz(X).            % Se X é um avestruz, então X é um passaro
mamiferos(X):-vaca(X).                % Se X é uma vaca, então X é um maífero
%peixes(X):.                          % porque essa linha da erro.
%voar(-X),anda(X)
animal(X):- peixes(X);mamiferos(X);passaros(X). % Se X é peixe,,mamifero ou passaro,X é um animal
pele(X):-animal(X).                             % Se X é um animal, então X tem pele
voar(-X):- avestruz(X).                         % Se o passaro for um avestruz, entao ele não voa
voar(X) :- passaros(X).                         % Se X é passaro, então X pode voar
asas(X) :- passaros(X).                         % Se X é passaro, então X possui asas
nadar(X):- peixes(X).                           % Se X é um peixe, então X possui consegue nadar
nadadeiras(X):- peixes(X).                      % Se X é um peixe, então X possui nadadeiras
/* TODO: Testar... */
%ovos(-X):- tubarao(X).                         % Se X é tubarão, então ele náo põe ovos
/* -------------- */
ovos(X):- passaros(X);peixes(X);tubarao(X).     % Se X é um passaro ou um peixe, então X põe ovos
anda(-X):- morcego(X).
anda(X):- mamiferos(X).                         % Se X é um mamífero, então ele anda
grande(X):- avestruz(X).                        % Se o passaro for um avestruz, ele é grande
%voar(-X):- avestruz(X).                        % Se o passaro for um avestruz, entao ele não voa

/* TODO: Corrigir esse erros abaixo */

filhotesformados(X) :- tubarao(X).              % Filhotes de tubarão nascem formados.
%salmão(alfred).
delicia(X):- salmao(X).                         % Se X é um salmão e é uma delícia
amarelo(X):-canario(X).                         % Se X é canário, então ele é amarelo
leite(X):-vaca(X).                              % Se X é uma vaca, então X dá leite
carne(X):-vaca(X).                              % Se X é uma vaca, então X dá carne

/* para fazer negação, e so colocar o simbolo de m */