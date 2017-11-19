program laba6_ready;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  windows;

const
    n=6;lol=100;

type
 TArrayStek = array[1..lol] of Integer;

 TVector = array [1..n] of integer;
 TMatrix = array [1..n] of tvector;

 TMyType = array [1..n] of Char;
 Tcharmas = array[1..n] of TMyType;

 TVectorB=array[1..n] of integer;
 TMatrixB=array[1..n] of tvectorb;

 var a: tmatrix;
     iindekses,jindekses: TArrayStek;
     Size,i,j,h,t: Integer;
     sosedi,konecPr: boolean;
     b,v : tmatrixb;
     c : tcharmas;


procedure push(var i,j,size : Integer);
 begin
  inc(size);
  Iindekses[Size]:=i;
  Jindekses[size]:=j;
 end;

procedure back(var i,j,size : Integer);
 begin
  i:=Iindekses[size];
  j:=Jindekses[size];
  Dec(size);

 end;

procedure FindSosedi( var i,j:Integer; var sosedi: boolean );
 var k: integer;
 begin
  k:=0;
   if ((a[i,j+1]=1) and (b[i,j+1]=0)) then  k:=k+1;
   if ((a[i+1,j]=1) and (b[i+1,j]=0)) then  k:=k+1;
   if ((a[i,j-1]=1) and (b[i,j-1]=0)) then  k:=k+1;
   if ((a[i-1,j]=1) and (b[i-1,j]=0)) then  k:=k+1;
   if k<>0 then sosedi:=True;
   if k=0 then sosedi:=false;
 end;


procedure konec( var i,j: integer);
 begin
  if a[i,j]=1 then
   if  (j=n) or (i=n) then begin konecPr:=True; b[i,j]:=1; end;
    if (j<>n) and (i<>n) then konecpr:=False;

 end;

procedure RTurn(var i,j,size: Integer;var b: TMatrixB);
 begin
  if a[i,j+1]=1 then
   begin
     b[i,j]:=1;
     push(i,j,size);
     j:=j+1;
   end;
   konec(i,j);
 end;

procedure LTurn(var i,j,size: Integer;var  b: tmatrixb);
 begin
   if a[i,j-1]=1 then
    begin
      b[i,j]:=1;
      push(i,j,size);
      j:=j-1;
    end;
  konec(i,j);
 end;

procedure UTurn(var i,j,size: Integer;var  b: TMatrixB);
 begin
   if a[i-1,j]=1 then
    begin
      b[i,j]:=1;
      push(i,j,size);
      i:=i-1;
    end;
    konec(i,j);
 end;

procedure DTurn(var i,j,size: Integer;var  b: TMatrixB);
 begin
    if a[i+1,j]=1 then
     begin
      b[i,j]:=1;
      push(i,j,size);
      i:=i+1;
     end;
     konec(i,j);
 end;



begin
  size:=0;sosedi:=false;
   a[1,1]:=0;
   a[1,2]:=0;
   a[1,3]:=0;
   a[1,4]:=0;
   a[1,5]:=0;
   a[1,6]:=0;
   a[2,1]:=0;
   a[2,2]:=1;
   a[2,3]:=1;
   a[2,4]:=0;
   a[2,5]:=0;
   a[2,6]:=0;
   a[3,1]:=0;
   a[3,2]:=1;
   a[3,3]:=0;
   a[3,4]:=0;
   a[3,5]:=1;
   a[3,6]:=0;
   a[4,1]:=0;
   a[4,2]:=1;
   a[4,3]:=1;
   a[4,4]:=0;
   a[4,5]:=1;
   a[4,6]:=0;
   a[5,1]:=0;
   a[5,2]:=1;
   a[5,3]:=1;
   a[5,4]:=1;
   a[5,5]:=1;
   a[5,6]:=0;
   a[6,1]:=0;
   a[6,2]:=1;
   a[6,3]:=0;
   a[6,4]:=0;
   a[6,5]:=0;
   a[6,6]:=0;


   {for i:=1 to n do
   begin
    Writeln;Writeln;Writeln;
     for j:=1 to n do
      begin
        Write(' ', a[i,j],' ');
      end;
   end;
   Writeln;Writeln;Writeln;}

   {for i:=1 to n do
    for j:=1 to n do
    begin
     Writeln('Vvedite element ',I,'-oi ctroki ', j,' ctolbca');
     readln(a[i,j]);
    end;}

    for i:=1 to n do
   begin
    Writeln;Writeln;Writeln;
     for j:=1 to n do
      begin
        Write(' ', a[i,j],' ');
      end;
   end;
   Writeln;Writeln;Writeln;
   ///////////////////////////////
   Writeln('VVedite nachalinyi element (i,j)');
   Readln(i,j);
   b[i,j]:=1;

  repeat
   Findsosedi(i,j,sosedi);
   if sosedi=True  then
   begin
      if b[i,j]=0 then
          begin
              b[i,j]:=1;
          end;
      if b[i,j+1]=0 then
          begin
               RTurn(i,j,size,b);
               writeln(' i ravno: ',i,' î ravno: ',j,' size=', size);
           end;
      if b[i+1,j]=0 then
          begin
              DTurn(i,j,size,b);
              writeln(' i ravno: ',i,' î ravno: ',j,' size=', size);
          end;

      If b[i,j-1]=0 then
         begin
             LTurn(i,j,size,b);
             writeln(' i ravno: ',i,' î ravno: ',j,' size=', size);
         end;
      If b[i-1,j]=0 then
         begin
              UTurn(i,j,Size,b);
              writeln(' i ravno: ',i,' î ravno: ',j,' size=', size);
         end;
          for h:=1 to n do
    begin
     writeln;
     for t:=1 to n do
      begin
        write(b[h,t]);
        write('  ');
      end;
      end;
    
    end;
    Findsosedi(i,j,sosedi);

   If (sosedi=false) and (j<>n) and (i<>n)  then
   begin
     repeat
     b[i,j]:=1;
     back(i,j,size);
     writeln('posle backa i = ',i,' j= ',j);
     FindSosedi(i,j,sosedi);
     until sosedi=True;
   end;
   until konecPr=True;

   Writeln(i,' ',j);
   b[i,j]:=1;
   Writeln('way find.');
   Writeln;
   //////////////////////
   for i:=1 to n do
   begin
   writeln;
    for j:=1 to n do
     begin
       if b[i,j]=0 then c[i,j]:='0';
       if b[i,j]=1 then c[i,j]:='X';
       write(' ');
     end;
    end;
    for i:=1 to n do
    begin
     writeln;
     for j:=1 to n do
      begin
        write(c[i,j]);
        write('  ');
      end;
      end;
   Readln;
end.
  { for i:=1 to n do
   begin
   writeln;
    for j:=1 to n do
     begin
       Write(ñ[i,j]);
       write(' ');
     end;
    end;}     {// stek
procedure push(c : integer);
begin
   size:=size+1;
   a[Size]:=c;
end;

function top : integer;
 begin
  top := a[size];
 end;

 procedure delete;
 begin
  size := size - 1;
 end;
// functions of stek}     { for i:=1 to n do
   for j:=1 to n do
    begin
     Writeln('Vvedite element ',I,'-togo ctoLbca ', j,' ctroki');
     readln(a[i,j]);
    end;}
