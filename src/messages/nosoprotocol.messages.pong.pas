unit NosoProtocol.Messages.Pong;

{$mode ObjFPC}{$H+}

interface

uses
  Classes
, SysUtils
, NosoProtocol.Messages
;

type
{ TProtocolMessagePong }
  TProtocolMessagePong = class(TProtocolMessage)
  private
    FTimestamp: Int64;
    FConnections: Integer;
    FBlock: Int64;
    FBlockHash: String;
    FSummaryHash: String;
    FPending: Int64;
    FHeadersHash: String;
    FConnectionStatus: Integer;
    FPort: Integer;
    FMasterNodesHash: String;
    FMasterNodesCount: Int64;
    FDifferenceHash: String;
    FCheckedMasterNodes: Int64;
    FGovernanceHash: String;
    FConfigHash: String;
    FPSOHash: String;

    function GetAsString: String;
  protected
  public
    constructor Create;
    constructor Create(const AMessage: String);

    property Timestamp: Int64
      read FTimestamp
      write FTimestamp;
    property Connections: Integer
      read FConnections
      write FConnections;
    property Block: Int64
      read FBlock
      write FBlock;
    property BlockHash: String
      read FBlockHash
      write FBlockHash;
    property SummaryHash: String
      read FSummaryHash
      write FSummaryHash;
    property Pending: Int64
      read FPending
      write FPending;
    property HeadersHash: String
      read FHeadersHash
      write FHeadersHash;
    property ConnectionStatus: Integer
      read FConnectionStatus
      write FConnectionStatus;
    property Port: Integer
      read FPort
      write FPort;
    property MasterNodesHash: String
      read FMasterNodesHash
      write FMasterNodesHash;
    property MasterNodesCount: Int64
      read FMasterNodesCount
      write FMasterNodesCount;
    property DifferenceHash: String
      read FDifferenceHash
      write FDifferenceHash;
    property CheckedMasterNodes: Int64
      read FCheckedMasterNodes
      write FCheckedMasterNodes;
    property GovernanceHash: String
      read FGovernanceHash
      write FGovernanceHash;
    property ConfigHash: String
      read FConfigHash
      write FConfigHash;
    property PSOHash: String
      read FPSOHash
      write FPSOHash;

    property AsString: String
      read GetAsString;
  published
  end;

implementation

{ TProtocolMessagePong }

function TProtocolMessagePong.GetAsString: String;
begin
  Result:=
    FMagicString + ' ' +
    IntToStr(FProtocolVersion) + ' ' +
    FApplicationVersion + ' ' +
    IntToStr(FTimestamp) + ' ' +
    cMessagePong + ' ' +
    IntToStr(FConnections) + ' ' +
    IntToStr(FBlock) + ' ' +
    FBlockHash + ' ' +
    FSummaryHash + ' ' +
    IntToStr(FPending) + ' ' +
    FHeadersHash + ' ' +
    IntToStr(FConnectionStatus) + ' ' +
    IntToStr(FPort) + ' ' +
    FMasterNodesHash + ' ' +
    IntToStr(FMasterNodesCount) + ' ' +
    FDifferenceHash + ' ' +
    IntToStr(FCheckedMasterNodes) + ' ' +
    FGovernanceHash + ' ' +
    FConfigHash + ' ' +
    FPSOHash
  ;
end;

constructor TProtocolMessagePong.Create;
begin
  inherited Create;
  FMessageType:= pmtPong;
end;

constructor TProtocolMessagePong.Create(const AMessage: String);
var
  messageParams: TStringArray;
begin
  messageParams:= Amessage.Split([' ']);

  Create;
  FMagicString:= messageParams[0];
  FProtocolVersion:= StrToInt(messageParams[1]);
  FApplicationVersion:= messageParams[2];
  FTimestamp:= StrToInt(messageParams[3]);
  // Index 4 is the message type
  FConnections:= StrToInt(messageParams[5]);
  FBlock:= StrToInt(messageParams[6]);
  FBlockHash:= messageParams[7];
  FSummaryHash:= messageParams[8];
  FPending:= StrToInt(messageParams[9]);
  FHeadersHash:= messageParams[10];
  FConnectionStatus:= StrToInt(messageParams[11]);
  FPort:= StrToInt(messageParams[12]);
  FMasterNodesHash:= messageParams[13];
  FMasterNodesCount:= StrToInt(messageParams[14]);
  FDifferenceHash:= messageParams[15];
  FCheckedMasterNodes:= StrToInt(messageParams[16]);
  FGovernanceHash:= messageParams[17];
  FConfigHash:= messageParams[18];
  FPSOHash:= messageParams[19];

  SetLength(messageParams, 0);
end;

end.

