//---------------------------------------------------------------------------

// This software is Copyright (c) 2018 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit uLoginFrame1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Objects, FMX.Controls.Presentation, FMX.Edit, FMX.MultiView;

type
  TLoginFrame1 = class(TFrame)
    BackgroundRect: TRectangle;
    VertScrollBox1: TVertScrollBox;
    LogoLayout: TLayout;
    FormLayout: TLayout;
    edtEmail: TEdit;
    edtSenha: TEdit;
    AccountLayout: TLayout;
    CreateAccountText: TText;
    NeedHelpText: TText;
    HeaderToolBar: TToolBar;
    MenuButton: TButton;
    DrawerMultiView: TMultiView;
    BackgroundImage: TImage;
    FooterLayout: TLayout;
    ExperienceText: TText;
    LockImage: TImage;
    MailImage: TImage;
    LogoImage: TImage;
    AuthenticateRectBTN: TRectangle;
    btnEntrar: TLabel;
    Label1: TLabel;
    procedure VertScrollBox1Resize(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TLoginFrame1.btnEntrarClick(Sender: TObject);
begin
    if (edtEmail.Text = 'J') and (edtSenha.Text = 'J')then


    else
       ShowMessage('Usu�rio ou Senha inv�lido');
end;

procedure TLoginFrame1.VertScrollBox1Resize(Sender: TObject);
begin
DrawerMultiView.Width := VertScrollBox1.Width-(VertScrollBox1.Width/6);
end;

end.
