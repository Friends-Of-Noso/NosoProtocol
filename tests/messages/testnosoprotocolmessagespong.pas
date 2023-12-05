unit TestNosoProtocolMessagesPong;

{$mode objfpc}{$H+}

interface

uses
  Classes
, SysUtils
, fpcunit
//, testutils
, testregistry
, NosoProtocol.Messages
, NosoProtocol.Messages.Pong
;

type

  { TTestNosoProtocolMessagesPong }

  TTestNosoProtocolMessagesPong = class(TTestCase)
  private
    FProtocolMessagePong: TProtocolMessagePong;
  protected
  public
  published
    procedure TestNosoProtocolMessagePongCreate;
    procedure TestNosoProtocolMessagePongMessageType;
  end;

implementation

{ TTestNosoProtocolMessagesPong }

procedure TTestNosoProtocolMessagesPong.TestNosoProtocolMessagePongCreate;
begin
  FProtocolMessagePong:= TProtocolMessagePong.Create;
  AssertNotNull('Protocol Message Pong is not null', FProtocolMessagePong);
  FProtocolMessagePong.Free;
end;

procedure TTestNosoProtocolMessagesPong.TestNosoProtocolMessagePongMessageType;
begin
  FProtocolMessagePong:= TProtocolMessagePong.Create;
  AssertEquals('Protocol Message Pong is of type pmtPong', Ord(pmtPong), Ord(FProtocolMessagePong.MessageType));
  FProtocolMessagePong.Free;
end;



initialization

  RegisterTest(TTestNosoProtocolMessagesPong);
end.

