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
  protected
  public
    constructor Create;
  published
  end;

implementation

{ TProtocolMessageHandshake }

constructor TProtocolMessageHandshake.Create;
begin
  FMessageType:= pmtHandshake;
end;

end.

