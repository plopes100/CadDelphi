Unit UViaCep;

// Agredicementos a (Vinicius Sanchez viniciussanchez - GIT)

Interface

Uses IdHTTP, IdSSLOpenSSL, UViaCepDados;

Type
  TViaCEP = class
  Private
    FIdHTTP: TIdHTTP;
  public
    constructor Create;
    destructor Destroy; override;
    function Get(const ACep: string): TViaCEPDados;
    function Validate(const ACep: string): Boolean;
  end;

implementation

{ TViaCEP }

uses System.Classes, REST.Json, System.SysUtils;

constructor TViaCEP.Create;
begin
  FIdHTTP := TIdHTTP.Create;
end;

function TViaCEP.Get(const ACep: string): TViaCEPDados;
const
  URL = 'http://viacep.com.br/ws/%s/json';
  INVALID_CEP = '{'#$A'  "erro": true'#$A'}';
var
  LResponse: TStringStream;
begin
  Result := nil;
  LResponse := TStringStream.Create;
  try
    FIdHTTP.Get(Format(URL, [ACep.Trim]), LResponse);
    if (FIdHTTP.ResponseCode = 200) and (not (LResponse.DataString).Equals(INVALID_CEP)) then
      Result := TJson.JsonToObject<TViaCEPDados>(UTF8ToString(PAnsiChar(AnsiString(LResponse.DataString))));
  finally
    LResponse.Free;
  end;
end;

function TViaCEP.Validate(const ACep: string): Boolean;
const
  INVALID_CHARACTER = -1;
begin
  Result := True;
  if ACep.Trim.Length <> 8 then
    Exit(False);
  if StrToIntDef(ACep, INVALID_CHARACTER) = INVALID_CHARACTER then
    Exit(False);
end;

destructor TViaCEP.Destroy;
begin
  FIdHTTP.Free;
  inherited;
end;

End.
