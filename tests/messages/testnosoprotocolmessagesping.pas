unit TestNosoProtocolMessagesPing;

{$mode objfpc}{$H+}

interface

uses
  Classes
, SysUtils
, fpcunit
//, testutils
, testregistry
, NosoProtocol.Messages
, NosoProtocol.Messages.Ping
;

type

  { TTestNosoProtocolMessagesPing }

  TTestNosoProtocolMessagesPing = class(TTestCase)
  private
    FProtocolMessagePing: TProtocolMessagePing;
  protected
  public
  published
    procedure TestNosoProtocolMessagePingCreate;
    procedure TestNosoProtocolMessagePingMessageType;
  end;

implementation

procedure TTestNosoProtocolMessagesPing.TestNosoProtocolMessagePingCreate;
begin
  FProtocolMessagePing:= TProtocolMessagePing.Create;
  AssertNotNull('Protocol Message Ping is not null', FProtocolMessagePing);
  FProtocolMessagePing.Free;
end;

procedure TTestNosoProtocolMessagesPing.TestNosoProtocolMessagePingMessageType;
begin
  FProtocolMessagePing:= TProtocolMessagePing.Create;
  AssertEquals('Protocol Message Ping is of type pmtPing', Ord(pmtPing), Ord(FProtocolMessagePing.MessageType));
  FProtocolMessagePing.Free;
end;



initialization

  RegisterTest(TTestNosoProtocolMessagesPing);
end.

