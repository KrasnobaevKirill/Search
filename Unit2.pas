unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,  Math,ExtCtrls;

type
  TForm2 = class(TForm)
    mmo1: TMemo;
    btn1: TButton;
    rg1: TRadioGroup;
    lbl1: TLabel;
    edt1: TEdit;
    lbl2: TLabel;
    edt2: TEdit;
    btn2: TButton;
    btn3: TButton;
    mmo2: TMemo;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
   const
     e=0.0010000001;
var
  Form2: TForm2;
    n:Integer;
    a:array[1..1000] of real;
    b:array[1..1000] of integer;
implementation

{$R *.dfm}

procedure TForm2.btn1Click(Sender: TObject);   //«аполнение массива
var
  i:Integer;
begin
  mmo2.Clear;
mmo1.Clear;
  n:=strtoint(edt1.text);

  if rg1.ItemIndex=0 then
  begin
    for i:=1 to n do
    begin
    b[i]:=random(100)-30;
    mmo1.Lines.Add(intToStr(b[i]));
  end;
end;

  if rg1.ItemIndex=1 then
  begin
    for i:=1 to n do
    begin
    a[i]:=roundto((random*20-5),-3);
    mmo1.Lines.Add(FloatToStr(a[i]));
  end;
end;

end;

procedure TForm2.btn2Click(Sender: TObject);  //ѕоследов. поиск
var
  i,k:Integer;
  z:Real;
  f:Boolean;
begin
  mmo2.Clear;
 if rg1.ItemIndex=0 then
  begin
  k:=StrToint(edt2.Text);
  f:=False;
   for i:=1 to n do
 if b[i]=k then
 begin
 f:=True;
  mmo2.Lines.add('Ёлемент присутствует и занимает позицию '+inttostr(i));
  Break;
  end;
 if f=False then
 mmo2.Lines.add('Ёлемент отстутствует');
end;

  if rg1.ItemIndex=1 then
  begin
  z:=StrToFloat(edt2.Text);
  f:=False;
   for i:=1 to n do
 if ((a[i]>=(z-e)) and (a[i]<=(z+e)))  then
 begin
 f:=True;
  mmo2.Lines.add('Ёлемент присутствует и занимает позицию '+inttostr(i));
  Break;
  end;
 if f=False then
 mmo2.Lines.add('Ёлемент отстутствует');
end;
end;

procedure TForm2.btn3Click(Sender: TObject);   //— барьером
var
  i,k:Integer;
  z:Real;
begin
  mmo2.Clear;
 if rg1.ItemIndex=0 then
  begin
  k:=StrToint(edt2.Text);
  b[n+1]:=k;     // ”становка барьера доп. элементом
  i:=1;
  while b[i]<>k do
   i:=i+1;
if i<n+1 then
  mmo2.Lines.add('Ёлемент присутствует и занимает позицию '+inttostr(i))
 else
 mmo2.Lines.add('Ёлемент отстутствует');
end;

  if rg1.ItemIndex=1 then
  begin
  z:=StrToFloat(edt2.Text);

  a[n+1]:=z;     // ”становка барьера доп. элементом
  i:=1;
  while (a[i]<(z-e)) or (a[i]>(z+e)) do
   i:=i+1;
if i<n+1 then
  mmo2.Lines.add('Ёлемент присутствует и занимает позицию '+inttostr(i))
 else
 mmo2.Lines.add('Ёлемент отстутствует');
end;
end;


end.
