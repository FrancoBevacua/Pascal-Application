unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls,
  ExtCtrls, ExtDlgs, Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    addUserBtn: TButton;
    addUser: TEdit;
    saveAllBtn: TBitBtn;
    limpiarBtn: TButton;
    openUserPicBtn: TButton;
    SaveDialog1: TSaveDialog;
    userPic: TImage;
    Label1: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    selectBtn: TButton;
    deleteBtn: TButton;
    userList: TListBox;
    procedure addUserBtnClick(Sender: TObject);
    procedure deleteBtnClick(Sender: TObject);
    procedure limpiarBtnClick(Sender: TObject);
    procedure openUserPicBtnClick(Sender: TObject);
    procedure saveAllBtnClick(Sender: TObject);
    procedure selectBtnClick(Sender: TObject);
  private

  public

  end;

var
  App: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

{eliminar elemento seleccionado}
procedure TForm1.deleteBtnClick(Sender: TObject);
begin
  if userList.ItemIndex > -1 then
     userList.Items.Delete(userList.ItemIndex);
end;
{limpiar lista}
procedure TForm1.limpiarBtnClick(Sender: TObject);
begin
  userList.Clear;
end;
{abrir dialogo de archivos para buscar imagen e insertarla en userPic}
procedure TForm1.openUserPicBtnClick(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
     userPic.Picture.LoadFromFile(OpenPictureDialog1.FileName);
end;
{Almacenar en base de datos}
procedure TForm1.saveAllBtnClick(Sender: TObject);
begin
if SaveDialog1.Execute then
   userList.Items.SaveToFile(SaveDialog1.FileName);
   userPic.Picture.SaveToFile(SaveDialog1.FileName);
end;

{seleccionar todos los elementos, activar multiselection en las propiedades del obj}
procedure TForm1.selectBtnClick(Sender: TObject);
begin
 userList.SelectAll;
end;

{agregar usuario a la lista}
procedure TForm1.addUserBtnClick(Sender: TObject);
var user : string;
begin
     user := addUser.Text;
     with userList.Items do
     begin
       Add(user);
       addUser.Clear;
     end;
end;

end.
