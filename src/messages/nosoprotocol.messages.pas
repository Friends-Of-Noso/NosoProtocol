unit NosoProtocol.Messages;

{$mode ObjFPC}{$H+}

interface

uses
  Classes
, SysUtils
;

const
  cMagicString = 'PSK';
  cProtocolVersion = '2';
  cApplicationVersion = {$I application-version.inc};

  cMessagePing = '$PING';
  cMessagePong = '$PONG';

type
{ TProtocolMessageType }
  TProtocolMessageType = (
    pmtUnknown,
    pmtHandshake,
    pmtPing,
    pmtPong
  );

{ TProtocolMessage }
  TProtocolMessage = class(TObject)
  private
  protected
    FMessageType: TProtocolMessageType;
    FMagicString: String;
    FProtocolVersion: Integer;
    FApplicationVersion: String;
  public
    constructor Create;

    property MessageType: TProtocolMessageType
      read FMessageType;

    property MagicString: String
      read FMagicString
      write FMagicString;

    property ProtocolVersion: Integer
      read FProtocolVersion
      write FProtocolVersion;

    property ApplicationVersion: String
      read FApplicationVersion
      write FApplicationVersion;
  published
  end;

implementation

{ TProtocolMessage }

constructor TProtocolMessage.Create;
begin
  FMessageType:= pmtUnknown;
  FMagicString:= cMagicString;
  FProtocolVersion:= StrToInt(cProtocolVersion);
  FApplicationVersion:= cApplicationVersion;
end;

end.

