%****************************************
%Darius Little 
%10/3/2017
%***********************************************************************

%1. Absolute Value

abs(X,Y) :- 
    X < 0,
    Y is -X;
    X is Y.



%***********************************************************************
% 2. Odd List

oddList([], []).
oddList([_],[]).


oddList([_|T], L) :-
evenList(T, L).


%***********************************************************************
 %3. Even List


evenList([],[]).
evenList([H],[H]).
evenList([H1 |[_|T]], [H1|L]) :-
evenList(T, L).

%***********************************************************************

%4. Merge Lists

mergeLists(L,[],L).
mergeLists([], List, List).
mergeLists([H1|T1], [H2|T2], L) :-
    H1 =< H2,
    merge(T1, [H2|T2], L3),
    L = [H1|L3].
mergeLists([H1|T1], [H2|T2], L) :-
    H1 > H2, 
    merge(T2, [H1|T1], L3),
    L = [H2|L3].



%***********************************************************************

%5. Merge Sort
% run sort not merge sort :
%  Example sort([8,5,7,3,9],[3,5,7,8,9]) 


sort([],[],[]).
sort(L,[],L).
sort([H1|T1], [H2|T2], L) :- 
    H1 < H2 -> L = [H1|T], sort(T1,[H2|T2],T) ;
    H1 > H2 -> L = [H2|T], sort([H1|T1],T2,T) ;
    L = [H1,H2|T], sort(T1,T2,T),mergeSort(T,L).

mergeSort([],List):-
    [] is List.


%************************************************************************

/*6 Animal Puzzle
* input: animal_owner(AnimalKeeper,animal you are searchin for keeper for).
example: 
animal_owner(AnimalKeeper,zebra)
animal_owner(AnimalKeeper,snailkeeper)
animal_owner(AnimalKeeper,jaguar)
*/

member(H1,[H1|_]).
member(H1,[_|T]) :- 
    member(H1,T).

next(A, B, Ls) :-
     append(_, [A,B|_], Ls).

animal_owner(AnimalKeeper,Animal) :-
	houses(Hs),
	member(h(AnimalKeeper,Animal,_), Hs).

houses(Hs) :-
	length(Hs, 3), 
	member(h('Englishmen',_,red), Hs), 
	member(h('Spanish',jaguar,_), Hs),
	next(h('Japanese',_,_), h(_,snailkeeper,_), Hs), 
	next(h(_,snailkeeper,_), h(_,_,blue), Hs),
	member(h(_,zebra,_), Hs).


%***********************************************************************
%7. Logic Puzzle






