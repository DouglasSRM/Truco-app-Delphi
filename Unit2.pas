unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.Layouts, FMX.Objects;

type

  TOnValueChanged = procedure(Sender: TObject; NewValue: string) of object;

  TForm2 = class(TForm)
    lb_alterar: TLabel;
    txt_alterar: TEdit;
    btn_cancelar: TButton;
    btn_alterar: TButton;
    lb_desc: TLabel;
    grid1: TGridPanelLayout;
    grid2: TGridPanelLayout;
    Layout1: TLayout;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);

  private
    FOnValueChanged: TOnValueChanged;
    { Private declarations }
  public
    property OnValueChanged: TonValueChanged read FOnValueChanged write FOnValueChanged;
    { Public declarations }
  end;

var
  Form2: TForm2;
var nomeAlterar : String;

implementation

{$R *.fmx}

procedure TForm2.btn_alterarClick(Sender: TObject);
begin
  if (txt_alterar.Text <> '') then
  begin
    if Assigned (FOnValueChanged) then
    begin
      FOnValueChanged(Self, txt_alterar.Text); //Dispara o evento com o novo valor
    end;
    Close;
  end;
end;

procedure TForm2.btn_cancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  lb_desc.Text := 'Nome atual: ' + nomeAlterar;
end;


end.
