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
    procedure TestNosoProtocolMessagePingCreateFromString;
  end;

implementation

const
  cPingString =
    cMagicString + ' ' +
    cProtocolVersion + ' ' +
    cApplicationVersion + ' ' +
    '120 ' +
    cMessagePing + ' ' +
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

procedure TTestNosoProtocolMessagesPing.TestNosoProtocolMessagePingCreate;
begin
  FProtocolMessagePing:= TProtocolMessagePing.Create;

  AssertNotNull('Protocol Message Ping is not null', FProtocolMessagePing);
  AssertEquals('Protocol Message Ping is of type pmtPing', Ord(pmtPing), Ord(FProtocolMessagePing.MessageType));

  FProtocolMessagePing.Free;
end;

procedure TTestNosoProtocolMessagesPing.TestNosoProtocolMessagePingCreateFromString;
begin
  FProtocolMessagePing:= TProtocolMessagePing.Create(cPingString);

  AssertNotNull('Protocol Message Ping is not null', FProtocolMessagePing);
  AssertEquals('Protocol Message Ping is of type pmtPing', Ord(pmtPing), Ord(FProtocolMessagePing.MessageType));
  AssertEquals('Protocol Message Ping Magic String', cMagicString, FProtocolMessagePing.MagicString);
  AssertEquals('Protocol Message Ping Protocol Version', cProtocolVersion, IntToStr(FProtocolMessagePing.ProtocolVersion));
  AssertEquals('Protocol Message Ping Application Version', cApplicationVersion, FProtocolMessagePing.ApplicationVersion);
  AssertEquals('Protocol Message Ping Timestamp', 120, FProtocolMessagePing.Timestamp);
  AssertEquals('Protocol Message Ping Connections', 0, FProtocolMessagePing.Connections);
  AssertEquals('Protocol Message Ping Block', 0, FProtocolMessagePing.Block);
  AssertEquals('Protocol Message Ping Block Hash', '4E8A4743AA6083F3833DDA1216FE3717', FProtocolMessagePing.BlockHash);
  AssertEquals('Protocol Message Ping Summary Hash', 'D41D8CD98F00B204E9800998ECF8427E', FProtocolMessagePing.SummaryHash);
  AssertEquals('Protocol Message Ping Block', 0, FProtocolMessagePing.Block);
  AssertEquals('Protocol Message Ping Pending', 0, FProtocolMessagePing.Pending);
  AssertEquals('Protocol Message Ping Headers Hash', 'D41D8CD98F00B204E9800998ECF8427E', FProtocolMessagePing.HeadersHash);
  AssertEquals('Protocol Message Ping Connection Status', 0, FProtocolMessagePing.ConnectionStatus);
  AssertEquals('Protocol Message Ping Port', 8080, FProtocolMessagePing.Port);
  AssertEquals('Protocol Message Ping Master Nodes Hash', 'D41D8', FProtocolMessagePing.MasterNodesHash);
  AssertEquals('Protocol Message Ping Master Nodes Count', 0, FProtocolMessagePing.MasterNodesCount);
  AssertEquals('Protocol Message Ping Difference Hash', '0000', FProtocolMessagePing.DifferenceHash);
  AssertEquals('Protocol Message Ping Checked Master Nodes', 0, FProtocolMessagePing.CheckedMasterNodes);
  AssertEquals('Protocol Message Ping Governance Hash', 'D41D8CD98F00B204E9800998ECF8427E', FProtocolMessagePing.GovernanceHash);
  AssertEquals('Protocol Message Ping Config Hash', 'D41D8', FProtocolMessagePing.ConfigHash);
  AssertEquals('Protocol Message Ping PSO Hash', 'D41D8', FProtocolMessagePing.PSOHash);

  FProtocolMessagePing.Free;
end;

initialization

  RegisterTest(TTestNosoProtocolMessagesPing);
end.

