unit NosoProtocol.Messages;

{$mode ObjFPC}{$H+}

interface

uses
  Classes
, SysUtils
;

type
{ TProtocolMessageType }
  TProtocolMessageType = (pmtUnknown, pmtPing, pmtPong);

{ TProtocolMessage }
  TProtocolMessage = class(TObject)
  private
  protected
    FMessageType: TProtocolMessageType;
  public
    constructor Create;

    property MessageType: TProtocolMessageType
      read FMessageType;
  published
  end;

implementation

{ TProtocolMessage }

constructor TProtocolMessage.Create;
begin
  FMessageType:= pmtUnknown;
end;

end.

