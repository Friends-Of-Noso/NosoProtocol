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
    procedure TestNosoProtocolMessagePongCreateFromMessage;
  end;

implementation

const
  cPongString =
    cMagicString + ' ' +
    cProtocolVersion + ' ' +
    cApplicationVersion + ' ' +
    '120 ' +
    cMessagePong + ' ' +
    '0 ' +
    '0 ' +
    '4E8A4743AA6083F3833DDA1216FE3717 ' +
    'D41D8CD98F00B204E9800998ECF8427E ' +
    '0 ' +
    'D41D8CD98F00B204E9800998ECF8427E ' +
    '0 ' +
    '8080 ' +
    'D41D8 ' +
    '0 ' +
    '0000 ' +
    '0 ' +
    'D41D8CD98F00B204E9800998ECF8427E ' +
    'D41D8 ' +
    'D41D8'
  ;

{ TTestNosoProtocolMessagesPong }

procedure TTestNosoProtocolMessagesPong.TestNosoProtocolMessagePongCreate;
begin
  FProtocolMessagePong:= TProtocolMessagePong.Create;

  AssertNotNull('Protocol Message Pong is not null', FProtocolMessagePong);
  AssertEquals('Protocol Message Pong is of type pmtPong', Ord(pmtPong), Ord(FProtocolMessagePong.MessageType));

  FProtocolMessagePong.Free;
end;

procedure TTestNosoProtocolMessagesPong.TestNosoProtocolMessagePongCreateFromMessage;
begin
  FProtocolMessagePong:= TProtocolMessagePong.Create(cPongString);

  AssertNotNull('Protocol Message Ping is not null', FProtocolMessagePong);
  AssertEquals('Protocol Message Ping is of type pmtPong', Ord(pmtPong), Ord(FProtocolMessagePong.MessageType));
  AssertEquals('Protocol Message Ping Magic String', cMagicString, FProtocolMessagePong.MagicString);
  AssertEquals('Protocol Message Ping Protocol Version', cProtocolVersion, IntToStr(FProtocolMessagePong.ProtocolVersion));
  AssertEquals('Protocol Message Ping Application Version', cApplicationVersion, FProtocolMessagePong.ApplicationVersion);
  AssertEquals('Protocol Message Ping Timestamp', 120, FProtocolMessagePong.Timestamp);
  AssertEquals('Protocol Message Ping Connections', 0, FProtocolMessagePong.Connections);
  AssertEquals('Protocol Message Ping Block', 0, FProtocolMessagePong.Block);
  AssertEquals('Protocol Message Ping Block Hash', '4E8A4743AA6083F3833DDA1216FE3717', FProtocolMessagePong.BlockHash);
  AssertEquals('Protocol Message Ping Summary Hash', 'D41D8CD98F00B204E9800998ECF8427E', FProtocolMessagePong.SummaryHash);
  AssertEquals('Protocol Message Ping Block', 0, FProtocolMessagePong.Block);
  AssertEquals('Protocol Message Ping Pending', 0, FProtocolMessagePong.Pending);
  AssertEquals('Protocol Message Ping Headers Hash', 'D41D8CD98F00B204E9800998ECF8427E', FProtocolMessagePong.HeadersHash);
  AssertEquals('Protocol Message Ping Connection Status', 0, FProtocolMessagePong.ConnectionStatus);
  AssertEquals('Protocol Message Ping Port', 8080, FProtocolMessagePong.Port);
  AssertEquals('Protocol Message Ping Master Nodes Hash', 'D41D8', FProtocolMessagePong.MasterNodesHash);
  AssertEquals('Protocol Message Ping Master Nodes Count', 0, FProtocolMessagePong.MasterNodesCount);
  AssertEquals('Protocol Message Ping Difference Hash', '0000', FProtocolMessagePong.DifferenceHash);
  AssertEquals('Protocol Message Ping Checked Master Nodes', 0, FProtocolMessagePong.CheckedMasterNodes);
  AssertEquals('Protocol Message Ping Governance Hash', 'D41D8CD98F00B204E9800998ECF8427E', FProtocolMessagePong.GovernanceHash);
  AssertEquals('Protocol Message Ping Config Hash', 'D41D8', FProtocolMessagePong.ConfigHash);
  AssertEquals('Protocol Message Ping PSO Hash', 'D41D8', FProtocolMessagePong.PSOHash);

  FProtocolMessagePong.Free;
end;

initialization

  RegisterTest(TTestNosoProtocolMessagesPong);
end.

