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
  protected
  public
    constructor Create;

  published
  end;

implementation

{ TProtocolMessagePong }

constructor TProtocolMessagePong.Create;
begin
  FMessageType:= pmtPong;
end;

end.

