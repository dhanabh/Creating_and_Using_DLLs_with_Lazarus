library Test;

{$mode objfpc}{$H+}

uses
  Classes, SysUtils
  { you can add units after this };
Type
  arr = Array[1..5] of Integer;

function GetNumberI(): Integer; stdcall  ;
begin
   Result:=2917;
end;
function GetNumberII(num: Integer):Integer;stdcall;
begin
   Result := 2917*num;
end;

function GetArray(): arr; stdcall;
var
tv : arr;
x : integer;
begin
    for  x := 1 to 5 do
    begin
       tv[x] := x *10;
    end;
    Result := tv;
end;

exports GetNumberI, GetNumberII, GetArray;
begin




end.

