unit TestNosoProtocolMessagesHandshake;

{$mode objfpc}{$H+}

interface

uses
  Classes
, SysUtils
, fpcunit
//, testutils
, testregistry
, NosoProtocol.Messages
, NosoProtocol.Messages.Handshake
;

type

  { TTestNosoProtocolMessagesHandshake }

  TTestNosoProtocolMessagesHandshake = class(TTestCase)
  private
    FProtocolMessageHandshake: TProtocolMessageHandshake;
  protected
  public
  published
    procedure TestNosoProtocolMessageHandshakeCreate;
    procedure TestNosoProtocolMessageHandshakeMessageType;
  end;

implementation

procedure TTestNosoProtocolMessagesHandshake.TestNosoProtocolMessageHandshakeCreate;
begin
  FProtocolMessageHandshake:= TProtocolMessageHandshake.Create;
  AssertNotNull('Protocol Message Handshake is not null', FProtocolMessageHandshake);
  FProtocolMessageHandshake.Free;
end;

procedure TTestNosoProtocolMessagesHandshake.TestNosoProtocolMessageHandshakeMessageType;
begin
  FProtocolMessageHandshake:= TProtocolMessageHandshake.Create;
  AssertEquals('Protocol Message Ping is of type pmtHandshake', Ord(pmtHandshake), Ord(FProtocolMessageHandshake.MessageType));
  FProtocolMessageHandshake.Free;
end;



initialization

  RegisterTest(TTestNosoProtocolMessagesHandshake);
end.

