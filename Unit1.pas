unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Layouts, FMX.Controls.Presentation;

type
  TForm1 = class(TForm)
    btn_time2add: TButton;
    btn_time1add: TButton;
    lb_time1: TLabel;
    lb_time2: TLabel;
    lb_time1pt: TLabel;
    lb_time2pt: TLabel;
    btn_truco: TButton;
    btn_time1del: TButton;
    btn_time2del: TButton;
    btn_mudarT1: TButton;
    btn_mudart2: TButton;
    grid1: TGridPanelLayout;
    grid3: TGridPanelLayout;
    grid2: TGridPanelLayout;
    Image1: TImage;
    Layout1: TLayout;
    procedure btn_time1addClick(Sender: TObject);
    procedure btn_time2addClick(Sender: TObject);
    procedure btn_trucoClick(Sender: TObject);
    procedure btn_time1delClick(Sender: TObject);
    procedure btn_time2delClick(Sender: TObject);
    procedure btn_mudarT1Click(Sender: TObject);
    procedure btn_mudart2Click(Sender: TObject);

  private
    procedure AtualizarTime1(Sender: TObject; novoTime1: string);
    procedure AtualizarTime2(Sender: TObject; novoTime2: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
var pontosAdd : Integer;

implementation

{$R *.fmx}
{$R *.XLgXhdpiTb.fmx ANDROID}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.SmXhdpiPh.fmx ANDROID}
{$R *.LgXhdpiTb.fmx ANDROID}

uses Unit2, Unit3;

procedure TForm1.btn_mudarT1Click(Sender: TObject);
begin
  Unit2.nomeAlterar := lb_time1.Text;
  Form2 := TForm2.Create(self);
  try
    Form2.OnValueChanged := AtualizarTime1;
    Form2.Show;
  finally
  end;
end;

procedure TForm1.AtualizarTime1(Sender: TObject; novoTime1: string);
begin
  lb_time1.Text := novoTime1;
end;

procedure TForm1.btn_mudart2Click(Sender: TObject);
begin
  Unit2.nomeAlterar := lb_time2.Text;
  Form2 := TForm2.Create(self);
  try
    Form2.OnValueChanged := AtualizarTime2;
    Form2.Show;
  finally
  end;
end;

procedure TForm1.AtualizarTime2(Sender: TObject; novoTime2: string);
begin
  lb_time2.Text := novoTime2;
end;

procedure TForm1.btn_time1addClick(Sender: TObject);
var time1pt : Integer;
begin

  time1pt := strToInt(lb_time1pt.Text);

  if (pontosAdd < 3) then
  begin
    lb_time1pt.Text := IntToStr(time1pt + 1);
  end
  else
  begin
    lb_time1pt.Text := IntToStr(time1pt + pontosAdd);
    pontosAdd := 0;
    btn_truco.Text := 'Truco!';
  end;

  if (strToInt(lb_time1pt.Text) >= 12) then
  begin
    Unit3.t1nome := lb_time1.Text;
    Unit3.t2nome := lb_time2.Text;
    Unit3.t1pt := '12';
    Unit3.t2pt := lb_time2pt.Text;
    Unit3.vencedor := lb_time1.Text;

    Form3 := TForm3.Create(self);
    Form3.Show;

    lb_time1pt.Text := '0';
    lb_time2pt.Text := '0';
  end;

end;

procedure TForm1.btn_time1delClick(Sender: TObject);
begin

  if (strToInt(lb_time1pt.Text) > 0) then
  begin
    lb_time1pt.Text := IntToStr(strToInt(lb_time1pt.Text) - 1);
  end;

end;

procedure TForm1.btn_time2addClick(Sender: TObject);
var time2pt : Integer;
begin

  time2pt := strToInt(lb_time2pt.Text);

  if (pontosAdd < 3) then
  begin
    lb_time2pt.Text := IntToStr(time2pt + 1);
  end
  else
  begin
    lb_time2pt.Text := IntToStr(time2pt + pontosAdd);
    pontosAdd := 0;
    btn_truco.Text := 'Truco!';
  end;

  if (strToInt(lb_time2pt.Text) >= 12) then
  begin
    Unit3.t1nome := lb_time1.Text;
    Unit3.t2nome := lb_time2.Text;
    Unit3.t1pt := lb_time1pt.Text;
    Unit3.t2pt := '12';
    Unit3.vencedor := lb_time2.Text;

    Form3 := TForm3.Create(self);
    Form3.Show;

    lb_time1pt.Text := '0';
    lb_time2pt.Text := '0';
  end;

end;

procedure TForm1.btn_time2delClick(Sender: TObject);
begin
  if (strToInt(lb_time2pt.Text) > 0) then
  begin
    lb_time2pt.Text := IntToStr(strToInt(lb_time2pt.Text) - 1);
  end;
end;

procedure TForm1.btn_trucoClick(Sender: TObject);
begin

  if (pontosAdd < 9) then
  begin
    pontosAdd := pontosAdd + 3;
    btn_truco.Text := 'Truco (' + IntToStr(pontosAdd + 3) + ')';
  end
  else if (pontosAdd = 9) then
  begin
    pontosAdd := pontosAdd + 3;
    btn_truco.Text := 'Truco (1)';
  end
  else
  begin
    btn_truco.Text := 'Truco!';
    pontosAdd := 0;
  end;

end;

end.
