program TestNosoProtocolGUI;

{$mode objfpc}{$H+}

uses
  Interfaces
, Forms
, GuiTestRunner
, TestNosoProtocolMessagesPing
, TestNosoProtocolMessagesPong
;

{$R *.res}

begin
  Application.Title:='Test Noso Protocol';
  Application.Initialize;
  Application.CreateForm(TGuiTestRunner, TestRunner);
  Application.Run;
end.

