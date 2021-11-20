unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,dynLibs;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

Type
  arr = Array[1..5] of Integer;
Type
  //TTestLib = function(num:Integer): Integer;stdcall;

  TTestLib = function(): arr;stdcall;
var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
 TestHandle: TLibHandle;
 testLibFun: TTestLib;
 tv : arr;
begin
  TestHandle := SafeLoadLibrary('./libtestlib.so');
  if TestHandle <> 0 then
  begin
    testLibFun := TTestLib(GetProcedureAddress(TestHandle,'GetArray'));
    if assigned(testLibFun) then
    begin
      tv := testLibFun();
    Edit1.Text := IntToStr(tv[3])


    end
    else
    Edit1.Text := ('function not found');
  end
  else Edit1.Text := ('Library not found!');
end;

end.

