unit NosoProtocol.Messages.Handshake;

{$mode ObjFPC}{$H+}

interface

uses
  Classes
, SysUtils
, NosoProtocol.Messages
;

type
{ TProtocolMessageHandshake }
  TProtocolMessageHandshake = class(TProtocolMessage)
  private
    FIPAddress: String;
    FTimestamp: Int64;
    function GetAsString: String;
  protected
  public
    constructor Create;
    constructor Create(const Amessage: String);

    property IPAddress: String
      read FIPAddress
      write FIPAddress;

    property Timestamp: Int64
      read FTimestamp
      write FTimestamp;

    property AsString: String
      read GetAsString;
  published
  end;

implementation

{ TProtocolMessageHandshake }

function TProtocolMessageHandshake.GetAsString: String;
begin
  Result :=
    FMagicString + ' ' +
    FIPAddress + ' ' +
    FApplicationVersion + ' ' +
    IntToStr(FTimestamp);
end;

constructor TProtocolMessageHandshake.Create;
begin
  inherited Create;
  FMessageType:= pmtHandshake;
  FIPAddress:= '127.0.0.1';
  FApplicationVersion:= cApplicationVersion;
  FTimestamp:= -1;
end;

constructor TProtocolMessageHandshake.Create(const Amessage: String);
var
  messageParams: TStringArray;
begin
  messageParams:= Amessage.Split([' ']);

  Create;
  FMagicString:= messageParams[0];
  FIPAddress:= messageParams[1];
  FApplicationVersion:= messageParams[2];
  FTimestamp:= StrToInt(messageParams[3]);

  SetLength(messageParams, 0);
end;

end.

