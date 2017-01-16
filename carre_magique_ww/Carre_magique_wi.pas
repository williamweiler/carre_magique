{

programme Carre_magique_ww


CONST
	MAX=5

Type
	t2dim=tableau [1..MAX,1..MAX] entier



//BUT: Initialisation tableau
//ENTREE:1 tableau
//SORTIE:1 tableau avec valeur 0

procedure Inittab var T:t2dim

var
	i,j:entier

debut

	pour i:=1 a MAX faire

		pour j:=1 a MAX faire

               debut
			T[i,j]:=0;
		finpour
	finpour

fin


//BUT:Test si la valeur et inferieur a 1 mettre a MAX, si la valeur est a MAX mettre a 1
//ENTREE: 2 entier
//SORTIE: 2 entier

procedure TestXY var PosX,PosY:entier; //testposition (droite/gauche bas/haut)
debut
	repeter

		si PosX>MAX alors
		debut
			PosX:=PosX-MAX;
		fin

		alors
			si PosX<1 alors

                        debut

				PosX:=PosX+MAX
			finsi

		si PosY>MAX alors


		debut

			PosY:=PosY-MAX;
		fin

		alors
		si PosY<1 alors
			debut
				PosY:=PosY+MAX;
			fin

		jusqu'a ((PosX>=1) et (PosX<=MAX)) et ((PosY>=1) et (PosY<=MAX));

end;





//BUT:Valeur du tableau
//ENTREE: 1 tableau 3 entier
//SORTIE:1 tableau MAX valeur

procedure Valeurtab var T:t2dim var PosX,PosY:entier
var
	nb:entier

	debut

	nb:=1

	PosX:=(MAX DIV 2)+1;//init tableau carree magique
	PosY:=(MAX DIV 2); //init tableau carree magique


  pour nb:=1 a MAX*MAX faire

  	debut


		TestXY(PosX,PosY);	//on test x,y



		si (T[PosX,PosY]<>0) alors //on verifie si la valeur n''ai = 0

                debut

			PosX:=PosX-1;//test y,x
			PosY:=PosY-1;//test y,x



			TestXY(PosX,PosY); //retest x,y

		fin

		T[PosnbX,PosnbY]:=nb

		PosX:=PosX+1;
		PosY:=PosY-1;


	fin

fin


//BUT:affiche les valeurs du tableau
//ENTREE:  1 tableau 2 entier
//SORTIE:affiche nb entier

procedure Affichage(var T:t2dim)
var
	i,j:entier

        debut

	pour i:=1 a MAX faire
	debut
		pour j:=1 a MAX faire
		debut
			ecrire(' ',T[j,i]);
		fin


		ecrire
	fin

fin



var
	T:t2dim;
	resultat,PosX,PosY: entier

debut


	Inittab(T);//init du tableau

	ecrire('le carre magique est en '& MAX, 'x'& MAX)

	Valeurtab(T,PosX,PosY);//valeur du tableau


        Affichage(T);


	resultat := MAX*(MAX*MAX+1) div 2; //nombre du carre magique
	ecrire('Le carre magique est de : '& resultat)

  lire //affichage resultat

fin

}


program Carre_magique_wi;

uses crt;

CONST
	MAX=7;

Type
	t2dim=array [1..MAX,1..MAX] of integer;




procedure Inittab(var T:t2dim);

var
	i,j:integer;
begin

	for i:=1 to MAX do
	begin
		for j:=1 to MAX do
		begin
			T[i,j]:=0;
		end;
	end;

end;




procedure TestXY(var PosX,PosY:integer);

begin
	repeat

		if PosX>MAX then
		begin
			PosX:=PosX-MAX;
		end


		else
			if PosX<1 then
			begin
				PosX:=PosX+MAX
			end;

		if PosY>MAX then
		begin
			PosY:=PosY-MAX;
		end

		else
			if PosY<1 then
			begin
				PosY:=PosY+MAX;
			end;

		until ((PosX>=1) AND (PosX<=MAX)) AND ((PosY>=1) AND (PosY<=MAX));

end;




procedure Valeurtab(var T:t2dim; var PosX,PosY:integer);
var
	nb:integer;
begin

	nb:=1;

	PosX:=(MAX DIV 2)+1;
	PosY:=(MAX DIV 2);


  for nb:=1 to MAX*MAX do
  begin


		TestXY(PosX,PosY);



		if (T[PosX,PosY]<>0) then
		begin

			PosX:=PosX-1;
			PosY:=PosY-1;



			TestXY(PosX,PosY);

		end;

		T[PosX,PosY]:=nb;

		PosX:=PosX+1;
		PosY:=PosY-1;


	end;

end;



procedure Affichage(var T:t2dim);
var
	i,j:integer;
begin

	for i:=1 to MAX do
	begin
		for j:=1 to MAX do
		begin
			write(' ',T[j,i]);
		end;

		writeln;
		writeln;
	end;

end;



var
	T:t2dim;
	resultat,PosX,PosY:integer;
begin

	clrscr;

	Inittab(T);

	writeln('le carre magique en ', MAX, 'x', MAX);

	Valeurtab(T,PosX,PosY);

	writeln;

	Affichage(T);

       resultat := MAX*(MAX*MAX+1) div 2;
	writeln('Le carre magique est de: ', resultat);

  readln;

end.
