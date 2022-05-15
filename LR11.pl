man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).

woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).

parent(voeneg,ratibor).
parent(voeneg,bratislava).
parent(voeneg,velerad).
parent(voeneg,zhdana).

parent(goluba,ratibor).
parent(goluba,bratislava).
parent(goluba,velerad).
parent(goluba,zhdana).

parent(ratibor,svyatoslav).
parent(ratibor,dobrozhir).
parent(lubomila,svyatoslav).
parent(lubomila,dobrozhir).

parent(boguslav,bogomil).
parent(boguslav,bozhedara).
parent(bratislava,bogomil).
parent(bratislava,bozhedara).

parent(velerad,broneslava).
parent(velerad,veselina).
parent(veslava,broneslava).
parent(veslava,veselina).

parent(duhovlad,zdislava).
parent(duhovlad,zlatomir).
parent(zhdana,zdislava).
parent(zhdana,zlatomir).

%11 ЗАДАНИЕ.
% Построить предикат father(X, Y), который проверяет, является ли X
% отцом Y.
% Х - отец,Y- ребенок
father(X,Y) :-  parent(X,Y), man(X),!.
%Построить предикат, father(X), который выводит отца X.
%X - ребенок
father(X):- parent(Y,X), man(Y), write(Y), nl,!,fail.


%12 ЗАДАНИЕ.
%Построить предикат sister(X, Y), который проверяет, является ли X сестрой Y.
sister(X,Y):- parent(Z,X), parent(Z,Y), woman(X),!.
%Построить предикат sisters(X), который выводит всех сестер X.
sisters(X):-sister(Y,X), write(Y), nl, fail.


%13 ЗАДАНИЕ.
%Построить предикат grand_ma(X, Y), который проверяет,
% является ли X бабушкой Y.
% X-бабушка,Y-внучка
grand_ma(X,Y):-woman(X), parent(X,Z), parent(Z,Y).
%Построить предикат grand_mas(X), который
% выводит всех бабушек X.
% %X-внук(-чка), Y-бабушка
grand_ma(X):- parent(Y,Z), parent(Z,X), woman(Y), write(Y), nl, fail.
grand_ma1(X):- grand_ma(Y,X),write(Y), nl, fail.


%14 ЗАДАНИЕ.
%Построить предикат grand_ma_and_son(X,Y), который проверяет, являются ли X и Y бабушкой и внуком или внуком и бабушкой.
%!X-бабушка,У-внук ИЛИ Х-внук,У-бабушка
grand_ma_and_son(X,Y):-
    woman(X),man(Y),parent(X,Z), parent(Z,Y),!;
    woman(Y),man(X),parent(Y,Z), parent(Z,X),!.


%15 ЗАДАНИЕ.
%Реализовать предикат с помощью рекурсии вверх.
%Найти произведение цифр числа.
productofnumUP(0,1):-!.
productofnumUP(X,Mult):- X1 is X div 10,productofnumUP(X1,NewMult),
    X2 is X mod 10,Mult is X2*NewMult.

%16 ЗАДАНИЕ.
%Реализовать предикат с помощью рекурсии вниз.
%Найти произведение цифр числа.
productofnumDown(X,Mult):-productofnumDown(X,Mult,1).
productofnumDown(0,Res,Res):-!.
productofnumDown(X,Mult,CurMult):-X1 is X mod 10, NowMult is CurMult*X1,
    X2 is X div 10,productofnumDown(X2,Mult,NowMult).

%17 ЗАДАНИЕ.
%Выполнить указанную задачу с помощью рекурсии вверх.
%Найти количество нечетных цифр числа, больших 3.
numberofoddUp(0,0):-!.
numberofoddUp(X,Num):- Dig is X mod 10,X1 is X div 10,
    numberofoddUp(X1,NewNum),
    (Dig>3,1 is Dig mod 2,Num is NewNum+1;Num is NewNum).

%18 ЗАДАНИЕ.
%Выполнить указанную задачу с помощью рекурсии вниз.
%Найти количество нечетных цифр числа, больших 3.
numberofoddDown(X,Num):-numberofoddDown(X,Num,0).
numberofoddDown(0,Res,Res):-!.
numberofoddDown(X,Num,CurNum):- X1 is X mod 10,
    (X1>3,1 is X1 mod 2,NowNum is CurNum+1;NowNum is CurNum),
    X2 is X div 10,numberofoddDown(X2,Num,NowNum).

%19 ЗАДАНИЕ.
%Реализовать предикат fib(N,X), где X – число Фибоначчи с номером N, причем 1 и 2 элемент равны 1 с помощью рекурсии вверх.
fib(1,1):-!.
fib(2,1):-!.
fib(N,X):-N1 is N-1,N2 is N-2,fib(N1,NewX1),fib(N2,NewX2),
    X is NewX1+NewX2.

%20 ЗАДАНИЕ.
%Реализовать предикат fib(N,X), где X – число Фибоначчи с номером N, причем 1 и 2 элемент равны 1 с помощью рекурсии вниз.
fib1(N,X):-fib1(N,1,0,X).
fib1(1,Res,_,Res):-!.
fib(N,X1,X2,Res):-X is X1+X2,N1 is N-1,
    fib1(N1,X,X1,Res).

