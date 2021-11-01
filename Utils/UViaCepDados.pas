Unit UViaCepDados;

Interface

uses REST.Json.Types;

type
  TViaCEPDados = class
  private
    FLogradouro: string;
    [JSONNameAttribute('ibge')]
    FIBGE: string;
    FBairro: string;
    [JSONNameAttribute('uf')]
    FUF: string;
    [JSONNameAttribute('cep')]
    FCEP: string;
    FLocalidade: string;
    FComplemento: string;
    [JSONNameAttribute('gia')]
    FGIA: string;
    [JSONNameAttribute('ddd')]
    FDDD: string;
    procedure SetBairro(const Value: string);
    procedure SetCEP(const Value: string);
    procedure SetComplemento(const Value: string);
    procedure SetGIA(const Value: string);
    procedure SetIBGE(const Value: string);
    procedure SetLocalidade(const Value: string);
    procedure SetLogradouro(const Value: string);
    procedure SetUF(const Value: string);
    procedure SetDDD(const Value: string);
  public
    property CEP: string read FCEP write SetCEP;
    property Logradouro: string read FLogradouro write SetLogradouro;
    property Complemento: string read FComplemento write SetComplemento;
    property Bairro: string read FBairro write SetBairro;
    property Localidade: string read FLocalidade write SetLocalidade;
    property UF: string read FUF write SetUF;
    property IBGE: string read FIBGE write SetIBGE;
    property GIA: string read FGIA write SetGIA;
    property DDD: string read FDDD write SetDDD;
    function ToJSONString: string;
    class function FromJSONString(const AJSONString: string): TViaCEPDados;
  end;

implementation

uses REST.Json;

{ TViaCEPClass }

class function TViaCEPDados.FromJSONString(const AJSONString: string): TViaCEPDados;
begin
  Result := TJson.JsonToObject<TViaCEPDados>(AJSONString);
end;

procedure TViaCEPDados.SetBairro(const Value: string);
begin
  FBairro := Value;
end;

procedure TViaCEPDados.SetCEP(const Value: string);
begin
  FCEP := Value;
end;

procedure TViaCEPDados.SetComplemento(const Value: string);
begin
  FComplemento := Value;
end;

procedure TViaCEPDados.SetDDD(const Value: string);
begin
  FDDD := Value;
end;

procedure TViaCEPDados.SetGIA(const Value: string);
begin
  FGIA := Value;
end;

procedure TViaCEPDados.SetIBGE(const Value: string);
begin
  FIBGE := Value;
end;

procedure TViaCEPDados.SetLocalidade(const Value: string);
begin
  FLocalidade := Value;
end;

procedure TViaCEPDados.SetLogradouro(const Value: string);
begin
  FLogradouro := Value;
end;

procedure TViaCEPDados.SetUF(const Value: string);
begin
  FUF := Value;
end;

function TViaCEPDados.ToJSONString: string;
begin
  Result := TJson.ObjectToJsonString(Self, [joIgnoreEmptyStrings]);
end;

End.
