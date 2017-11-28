program rady_6;

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
     Size,i,j,c1,dlina,schet,randomn,povorot: Integer;
     sosedi,konecPr,prav,PROVERKA: boolean;
     b: tmatrixb;
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
  begin
   if  (j=c1) or (i=c1) or (j=1) or (i=1) then begin konecPr:=True; b[i,j]:=1; end;
   if (j<>c1) and (i<>c1) and (i<>1) and (j<>1) then konecpr:=False;
  end;
 end;

procedure RTurn(var i,j,size,schet: Integer;var b: TMatrixB);
 begin
  if a[i,j+1]=0 then begin end;
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
   if a[i,j-1]=0 then begin end;
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
   if a[i-1,j]=0 then begin end;
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
    if a[i+1,j]=0 then begin end;
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
  Stroka1:=('Привет, игрок.');
  dlina:=length(stroka1);
  for i:=1 to dlina do
  begin
  Write(stroka1[i]);
  sleep(50);
  end;
  Writeln;Writeln;Writeln;Writeln;Writeln;


  Delete(stroka1,1,dlina);
  stroka1:=( 'Это игра, в которой ты задаешь лабиринт, а я пытаюсь из него выйти.');
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
  stroka1:=('Правила очень просты:');
  dlina:=length(stroka1);
  for i:=1 to dlina do
  begin
  Write(stroka1[i]);
  sleep(25);
  end;
  Writeln;
  Delete(stroka1,1,dlina);
  stroka1:=('1) Лабиринт задается как массив из 0 и 1, в котором клетки со значением 1 проходимы, а клетки, со значением 0 - не проходимы соответсвенно.');
  dlina:=length(stroka1);
  for i:=1 to dlina do
  begin
  Write(stroka1[i]);
  sleep(5);
  end;
  Writeln;Writeln;
  Delete(stroka1,1,dlina);
  stroka1:=('2) Начальная клетка, как и значения для лабиринта вводятся с клавиатуры. К этому стоит добавить, что начальная клетка должна быть проходима, а если вы введете индексы элемента со значением 0 - Вам придется перевводить значение индексов :(');
  dlina:=length(stroka1);
   for i:=1 to dlina do
  begin
  Write(stroka1[i]);
  sleep(5);
  end;
  Writeln;Writeln;
  Delete(stroka1,1,dlina);
  stroka1:=('3) В зависимости от введенного лабиринта в конце игры вы узнаете свой результат ( в очках сложности ).');
  dlina:=length(stroka1);
  for i:=1 to dlina do
  begin
  Write(stroka1[i]);
  sleep(5);
  end;
  Writeln;Writeln;
  Delete(stroka1,1,dlina);
  stroka1:=('4) Все граничные элементы лабиринта, кроме выходов (условие: рядом не может находиться два выхода), должны быть равны нулю.');
  dlina:=length(stroka1);
  for i:=1 to dlina do
  begin
  Write(stroka1[i]);
  sleep(5);
  end;

  Writeln;writeln;
  Writeln('Если хотите попробовать на тестовом массиве введите 1, нет - 0.');
  readln(povorot);
  if povorot=1 then
  begin
   a[1,1]:=0;
   a[1,2]:=0;
   a[1,3]:=0;
   a[1,4]:=0;
   a[1,5]:=0;
   a[1,6]:=0;
   a[1,7]:=0;
   a[1,8]:=0;
   a[1,9]:=0;
   a[1,10]:=0;
   a[1,11]:=0;
   a[1,12]:=0;
   a[1,13]:=0;
   a[1,14]:=0;
   a[1,15]:=0;
   a[2,1]:=0;
   a[2,2]:=1;
   a[2,3]:=1;
   a[2,4]:=1;
   a[2,5]:=1;
   a[2,6]:=0;
   a[2,7]:=1;
   a[2,8]:=1;
   a[2,9]:=1;
   a[2,10]:=1;
   a[2,11]:=0;
   a[2,12]:=0;
   a[2,13]:=0;
   a[2,14]:=1;
   a[2,15]:=0;
   a[3,1]:=0;
   a[3,2]:=1;
   a[3,3]:=0;
   a[3,4]:=0;
   a[3,5]:=1;
   a[3,6]:=1;
   a[3,7]:=1;
   a[3,8]:=0;
   a[3,9]:=0;
   a[3,10]:=1;
   a[3,11]:=1;
   a[3,12]:=1;
   a[3,13]:=1;
   a[3,14]:=1;
   a[3,15]:=0;
   a[4,1]:=0;
   a[4,2]:=1;
   a[4,3]:=0;
   a[4,4]:=0;
   a[4,5]:=1;
   a[4,6]:=0;
   a[4,7]:=1;
   a[4,8]:=1;
   a[4,9]:=1;
   a[4,10]:=1;
   a[4,11]:=0;
   a[4,12]:=0;
   a[4,13]:=1;
   a[4,14]:=0;
   a[4,15]:=0;
   a[5,1]:=0;
   a[5,2]:=1;
   a[5,3]:=0;
   a[5,4]:=0;
   a[5,5]:=0;
   a[5,6]:=0;
   a[5,7]:=0;
   a[5,8]:=0;
   a[5,9]:=0;
   a[5,10]:=0;
   a[5,11]:=0;
   a[5,12]:=1;
   a[5,13]:=1;
   a[5,14]:=1;
   a[5,15]:=0;
   a[6,1]:=0;
   a[6,2]:=1;
   a[6,3]:=1;
   a[6,4]:=0;
   a[6,5]:=1;
   a[6,6]:=1;
   a[6,7]:=1;
   a[6,8]:=1;
   a[6,9]:=1;
   a[6,10]:=1;
   a[6,11]:=0;
   a[6,12]:=1;
   a[6,13]:=0;
   a[6,14]:=0;
   a[6,15]:=0;
   a[7,1]:=0;
   a[7,2]:=1;
   a[7,3]:=0;
   a[7,4]:=0;
   a[7,5]:=1;
   a[7,6]:=0;
   a[7,7]:=0;
   a[7,8]:=0;
   a[7,9]:=0;
   a[7,10]:=0;
   a[7,11]:=1;
   a[7,12]:=1;
   a[7,13]:=0;
   a[7,14]:=0;
   a[7,15]:=0;
   a[8,1]:=0;
   a[8,2]:=1;
   a[8,3]:=1;
   a[8,4]:=1;
   a[8,5]:=1;
   a[8,6]:=1;
   a[8,7]:=1;
   a[8,8]:=1;
   a[8,9]:=1;
   a[8,10]:=1;
   a[8,11]:=1;
   a[8,12]:=0;
   a[8,13]:=0;
   a[8,14]:=0;
   a[8,15]:=0;
   a[9,1]:=0;
   a[9,2]:=0;
   a[9,3]:=0;
   a[9,4]:=1;
   a[9,5]:=0;
   a[9,6]:=0;
   a[9,7]:=0;
   a[9,8]:=1;
   a[9,9]:=0;
   a[9,10]:=0;
   a[9,11]:=0;
   a[9,12]:=0;
   a[9,13]:=0;
   a[9,14]:=0;
   a[9,15]:=0;
   a[10,1]:=0;
   a[10,2]:=0;
   a[10,3]:=0;
   a[10,4]:=1;
   a[10,5]:=0;
   a[10,6]:=0;
   a[10,7]:=0;
   a[10,8]:=1;
   a[10,9]:=0;
   a[10,10]:=0;
   a[10,11]:=0;
   a[10,12]:=0;
   a[10,13]:=0;
   a[10,14]:=0;
   a[10,15]:=0;
   a[11,1]:=0;
   a[11,2]:=0;
   a[11,3]:=0;
   a[11,4]:=1;
   a[11,5]:=0;
   a[11,6]:=0;
   a[11,7]:=0;
   a[11,8]:=1;
   a[11,9]:=1;
   a[11,10]:=1;
   a[11,11]:=1;
   a[11,12]:=1;
   a[11,13]:=1;
   a[11,14]:=1;
   a[11,15]:=0;
   a[12,1]:=0;
   a[12,2]:=0;
   a[12,3]:=0;
   a[12,4]:=1;
   a[12,5]:=0;
   a[12,6]:=0;
   a[12,7]:=0;
   a[12,8]:=0;
   a[12,9]:=0;
   a[12,10]:=1;
   a[12,11]:=0;
   a[12,12]:=0;
   a[12,13]:=0;
   a[12,14]:=1;
   a[12,15]:=0;
   a[13,1]:=0;
   a[13,2]:=0;
   a[13,3]:=0;
   a[13,4]:=0;
   a[13,5]:=0;
   a[13,6]:=0;
   a[13,7]:=0;
   a[13,8]:=0;
   a[13,9]:=0;
   a[13,10]:=0;
   a[13,11]:=0;
   a[13,12]:=0;
   a[13,13]:=0;
   a[13,14]:=1;
   a[13,15]:=0;
   a[14,1]:=0;
   a[14,2]:=0;
   a[14,3]:=1;
   a[14,4]:=1;
   a[14,5]:=1;
   a[14,6]:=1;
   a[14,7]:=1;
   a[14,8]:=1;
   a[14,9]:=1;
   a[14,10]:=1;
   a[14,11]:=1;
   a[14,12]:=1;
   a[14,13]:=1;
   a[14,14]:=1;
   a[14,15]:=0;
   a[15,1]:=0;
   a[15,2]:=0;
   a[15,3]:=1;
   a[15,4]:=0;
   a[15,5]:=0;
   a[15,6]:=0;
   a[15,7]:=0;
   a[15,8]:=0;
   a[15,9]:=0;
   a[15,10]:=0;
   a[15,11]:=0;
   a[15,12]:=0;
   a[15,13]:=0;
   a[15,14]:=0;
   a[15,15]:=0;
   c1:=15 ;
  end




  else
  begin
  Writeln;Writeln;
  size:=0;sosedi:=false;schet:=0;
  Writeln('Введите размер Вашего массива:');
  readln(c1);

   for i:=1 to c1 do
    for j:=1 to c1 do
    begin
     Writeln('Введите элемент ',I,'-ой строки ', j,'-ого столбца ');
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
   end;
   ///////////////////////////////
   repeat
   Writeln('Введите координаты начального элемента(сначала i, затем j)');
   Readln(i,j);
   if a[i,j]=0 then
   begin
     Writeln('Данная клетка непроходима, попробуйте еще раз :с');
   end
   else prav:=true;
   until prav=True;
   b[i,j]:=1;

  repeat
   Findsosedi(i,j,sosedi);
   if sosedi=True  then
   begin
   randomize;
        randomn:=Random(5);
   case randomn of
   1: RTurn(i,j,size,schet,b);
      {if b[i,j+1]=0 then
          begin
               RTurn(i,j,size,schet,b);
               {writeln(' i ravno: ',i,' о ravno: ',j,' size=', size);
           end;}
   2: LTurn(i,j,size,schet,b);
      {if b[i+1,j]=0 then
          begin
              DTurn(i,j,size,schet,b);
              {writeln(' i ravno: ',i,' о ravno: ',j,' size=', size);
          end;}
   3: DTurn(i,j,size,schet,b);
      {If b[i,j-1]=0 then
         begin
             LTurn(i,j,size,schet,b);
             {writeln(' i ravno: ',i,' о ravno: ',j,' size=', size);
         end;}
   4:  UTurn(i,j,Size,schet,b);
      {If b[i-1,j]=0 then
         begin
              UTurn(i,j,Size,schet,b);
              {writeln(' i ravno: ',i,' о ravno: ',j,' size=', size);
         end;}
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
     if (i=0) and (j=0) then
      begin
       sosedi:=True;
      end;
     until sosedi=True;
     end;
   end;
   if (i=0) and (j=0) and (sosedi=true) then
   begin
    Writeln('В вашем массиве нету выхода');
    proverka:=True;
    KONECPR:=True;
   end;
   until konecPr=True;
   if proverka=False then
   begin
   stroka1:=('Мы нашли выход, ведь выход есть всегда!');
   dlina:=Length(stroka1);
   for i:=1 to dlina do
    begin
    Write(stroka1[i]);
    Sleep(30);
    end;
   Writeln;
   Sleep(100);
   Delete(stroka1,1,dlina);
   stroka1:=('Прибираем за собой...');
   dlina:=Length(stroka1);
   for i:=1 to dlina do
    begin
    Write(stroka1[i]);
    Sleep(30);
    end;
    Writeln;
    Sleep(100);
    Delete(stroka1,1,dlina);
   stroka1:=('Подсчитываем очки...');
   dlina:=Length(stroka1);
   for i:=1 to dlina do
    begin
    Write(stroka1[i]);
    Sleep(30);
    end;
   //////////////////////
   Writeln('Мой выход из лабиринта выглядит как-то так:');
   for i:=1 to c1 do
   begin
   writeln;
    for j:=1 to n do
     begin
       if b[i,j]=0 then c[i,j]:=#149;
       if b[i,j]=1 then c[i,j]:=#127;
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
    Writeln('Ваши очки, игрок (чем больше очков - тем лучше):',schet);
    Delete(stroka1,1,dlina);
    stroka1:=('Надеюсь, Вам понравилась игра (поставьте 10, пожалуйста, я старался.)');
    dlina:=Length(stroka1);
    for i:=1 to dlina do
    write(stroka1[i]);
    Writeln;
    Writeln;
    writeln('Для завершения нажмите клавишу Enter...');
   Readln;
   end
   else Readln;
end.
