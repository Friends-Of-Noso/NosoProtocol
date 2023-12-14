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
    procedure TestNosoProtocolMessageHandshakeCreateFromString;
    procedure TestNosoProtocolMessageHandshakeAsString;
  end;

implementation

const
  cHandshakeString =
    cMagicString + ' ' +
    '127.0.0.1 ' +
    cLegacyVersion + ' ' +
    '120'
  ;

{ TTestNosoProtocolMessagesHandshake }

procedure TTestNosoProtocolMessagesHandshake.TestNosoProtocolMessageHandshakeCreate;
begin
  FProtocolMessageHandshake:= TProtocolMessageHandshake.Create;
  AssertEquals('Protocol Message Handshake is of type pmtHandshake', Ord(pmtHandshake), Ord(FProtocolMessageHandshake.MessageType));
  AssertNotNull('Protocol Message Handshake is not null', FProtocolMessageHandshake);
  AssertEquals('Protocol Message Handshake Magic String', cMagicString, FProtocolMessageHandshake.MagicString);
  AssertEquals('Protocol Message Handshake IP Address', '127.0.0.1', FProtocolMessageHandshake.IPAddress);
  AssertEquals('Protocol Message Handshake Application Version', cLegacyVersion, FProtocolMessageHandshake.ApplicationVersion);
  AssertEquals('Protocol Message Handshake Timestamp', -1, FProtocolMessageHandshake.Timestamp);
  FProtocolMessageHandshake.Free;
end;

procedure TTestNosoProtocolMessagesHandshake.TestNosoProtocolMessageHandshakeCreateFromString;
begin
  FProtocolMessageHandshake:= TProtocolMessageHandshake.Create(cHandshakeString);
  AssertNotNull('Protocol Message Handshake is not null', FProtocolMessageHandshake);
  AssertEquals('Protocol Message Handshake Magic String', cMagicString, FProtocolMessageHandshake.MagicString);
  AssertEquals('Protocol Message Handshake IP Address', '127.0.0.1', FProtocolMessageHandshake.IPAddress);
  AssertEquals('Protocol Message Handshake Application Version', cLegacyVersion, FProtocolMessageHandshake.ApplicationVersion);
  AssertEquals('Protocol Message Handshake Timestamp', 120, FProtocolMessageHandshake.Timestamp);
  FProtocolMessageHandshake.Free;
end;

procedure TTestNosoProtocolMessagesHandshake.TestNosoProtocolMessageHandshakeAsString;
begin
  FProtocolMessageHandshake:= TProtocolMessageHandshake.Create(cHandshakeString);

  AssertEquals('Protocol Message Handshake String', cHandshakeString, FProtocolMessageHandshake.AsString);

  FProtocolMessageHandshake.Free;
end;



initialization

  RegisterTest(TTestNosoProtocolMessagesHandshake);
end.

