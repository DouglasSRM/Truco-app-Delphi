unit Unit3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Objects;

type
  TForm3 = class(TForm)
    lb_t1: TLabel;
    lb_t2: TLabel;
    lb_t1pt: TLabel;
    lb_t2pt: TLabel;
    btn_continuar: TButton;
    lb_vencedores: TLabel;
    grid1: TGridPanelLayout;
    grid2: TGridPanelLayout;
    Layout1: TLayout;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure btn_continuarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
var t1nome, t2nome, t1pt, t2pt, vencedor: String;

implementation

{$R *.fmx}

procedure TForm3.btn_continuarClick(Sender: TObject);
begin
  Close;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  lb_t1.Text := t1nome;
  lb_t2.Text := t2nome;
  lb_t1pt.Text := t1pt;
  lb_t2pt.Text := t2pt;
  lb_vencedores.Text := 'Vencedores: ' + vencedor + '!!!';
end;

end.
