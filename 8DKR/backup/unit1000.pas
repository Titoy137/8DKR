unit unit1000;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ComCtrls;

type

  { TFORMYLA }

  TFORMYLA = class(TForm)
    bt_REZ: TButton;
    bt_CLEAR: TButton;
    ed_NACH: TEdit;
    ed_STAVKA: TEdit;
    ed_PERIOD: TEdit;
    ed_SYMMA: TEdit;
    ed_sSYM: TEdit;
    ed_NADB: TEdit;
    ed_sNADB: TEdit;
    Hard___: TGroupBox;
    im_HRD: TImage;
    im_SIM: TImage;
    im_MENU: TImage;
    lb_sSYMMA: TLabel;
    lb_sNADB: TLabel;
    lb_ryb: TLabel;
    lb_RYBB: TLabel;
    lb_SYMMA: TLabel;
    lb_NADBAVKA: TLabel;
    lb_rryybb: TLabel;
    lb_rryyb: TLabel;
    Simple____: TGroupBox;
    lb_NACHSYMMA: TLabel;
    lb_STAVKA: TLabel;
    lb_PEROID: TLabel;
    rb_SML: TRadioButton;
    rb_HRD: TRadioButton;
    procedure bt_REZClick(Sender: TObject);
    procedure bt_CLEARClick(Sender: TObject);
    procedure ed_STAVKAKeyPress(Sender: TObject; var Key: char);
    procedure ed_NACHKeyPress(Sender: TObject; var Key: char);
    procedure ed_PERIODKeyPress(Sender: TObject; var Key: char);
    procedure rb_SMLChange(Sender: TObject);
    procedure rb_HRDChange(Sender: TObject);
  private

  public

  end;

var
  FORMYLA: TFORMYLA;
   a,b,c:real;
implementation

{$R *.lfm}

{ TFORMYLA }

procedure TFORMYLA.bt_CLEARClick(Sender: TObject);
begin
ed_NACH.Clear;
ed_STAVKA.Clear;
ed_PERIOD.Clear;
ed_SYMMA.Clear;
ed_sSYM.Clear;
ed_NADB.Clear;
ed_sNADB.Clear;
end;

function bob:real;
var
i,j:real;
begin
bob:=a;
i:=1;
while i<=c do begin
j:= bob/100;
bob:=j*b+bob;
i+=1;
end;
end;

procedure TFORMYLA.bt_REZClick(Sender: TObject);
const
  MaxLengthChil = 1.e38;
var simple,hard:real ;
begin

  if (ed_NACH.Text = '') or (ed_STAVKA.Text = '') or (ed_PERIOD.Text = '')  then  begin
  Showmessage('Введите число!');
  end
  else
  begin
b:=StrToFloat(ed_STAVKA.Text);
c:=StrToFloat(ed_PERIOD.Text);
a:=StrToFloat(ed_NACH.Text);
if (b <= 100) and (c >= 2) and (a < 100000) and (c<100) then begin
   Simple:=(a/100)*c*b+a;
   hard:=bob;
    end
else   begin
  ShowMessage('НЕВЕРНЫЕ ЗНАЧЕНИЯ!!!');
  ed_NACH.Clear;
  ed_STAVKA.Clear;
  ed_PERIOD.Clear;
  ed_SYMMA.Clear;
  ed_sSYM.Clear;
  ed_NADB.Clear;
  ed_sNADB.Clear;
  Simple:=0;
  Hard:=0;
  end;
if c < MaxLengthChil then  begin
   ed_SYMMA.Text:=FloatToStr(Simple) ;
   ed_sSYM.Text:=FloatToStr(Hard) ;
   ed_NADB.Text:=FloatToStr(Simple-a);
   ed_sNADB.Text:=FloatToStr (Hard-a)
    end
else    begin
ShowMessage('Переполнение числа');
ed_NACH.Clear;
ed_STAVKA.Clear;
ed_PERIOD.Clear;
ed_SYMMA.Clear;
ed_sSYM.Clear;
ed_NADB.Clear;
ed_sNADB.Clear;
  Simple:=0;
  Hard:=0;
  end;
end;
  end;


     procedure TFORMYLA.ed_PERIODKeyPress(Sender: TObject; var Key: char);
begin
    if not (Key in ['0'..'9', ',', #8]) then
    Key := #0;

  if (Key = ',') and (Pos(',', ed_PERIOD.Text) > 0) then
    Key := #0;
end;

procedure TFORMYLA.rb_SMLChange(Sender: TObject);
begin
     im_MENU.Visible:=false;
     Simple____.Visible:=true;
     Hard___.Visible:=false;
end;

procedure TFORMYLA.rb_HRDChange(Sender: TObject);
begin
im_MENU.Visible:=false;
   Simple____.Visible:=false;
   Hard___.Visible:=true;
end;

procedure TFORMYLA.ed_STAVKAKeyPress(Sender: TObject; var Key: char);

begin

  if not (Key in ['0'..'9', ',', #8]) then
  Key := #0;

if (Key = ',') and (Pos(',', ed_STAVKA.Text) > 0) then
  Key := #0;

  end;



procedure TFORMYLA.ed_NACHKeyPress(Sender: TObject; var Key: char);
begin

  if not (Key in ['0'..'9', ',', #8]) then
  Key := #0;

if (Key = ',') and (Pos(',', ed_NACH.Text) > 0) then
  Key := #0;

  end;



end.

