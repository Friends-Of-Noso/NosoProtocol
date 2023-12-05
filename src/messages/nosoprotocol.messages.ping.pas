unit NosoProtocol.Messages.Ping;

{$mode ObjFPC}{$H+}

interface

uses
  Classes
, SysUtils
, NosoProtocol.Messages
;

type
{ TProtocolMessagePing }
  TProtocolMessagePing = class(TProtocolMessage)
  private
  protected
  public
    constructor Create;
  published
  end;

implementation

{ TProtocolMessagePing }

constructor TProtocolMessagePing.Create;
begin
  FMessageType:= pmtPing;
end;

end.

