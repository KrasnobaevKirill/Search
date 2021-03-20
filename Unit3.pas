unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,Math, ExtCtrls;

type
  TForm3 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    mmo1: TMemo;
    btn1: TButton;
    rg1: TRadioGroup;
    edt1: TEdit;
    edt2: TEdit;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    mmo2: TMemo;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  const
    e=0.0010000001;
var
  Form3: TForm3;
   n,nach,kon:Integer;
    a:array[1..1000] of real;
    b:array[1..1000] of integer;

implementation


{$R *.dfm}

procedure TForm3.btn1Click(Sender: TObject);  // Заполнение массива
var
  i,j,k:Integer;
  v:Real;
begin

mmo1.Clear;
  n:=strtoint(edt1.text);

  if rg1.ItemIndex=0 then
  begin
    for i:=1 to n do
    b[i]:=random(100)-30;


  for i := 1 to n-1 do       // Предварительная сортировка
   for j := 1 to n-i do
    if b[j] > b[j+1] then
     begin
      k := b[j];
      b[j] := b[j+1];
      b[j+1] := k;
     end;
     for i:=1 to n do
    mmo1.Lines.Add(intToStr(b[i]));
end;

  if rg1.ItemIndex=1 then
  begin
    for i:=1 to n do
    a[i]:=roundto((random*20-5),-3);
     for i := 1 to n-1 do            // Предварительная сортировка
   for j := 1 to n-i do
    if a[j] > a[j+1] then
     begin
      v:= a[j];
      a[j] := a[j+1];
      a[j+1] := v;
     end;
     for i:=1 to n do
    mmo1.Lines.Add(floatToStr(a[i]));

end;

end;



procedure TForm3.btn2Click(Sender: TObject);    //Бинарный поиск
var
  left,right,mid,i,k:Integer;
  f:Boolean;
  z:Real;
begin
mmo2.Clear;
  if rg1.ItemIndex=0 then
  begin
k:=StrToint(edt2.Text);
left:=1;
right:=n;
f:=false;
while(left<=right) and not f do
 begin
  mid:=(left+right)div 2;
  if k<b[mid] then right:=mid-1
  else
  if k>b[mid] then left:=mid+1 else f:=true;
 end;
if f=true then mmo2.Lines.add('Элемент присутствует и занимает позицию '+inttostr(mid))
else mmo2.Lines.add('Элемент отсутствует');
end;


   if rg1.ItemIndex=1 then
begin
    z:=strTofloat(edt2.Text);
left:=1;
right:=n;
f:=false;
while(left<=right) and not f do
 begin
  mid:=(left+right)div 2;
  if ((z-e)<a[mid]) and ((z+e)<a[mid]) then right:=mid-1
  else
  if ((z-e)>a[mid]) and ((z+e)>a[mid]) then left:=mid+1 else f:=true;
 end;
if f=true then mmo2.Lines.add('Элемент присутствует и занимает позицию '+inttostr(mid))
else mmo2.Lines.add('Элемент отсутствует');
 end;

  end;


procedure TForm3.btn3Click(Sender: TObject);    //Поиск первого вхождения
var
  left,right,mid,i,k:Integer;
  f:Boolean;
  z:Real;
begin
  mmo2.Clear;
  if rg1.ItemIndex=0 then
  begin
k:=StrToint(edt2.Text);
left:=1;
right:=n;
f:=false;
while(left<=right) and not f do
 begin
  mid:=(left+right)div 2;
  if k<b[mid] then right:=mid-1
  else
  if k>b[mid] then left:=mid+1 else f:=true;
 end;
 if f=True then
 begin
 for i:=1 to mid do
 if b[i]=k then
 begin
   nach:=i;
 mmo2.Lines.add('Элемент присутствует и занимает позицию '+inttostr(i));
 Break;
 end;
 end
else mmo2.Lines.add('Элемент отсутствует');
end;


   if rg1.ItemIndex=1 then
begin
    z:=strTofloat(edt2.Text);
left:=1;
right:=n;
f:=false;
while(left<=right) and not f do
 begin
  mid:=(left+right)div 2;
  if ((z-e)<a[mid]) and ((z+e)<a[mid]) then right:=mid-1
  else
  if ((z-e)>a[mid]) and ((z+e)>a[mid]) then left:=mid+1 else f:=true;
 end;
if f=True then
 begin
 for i:=1 to mid do
 if ((a[i]>=(z-e)) and (a[i]<=(z+e)))  then
 begin
   nach:=i;
 mmo2.Lines.add('Элемент присутствует и занимает позицию '+inttostr(i));
 Break;
 end;
 end
else mmo2.Lines.add('Элемент отсутствует');
 end;

  end;


procedure TForm3.btn4Click(Sender: TObject);   //Поиск последнего вхождения
var
  left,right,mid,i,k:Integer;
  f:Boolean;
  z:Real;
begin
mmo2.Clear;
  if rg1.ItemIndex=0 then
  begin
k:=StrToint(edt2.Text);
left:=1;
right:=n;
f:=false;
while(left<=right) and not f do
 begin
  mid:=(left+right)div 2;
  if k<b[mid] then right:=mid-1
  else
  if k>b[mid] then left:=mid+1 else f:=true;
 end;
 if f=True then
 begin
 for i:=n downto 1 do
 if b[i]=k then
 begin
   kon:=i;
mmo2.Lines.add('Элемент присутствует и занимает позицию '+inttostr(i));
 Break;
 end;
 end
else mmo2.Lines.add('Элемент отсутствует');
end;


   if rg1.ItemIndex=1 then
begin
    z:=strTofloat(edt2.Text);
left:=1;
right:=n;
f:=false;
while(left<=right) and not f do
 begin
  mid:=(left+right)div 2;
  if ((z-e)<a[mid]) and ((z+e)<a[mid]) then right:=mid-1
  else
  if ((z-e)>a[mid]) and ((z+e)>a[mid]) then left:=mid+1 else f:=true;
 end;
if f=True then
 begin
 for i:=n downto 1 do
 if ((a[i]>=(z-e)) and (a[i]<=(z+e)))  then
 begin
   kon:=i;
 mmo2.Lines.add('Элемент присутствует и занимает позицию '+inttostr(i));
 Break;
 end;
 end
else mmo2.Lines.add('Элемент отсутствует');
 end;

  end;

procedure TForm3.btn5Click(Sender: TObject);    //Все  вхождения
var
  left,right,mid,i,k:Integer;
  f:Boolean;
  z:Real;
begin
  if rg1.ItemIndex=0 then
  begin
  btn3Click(Sender);
  btn4Click(Sender);
  if mmo2.Lines[0]<>'Элемент отсутствует' then
  begin
  mmo2.Clear;
  for i:=nach to kon do
  mmo2.Lines.Add('Элемент присутствует и занимает позицию '+inttostr(i));
  end;
end;


   if rg1.ItemIndex=1 then
begin
   btn3Click(Sender);
  btn4Click(Sender);
  if mmo2.Lines[0]<>'Элемент отсутствует' then
  begin
  mmo2.Clear;
  for i:=nach to kon do
  mmo2.Lines.Add('Элемент присутствует и занимает позицию '+inttostr(i));
 end;
 end;

  end;


end.
