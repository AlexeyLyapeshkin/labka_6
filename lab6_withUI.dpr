program lab6_withUI;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows;

const
    n=100;lol=100;ctroki=255;

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
     Size,i,j,h,t,c1,dlina,schet: Integer;
     sosedi,konecPr,prav: boolean;
     b,v : tmatrixb;
     c : tcharmas;
     stroka1: string[ctroki];


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


procedure konec( var i,j: integer; var konecpr: boolean);
 begin
  if a[i,j]=1 then
   if  (j=c1) or (i=c1) or (j=1) or (i=1) then begin konecPr:=True; b[i,j]:=1; end;
    if (j<>c1) and (i<>c1) and (i<>1) and (j<>1) then konecpr:=False;

 end;

procedure RTurn(var i,j,size,schet: Integer;var b: TMatrixB);
 begin
  if a[i,j+1]=1 then
   begin
     b[i,j]:=1;
     push(i,j,size);
     j:=j+1;
     schet:=schet+1;
   end;
   konec(i,j,konecpr);
 end;

procedure LTurn(var i,j,size,schet: Integer;var  b: tmatrixb);
 begin
   if a[i,j-1]=1 then
    begin
      b[i,j]:=1;
      push(i,j,size);
      j:=j-1;
      schet:=schet+1;
    end;
  konec(i,j,konecpr);
 end;

procedure UTurn(var i,j,size,schet: Integer;var  b: TMatrixB);
 begin
   if a[i-1,j]=1 then
    begin
      b[i,j]:=1;
      push(i,j,size);
      i:=i-1;
      schet:=schet+1;
    end;
    konec(i,j,konecpr);
 end;

procedure DTurn(var i,j,size,schet: Integer;var  b: TMatrixB);
 begin
    if a[i+1,j]=1 then
     begin
      b[i,j]:=1;
      push(i,j,size);
      i:=i+1;
      schet:=schet+1;
     end;
     konec(i,j,konecpr);
 end;



begin
  SetConsoleCP(1251);
  SetConsoleOutputCP(1251);


  Write;Write;Write;Write;Write;Write;
  Stroka1:=('������, �����.');
  dlina:=length(stroka1);
  for i:=1 to dlina do
  begin
  Write(stroka1[i]);
  sleep(50);
  end;
  Writeln;Writeln;Writeln;Writeln;Writeln;


  Delete(stroka1,1,dlina);
  stroka1:=( '��� ����, � ������� �� ������� ��������, � � ������� �� ���� �����.');
  dlina:=length(stroka1);
  for i:=1 to dlina do
  begin
  Write(stroka1[i]);
  sleep(25);
  end;
  Writeln;
  Writeln;
  Writeln;
  Delete(stroka1,1,dlina);
  stroka1:=('������� ����� ������:');
  dlina:=length(stroka1);
  for i:=1 to dlina do
  begin
  Write(stroka1[i]);
  sleep(25);
  end;
  Writeln;
  Delete(stroka1,1,dlina);
  stroka1:=('1) �������� �������� ��� ������ �� 0 � 1, � ������� ������ �� ��������� 1 ���������, � ������, �� ��������� 0 - �� ��������� �������������.');
  dlina:=length(stroka1);
  for i:=1 to dlina do
  begin
  Write(stroka1[i]);
  sleep(25);
  end;
  Writeln;Writeln;
  Delete(stroka1,1,dlina);
  stroka1:=('2) ��������� ������, ��� � �������� ��� ��������� �������� � ����������. � ����� ����� ��������, ��� ��������� ������ ������ ���� ���������, � ���� �� ������� ������� �������� �� ��������� 0 - ��� �������� ����������� �������� �������� :(');
  dlina:=length(stroka1);
   for i:=1 to dlina do
  begin
  Write(stroka1[i]);
  sleep(17);
  end;
  Writeln;Writeln;
  Delete(stroka1,1,dlina);
  stroka1:=('3) � ����������� �� ���������� ��������� � ����� ���� �� ������� ���� ��������� ( � ����� ��������� ).');
  dlina:=length(stroka1);
  for i:=1 to dlina do
  begin
  Write(stroka1[i]);
  sleep(17);
  end;
  Writeln;Writeln;
  Delete(stroka1,1,dlina);
  stroka1:=('4) ��� ��������� �������� ���������, ����� ������� (�������: ����� �� ����� ���������� ��� ������), ������ ���� ����� ����.');
  dlina:=length(stroka1);
  for i:=1 to dlina do
  begin
  Write(stroka1[i]);
  sleep(17);
  end;




  Writeln;Writeln;
  size:=0;sosedi:=false;schet:=0;
  Writeln('������� ������ ������ �������:');
  readln(c1);

   for i:=1 to c1 do
    for j:=1 to c1 do
    begin
     Writeln('������� ������� ',I,'-�� ������ ', j,'-��� ������� ');
     readln(a[i,j]);
    end;

    {for i:=1 to c1 do
   begin
    Writeln;Writeln;Writeln;
     for j:=1 to c1 do
      begin
        Write(' ', a[i,j],' ');
      end;
   end;}
   Writeln;Writeln;Writeln;
   ///////////////////////////////
   repeat
   Writeln('������� ���������� ���������� ��������(������� i, ����� j)');
   Readln(i,j);
   if a[i,j]=0 then
   begin
     Writeln('������ ������ �����������, ���������� ��� ��� :�');
   end
   else prav:=true;
   until prav=True;
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
               RTurn(i,j,size,schet,b);
               {writeln(' i ravno: ',i,' � ravno: ',j,' size=', size);}
           end;
      if b[i+1,j]=0 then
          begin
              DTurn(i,j,size,schet,b);
              {writeln(' i ravno: ',i,' � ravno: ',j,' size=', size);}
          end;
      If b[i,j-1]=0 then
         begin
             LTurn(i,j,size,schet,b);
             {writeln(' i ravno: ',i,' � ravno: ',j,' size=', size);}
         end;
      If b[i-1,j]=0 then
         begin
              UTurn(i,j,Size,schet,b);
              {writeln(' i ravno: ',i,' � ravno: ',j,' size=', size);}
         end;
    end;
   if konecpr=false then
   begin
    Findsosedi(i,j,sosedi);
   If (sosedi=false) and ((j<>c1) or (i<>c1) or (i<>1) and (j<>1))  then
   begin
     repeat
     b[i,j]:=1;
     back(i,j,size);
     {writeln('posle backa i = ',i,' j= ',j)}
     FindSosedi(i,j,sosedi);
     until sosedi=True;
     end;
   end;
   until konecPr=True;
   stroka1:=('�� ����� �����, ���� ����� ���� ������!');
   dlina:=Length(stroka1);
   for i:=1 to dlina do
    begin
    Write(stroka1[i]);
    Sleep(30);
    end;
   Writeln;
   Sleep(100);
   Delete(stroka1,1,dlina);
   stroka1:=('��������� �� �����...');
   dlina:=Length(stroka1);
   for i:=1 to dlina do
    begin
    Write(stroka1[i]);
    Sleep(30);
    end;
    Writeln;
    Sleep(100);
     Delete(stroka1,1,dlina);
   stroka1:=('������������ ����...');
   dlina:=Length(stroka1);
   for i:=1 to dlina do
    begin
    Write(stroka1[i]);
    Sleep(30);
    end;
   //////////////////////
   Writeln;Writeln;
   Writeln('��� ����� �� ��������� �������� ���-�� ���:');
   for i:=1 to c1 do
   begin
   writeln;
    for j:=1 to n do
     begin
       if b[i,j]=0 then c[i,j]:=#149;
       if b[i,j]=1 then c[i,j]:=#152;
       write(' ');
     end;
    end;
    for i:=1 to c1 do
   begin
   writeln;
    for j:=1 to c1 do
     begin
       write(' ');
       Write(c[i,j]);
       write(' ');
     end;
    end;
    Writeln;
    Writeln;
    Writeln('���� ����, ����� (��� ������ ����� - ��� �����):',schet);
    Delete(stroka1,1,dlina);
    stroka1:=('�������, ��� ����������� ���� (��������� 10, ����������, � ��������.)');
    dlina:=Length(stroka1);
    for i:=1 to dlina do
    write(stroka1[i]);
    Writeln;
    Writeln;
    writeln('��� ���������� ������� ������� Enter...');
   Readln;
end.

