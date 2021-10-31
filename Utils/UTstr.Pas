Unit UTStr;

Interface
   Uses
       Windows, Messages, SysUtils, Classes, Graphics, Math, StrUtils,
       Controls, Forms, Dialogs, StdCtrls, Db, Variants, UUtil;
   Type
       TVetInteger      = Array Of Integer;
       TVetString       = Array Of String;
       TConjuntoChar    = TSysCharSet;

       TStr    = Class
          Private
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   ObtemSenha(QtdeCaracteres: Integer; Tipo: Integer): String;

//******************************************************************************************
//==========================================================================================
          Public
             Class Function   AjustaEsquerda (Fonte:           String;
                                              Tamanho:         Integer;
                                              Preenchimento:   String):   String; Overload;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   AjustaEsquerda (Fonte:           String;
                                              Tamanho:         Integer):  String; Overload;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   AjustaDireita  (Fonte:           String;
                                              Tamanho:         Integer;
                                              Preenchimento:   String):   String; Overload;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   AjustaDireita  (Fonte:           String;
                                              Tamanho:         Integer):  String; Overload;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   Ajusta         (Fonte:           String;
                                              Tamanho:         Integer;
                                              Lado:            String;
                                              Preenchimento:   String):  String;  Overload;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   Ajusta         (Fonte:           String;
                                              Tamanho:         Integer;
                                              Lado:            String):    String;  Overload;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   Justifica      (Fonte:           String;
                                              Tamanho:         Integer;
                                              Caracter:        Char;
                                              Preenchimento:   String):   String; Overload;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   Justifica      (Fonte:           String;
                                              Tamanho:         Integer):  String; Overload;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   DeixaApenasUm  (Fonte:           WideString;
                                              Caracter:        Char):         String; Overload;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   DeixaApenasUm  (Fonte:           WideString):   String; Overload;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Procedure  RetornaPosicoes(Fonte:           String;
                                              Var Locais:      TVetInteger;
                                              Caracter:        Char);
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   RetQtdeOcorrenc(Fonte:           String;
                                              Caracter:        Char):     Integer;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   Insere         (Fonte:           String;
                                              Caracteres:      Array of Char;
                                              Locais:          Array of Integer): String;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   Formata        (Fonte:           String;
                                              Formato:         String;
                                              Comando:         String):   String;  OverLoad;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   ObtemNumero    (Fonte:           String;
                                              Var Numero:      Integer):  Boolean; OverLoad;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   ObtemNumero    (Fonte:           String;
                                              Var Numero:      Real):     Boolean; OverLoad;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   ObtemNumeroInt (Fonte:           String):   Integer;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   ObtemNumeroReal(Fonte:           String):   Real;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   Direita        (Fonte:           String;
                                              Inicio:          Integer):   String;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   Localiza       (Procurada:       String;
                                              Fonte:           String;
                                              Inicio:          Integer):   Integer;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   RetiraAcentos  (Fonte:           String):    String;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   CaracteresIBM  (Fonte:           String;
                                              Var CadeiaOk:    Boolean):   String;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   VerificaCadeia (Fonte:           String;
                                              Var Cadeia:      String;
                                              Conjunto:        TConjuntoChar): Boolean;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   OnlyDigitos    (Fonte:           String):    String;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   OnlyDigitosBr  (Fonte:           String):    String;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   OnlyLetras     (Fonte:           String):    String;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   OnlyLetrasBranco(Fonte:           String):    String;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   OnlyLetrasDig  (Fonte:           String):    String;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   OnlyIBM        (Fonte:           String):    String;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   OnlyIBMSemAcento(Fonte:           String):    String;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   GetSizeArq     (Fonte:           String):    LongInt;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   ExisteArquivo  (Fonte:           String):    Boolean;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   FormataCPF     (NumCpf:          String):    String;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   FormataCPFCNPJ (Num:             String):    String;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   VerificaCPF    (NumCpf:          String;
                                              Var Dig1:        String;
                                              Var Dig2:        String):    Boolean;   Overload;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   VerificaCPF    (NumCpf:          String):    Boolean;   Overload;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   VerificaCPFCNPJ(NumCpfCnpj:      String):    Boolean;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   VerificaCNPJ(NumCpfCnpj:         String):    Boolean;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   CalculaDigito  (Cadeia:          String;
                                              Tamanho:         Integer;
                                              DigitoInfo:      String;
                                              Var DigCalc:     String):    Boolean;   Overload;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   CalculaDigito  (Cadeia:          String;
                                              Tamanho:         Integer;
                                              Var DigCalc:     String):    Boolean;   Overload;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   CalculaDigito  (Cadeia:          Integer;
                                              Tamanho:         Integer):   String;    Overload;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   CalculaDigito  (Cadeia:          Integer;
                                              Tamanho:         Integer;
                                              DigitoInfo:      String;
                                              Var DigCalc:     String):    Boolean;   Overload;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   CalculaDigito  (Cadeia:          String;
                                              Multiplica:      String;
                                              Fator:           Integer):   String;    Overload;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Procedure  ClrScr;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   EhUmaDataValida(DataStr:         String;
                                              MensagemErro:    String):    Boolean;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   ObtemData      (DataStr:         String):    TDateTime;

/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   FormataCampoSql(Info:            Variant):   String;
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   BomDiaTardeNoite(): String;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   ProcuraNaLista(Cod:              String;
                                             Lista:            TStrings;
                                             Local:            Integer):     Integer;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   ObtemSenhaDigitos(QtdeCaracteres: Integer):       String;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   ObtemSenhaLetras(QtdeCaracteres: Integer):        String;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   ObtemSenhaDigitosLetras(QtdeCaracteres: Integer): String;
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   AproxNumero(Const Numero:       Extended;
                                          Const QtdeDecimais: Integer;
                                          Const Aproxima:     Boolean = True):  Extended;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Procedure  Ordena     (Const Vetor:        TStrings);
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Procedure  ImprDirecao(      Canvas:       TCanvas;
                                          Const X:            Integer;
                                          Const Y:            Integer;
                                          Const Info:         String;
                                                Fonte:        TFont;
                                          Const Direcao:      Integer = 900);
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   ObtemNomeArqRelat(Const Nome:     String;
                                                Const Exten:    String;
                                                Const QtdeDigs: Integer):     String;

/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   Space(Const Qtde:     Integer):                 String;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   FormataDir(Const Numero:   Integer;
                                         Const Tamanho:  Integer;
                                         Const Masc:     String):   String;     OverLoad;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   FormataDir(Const Numero:   Extended;
                                         Const Tamanho:  Integer;
                                         Const Masc:     String):   String;     OverLoad;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   FormataEsq(Const Numero:   Integer;
                                         Const Tamanho:  Integer;
                                         Const Masc:     String):   String;     Overload;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   FormataEsq(Const Numero:   Extended;
                                         Const Tamanho:  Integer;
                                         Const Masc:     String):   String;     Overload;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   CalcQtdeFolhas(Const QtdeReg:   Integer;
                                             Const RegPorPag: Integer):     Integer;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   Formata(Const Fonte:   String;
                                      Const Posicao: Integer):     String;      Overload;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   Formata(Const Fonte:    String;
                                      Const Posicao:  Integer;
                                      Const Caracter: String):     String;      Overload;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   FormataCep(Const Fonte: String):     String;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   RetiraAcentosMaisculo(Fonte:           String):    String;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   ObtemDiretorioBaseAplicacao():                     String;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   ObtemDiretorioBaseAplicacaoUmNivelAntes():         String;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   ObtemPosicaoCaracter(Const Fonte:      String;
                                                   Const Caracter:   Char;
                                                   Const Qtde:       Integer;
                                                   Const Inicio:     Integer;
                                                   Const Final:      Integer):      Integer;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   RetiraCrLf(Fonte:           String):                  String;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   EliminaString(Fonte: String; Elimina: String):        String;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   Criptografa(Fonte: String):                           String;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   DeCriptografa(Fonte: String):                         String;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Procedure  RetornaToken(    Fonte:           WideString;
                                           Var Tokens:          TVetString;
                                               Caracter:        Char);
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   Replicate(Info: String;   QtdeVezes: Integer):        String;
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   Elemento(Info: String):                               String;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   Valor(Info: String):                                  String;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Function   ValorBoolean(Info: Boolean):                          String;
/////////////////////////////////////////////////////////////////////////////////////////////////
             Class Procedure  RetornaCadeiasCenso (    Fonte:           String;
                                                   Var Cadeias:     TVetString;
                                                       Caracter:        Char);

/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
//******************************************************************************************
//==========================================================================================

             Class Function   PadraoDelphi(Entrada: String):                        String;
/////////////////////////////////////////////////////////////////////////////////////////////////



       End;


Implementation

       Uses
              HTTPApp,
              HTTPProd,
              WebReq;

/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.AjustaEsquerda(Fonte:            String;
                                           Tamanho:          Integer;
                                           Preenchimento:    String):  String;
      Var
         Trab: String;
      Begin
         Trab := Preenchimento;
         While (Length(Trab) < (Tamanho + 1)) Do
            Trab := Trab + Preenchimento;
         Result        := Copy(Trim(Fonte)+Trab,1,Tamanho);
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.AjustaEsquerda(Fonte:            String;
                                           Tamanho:          Integer):  String;
      Begin
         Result := AjustaEsquerda(Fonte,Tamanho,' ');
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.AjustaDireita(Fonte:            String;
                                          Tamanho:          Integer;
                                          Preenchimento:    String):  String;
      Var
          S:    String;
          Trab: String;
      Begin
         Trab := Preenchimento;
         While (Length(Trab) < (Tamanho + 1)) Do
            Trab := Trab + Preenchimento;
         S             := Trab + Trim(Fonte);
         Result        := Copy(S,(Length(S)-Tamanho)+1,Tamanho);
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.Ajusta(Fonte:           String;
                                   Tamanho:         Integer;
                                   Lado:            String;
                                   Preenchimento:   String):  String;
      Begin
         Result := Fonte;
         If (UpperCase(Lado) = 'E') Then
            Result := AjustaEsquerda(Fonte,Tamanho,Preenchimento)
         Else
            If (UpperCase(Lado) = 'D') Then
                Result := AjustaDireita(Fonte,Tamanho,Preenchimento);
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.Ajusta(Fonte:           String;
                                   Tamanho:         Integer;
                                   Lado:            String):  String;
      Begin
         Result := Ajusta(Fonte,Tamanho,Lado,' ');
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.AjustaDireita(Fonte:            String;
                                          Tamanho:          Integer):  String;
      Begin
         Result := AjustaDireita(Fonte,Tamanho,' ');
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.DeixaApenasUm (Fonte:            WideString;
                                           Caracter:         Char):   String;
      Var
         MaisDeUm:    WideString;
         Loc:         Integer;
      Begin
         MaisDeUm := Caracter + Caracter;
         Loc      := Pos(MaisDeUm,Fonte);
         While (Loc <> 0) Do
         Begin
            Delete(Fonte,Loc,1);
            Loc := Pos(MaisDeUm,Fonte);
         End;
         Result := Fonte;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.DeixaApenasUm (Fonte:            WideString):   String;
      Begin
         Result := DeixaApenasUm(Fonte,' ');
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Procedure  TStr.RetornaPosicoes(Fonte:            String;
                                            Var Locais:       TVetInteger;
                                            Caracter:         Char);
      Var
         Ind:         Integer;
         Tam:         Integer;
      Begin
         Tam    := 1;
         Fonte  := Trim(Fonte);
         For Ind := 1 To Length(Fonte) Do
             If Copy(Fonte,Ind,1) = Caracter Then
             Begin
                SetLength(Locais,Tam);
                Locais[Tam-1] := Ind;
                Inc(Tam);
             End;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.RetQtdeOcorrenc(Fonte:           String;
                                            Caracter:        Char):     Integer;
      Var
         Ind:         Integer;
         Qtde:        Integer;
      Begin
         Qtde   := 0;
         Fonte  := Trim(Fonte);
         For Ind := 1 To Length(Fonte) Do
             If Copy(Fonte,Ind,1) = Caracter Then
             Inc(Qtde);
         Result := Qtde;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.Justifica  (Fonte:            String;
                                        Tamanho:          Integer;
                                        Caracter:         Char;
                                        Preenchimento:    String):   String;
      Var
         Tam:       Integer;
         Loc:       TVetInteger;
         Posicao:   Integer;
         Ind:       Integer;

      Begin
         Fonte := Trim(Fonte);
         Fonte := TStr.DeixaApenasUm(Fonte,Caracter);
         TStr.RetornaPosicoes(Fonte,Loc,Caracter);
         Tam   := Length(Fonte);
         If High(Loc) >= 0 Then
         Begin
            Posicao := Low(Loc);
            While (Tam < Tamanho) Do
            Begin
               Insert(Preenchimento,Fonte,Loc[Posicao]);
               Inc(Posicao);
               For Ind := Posicao To High(Loc) Do
                   Loc[Ind] := Loc[Ind] + Length(Preenchimento);
               If Posicao > High(Loc) Then
                  Posicao := Low(Loc);
               Tam   := Length(Fonte);
            End;
         End;
         Fonte := StringReplace(Fonte,Caracter,Preenchimento,[rfReplaceAll, rfIgnoreCase]);
         Result := Fonte;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.Justifica  (Fonte:            String;
                                        Tamanho:          Integer):  String;
      Begin
         Result := TStr.Justifica(Fonte,Tamanho,' ',' ');
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.Insere     (Fonte:            String;
                                        Caracteres:       Array of Char;
                                        Locais:           Array of Integer): String;
      Var
         Ind:      Integer;
      Begin
         If High(Caracteres) = High(Locais) Then
         Begin
            For Ind := 0 To High(Caracteres) Do
            Begin
               Insert(Caracteres[Ind],Fonte,Locais[Ind]-Ind);
            End;
         End;
         Result := Fonte;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function  TStr.Formata     (Fonte:            String;
                                        Formato:          String;
                                        Comando:          String): String;
      Var
         TamCadeia:       Integer;
         TamFormato:      Integer;
         Saida:           String;
         CaractComando:   Char;
      Begin
         Saida := Fonte;
         If (Length(Formato) = Length(Comando)) Then
         Begin
            Fonte      := Trim(String(Fonte));
            TamCadeia  := Length(Fonte);
            TamFormato := Length(Formato);
            Saida      := '';
            While (TamCadeia <> 0) And (TamFormato <> 0) Do
            Begin
               CaractComando := Copy(Comando,TamFormato,1)[1];
               Case CaractComando Of
                   'C':
                          Begin
                             Saida := Copy(Fonte,TamCadeia,1) + Saida;
                             Dec(TamCadeia);
                             Dec(TamFormato);
                          End;
                   'I':
                          Begin
                             Saida := Copy(Formato,TamFormato,1) + Saida;
                             Dec(TamFormato);
                          End;
               End;
            End;
            While (TamFormato <> 0) Do
            Begin
               Saida := Copy(Formato,TamFormato,1) + Saida;
               Dec(TamFormato);
            End;
            While (TamCadeia <> 0) Do
            Begin
               Saida := Copy(Fonte,TamCadeia,1) + Saida;
               Dec(TamCadeia);
            End;
         End;
         Result := Saida;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function  TStr.ObtemNumero (Fonte:            String;
                                        Var Numero:       Integer):  Boolean;
      Var
         Saida:     String;
         Ind:       Integer;
      Begin
         Saida := '';
         For Ind := 1 To Length(Fonte) Do
         Begin
            If CharInsetPaulo(Fonte[Ind],['0'..'9']) Then
               Saida := Saida + Fonte[Ind];
         End;
         Try
            Numero := StrToInt(Saida);
            Result := True;
         Except
            Numero := 0;
            Result := False;
         End;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function  TStr.ObtemNumero (Fonte:            String;
                                        Var Numero:       Real):     Boolean;
      Var
         Saida:     String;
         Ind:       Integer;
      Begin
         Saida := '';
         For Ind := 1 To Length(Fonte) Do
         Begin
            If CharInsetPaulo(Fonte[Ind],['0'..'9',',']) Then
               If Fonte[Ind] <> ',' Then
                  Saida := Saida + Fonte[Ind]
               Else
                  Saida := Saida + '.';
         End;
         Try
            Numero := StrToFloat(Saida);
            Result := True;
         Except
            Numero := 0;
            Result := False;
         End;
      End;

/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function  TStr.ObtemNumeroInt (Fonte:            String):  Integer;
      Var
         Numero:   Integer;
      Begin
         If TStr.ObtemNumero(Fonte,Numero) Then
            Result := Numero
         Else
            Result := -1;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function  TStr.ObtemNumeroReal(Fonte:            String):  Real;
      Var
         Numero:   Real;
      Begin
         If TStr.ObtemNumero(Fonte,Numero) Then
            Result := Numero
         Else
            Result := -1;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.Direita       (Fonte:           String;
                                           Inicio:          Integer):   String;
      Begin
         Result := Copy(Fonte,Inicio, (Length(Fonte) - Inicio) + 1);
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.Localiza      (Procurada:       String;
                                           Fonte:           String;
                                           Inicio:          Integer):   Integer;
      Var
         Cadeia:    String;
      Begin
         Fonte  := Trim(Fonte);
         Cadeia := TStr.Direita(Fonte,Inicio);
         Result := Pos(Procurada,Cadeia);
         Result := (Inicio + Result) - 1;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.RetiraAcentos (Fonte:           String):    String;
      Var
         I:         Integer;
         Cadeia:    String;
      Begin
         Cadeia := Fonte;
         For I := 1 To Length(Cadeia) Do
         Begin
            Case Cadeia[I] Of
               'À':   Cadeia := StuffString(Cadeia,I,1,'A');
               'È':   Cadeia := StuffString(Cadeia,I,1,'E');
               'Ì':   Cadeia := StuffString(Cadeia,I,1,'I');
               'Ò':   Cadeia := StuffString(Cadeia,I,1,'O');
               'Ù':   Cadeia := StuffString(Cadeia,I,1,'U');
               'à':   Cadeia := StuffString(Cadeia,I,1,'A');
               'è':   Cadeia := StuffString(Cadeia,I,1,'E');
               'ì':   Cadeia := StuffString(Cadeia,I,1,'I');
               'ò':   Cadeia := StuffString(Cadeia,I,1,'O');
               'ù':   Cadeia := StuffString(Cadeia,I,1,'U');
               'Á':   Cadeia := StuffString(Cadeia,I,1,'A');
               'É':   Cadeia := StuffString(Cadeia,I,1,'E');
               'Í':   Cadeia := StuffString(Cadeia,I,1,'I');
               'Ó':   Cadeia := StuffString(Cadeia,I,1,'O');
               'Ú':   Cadeia := StuffString(Cadeia,I,1,'U');
               'á':   Cadeia := StuffString(Cadeia,I,1,'A');
               'é':   Cadeia := StuffString(Cadeia,I,1,'E');
               'í':   Cadeia := StuffString(Cadeia,I,1,'I');
               'ó':   Cadeia := StuffString(Cadeia,I,1,'O');
               'ú':   Cadeia := StuffString(Cadeia,I,1,'U');
               'Ã':   Cadeia := StuffString(Cadeia,I,1,'A');
               'Õ':   Cadeia := StuffString(Cadeia,I,1,'O');
               'ã':   Cadeia := StuffString(Cadeia,I,1,'A');
               'õ':   Cadeia := StuffString(Cadeia,I,1,'O');
               'Ç':   Cadeia := StuffString(Cadeia,I,1,'C');
               'ç':   Cadeia := StuffString(Cadeia,I,1,'C');
               'Ä':   Cadeia := StuffString(Cadeia,I,1,'A');
               'Ë':   Cadeia := StuffString(Cadeia,I,1,'E');
               'Ï':   Cadeia := StuffString(Cadeia,I,1,'I');
               'Ö':   Cadeia := StuffString(Cadeia,I,1,'O');
               'Ü':   Cadeia := StuffString(Cadeia,I,1,'U');
               'ä':   Cadeia := StuffString(Cadeia,I,1,'A');
               'ë':   Cadeia := StuffString(Cadeia,I,1,'E');
               'ï':   Cadeia := StuffString(Cadeia,I,1,'I');
               'ö':   Cadeia := StuffString(Cadeia,I,1,'O');
               'ü':   Cadeia := StuffString(Cadeia,I,1,'U');
               'Â':   Cadeia := StuffString(Cadeia,I,1,'A');
               'Ê':   Cadeia := StuffString(Cadeia,I,1,'E');
               'Î':   Cadeia := StuffString(Cadeia,I,1,'I');
               'Ô':   Cadeia := StuffString(Cadeia,I,1,'O');
               'Û':   Cadeia := StuffString(Cadeia,I,1,'U');
               'â':   Cadeia := StuffString(Cadeia,I,1,'A');
               'ê':   Cadeia := StuffString(Cadeia,I,1,'E');
               'î':   Cadeia := StuffString(Cadeia,I,1,'I');
               'ô':   Cadeia := StuffString(Cadeia,I,1,'O');
               'û':   Cadeia := StuffString(Cadeia,I,1,'U');
               'ª':   Cadeia := StuffString(Cadeia,I,1,'.');
               'º':   Cadeia := StuffString(Cadeia,I,1,'.');
               ' ':   Cadeia := StuffString(Cadeia,I,1,' ');
            End;
         End;
         Result := Cadeia;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.CaracteresIBM  (Fonte:           String;
                                           Var CadeiaOk:    Boolean):    String;
      Var
         Cadeia:     String;
         I:          Integer;
      Begin
         Cadeia    := RetiraAcentos(Fonte);
         CadeiaOk  := True;
         For I := 1 To Length(Trim(Cadeia)) Do
         Begin
            Case Cadeia[I] Of
               'ª':   Cadeia := StuffString(Cadeia,I,1,'.');
               'º':   Cadeia := StuffString(Cadeia,I,1,'.');
            End;
            If Not (CharInsetPaulo(Cadeia[I],['A'..'Z',' ','0'..'9','.','(',')','-',''''])) Then
               CadeiaOk := False;
          End;
          Result := Cadeia;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.VerificaCadeia (    Fonte:           String;
                                            Var Cadeia:          String;
                                                Conjunto:        TConjuntoChar): Boolean;
      Var
         I:        Integer;
         CadeiaOk: Boolean;
      Begin
         Fonte     := Trim(Fonte);
         CadeiaOk  := True;
         Cadeia    := '';
         For I := 1 To Length(Fonte) Do
         Begin
            If Not (CharInsetPaulo(Fonte[I],Conjunto)) Then
               CadeiaOk := False
            Else
               Cadeia   := Cadeia + Fonte[I];
         End;
         Result := CadeiaOk;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.OnlyDigitos   (Fonte:           String):    String;
      Var
         I:       Integer;
         Cadeia:  String;
      Begin
         Cadeia := '';
         For I := 1 To Length(Fonte) Do
         Begin
            If CharInsetPaulo(Fonte[I],['0'..'9']) Then
               Cadeia := Cadeia + Fonte[I];
         End;
         Result := Cadeia;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.OnlyDigitosBr (Fonte:           String):    String;
      Var
         I:       Integer;
         Cadeia:  String;
      Begin
         Cadeia := '';
         For I := 1 To Length(Fonte) Do
         Begin
            If CharInsetPaulo(Fonte[I],['0'..'9',' ']) Then
               Cadeia := Cadeia + Fonte[I];
         End;
         Result := Cadeia;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.OnlyLetras   (Fonte:           String):    String;
      Var
         I:       Integer;
         Cadeia:  String;
      Begin
         Cadeia := '';
         For I := 1 To Length(Fonte) Do
         Begin
            If CharInsetPaulo(Fonte[I],['A'..'Z','a'..'z']) Then
               Cadeia := Cadeia + Fonte[I];
         End;
         Result := Cadeia;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.OnlyLetrasBranco(Fonte:           String):    String;
      Var
         I:       Integer;
         Cadeia:  String;
      Begin
         Fonte := Trim(Fonte);
         Fonte := DeixaApenasUm(Fonte,' ');
         Fonte := RetiraAcentos(Fonte);
         Cadeia := '';
         For I := 1 To Length(Fonte) Do
         Begin
            If CharInsetPaulo(Fonte[I],['A'..'Z','a'..'z',' ','''']) Then
               Cadeia := Cadeia + Fonte[I];
         End;
         Result := Cadeia;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.OnlyLetrasDig(Fonte:           String):    String;
      Var
         I:       Integer;
         Cadeia:  String;
      Begin
         Cadeia := '';
         For I := 1 To Length(Fonte) Do
         Begin
            If CharInsetPaulo(Fonte[I],['A'..'Z','a'..'z','0'..'9']) Then
               Cadeia := Cadeia + Fonte[I];
         End;
         Result := Cadeia;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.OnlyIBM(Fonte:           String):    String;
      Var
         I:       Integer;
         Cadeia:  String;
      Begin
         Cadeia := '';
         For I := 1 To Length(Fonte) Do
         Begin
            Case Fonte[I] Of
               'ª':   Fonte := StuffString(Fonte,I,1,'.');
               'º':   Fonte := StuffString(Fonte,I,1,'.');
            End;
            If CharInsetPaulo(Fonte[I],['A'..'Z',' ','0'..'9','.','(',')','-','''',',']) Then
               Cadeia := Cadeia + Fonte[I];
         End;
         Result := Cadeia;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.OnlyIBMSemAcento(Fonte:           String):    String;
      Begin
         Fonte  := Trim(UpperCase(Fonte));
         Fonte  := Self.RetiraAcentos(Fonte);
         Result := Self.OnlyIBM(Fonte);
      End;   
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.GetSizeArq   (Fonte:           String):    LongInt;
      Var
         X:       File;
      Begin
         Result := 0;
         AssignFile(X,Fonte);
         Try
            Try
               Reset(X);
               Result := FileSize(X);
            Except
            End;
         Finally
            CloseFile(X);
         End;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.ExisteArquivo   (Fonte:           String):    Boolean;
      Begin
         Result := False;
         Try
            Try
               If (FileExists(Fonte)) Then
                  Result := True
               Else
                  Result := False;
            Except
            End;
         Finally
         End;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.FormataCPF    (NumCpf:          String):    String;
      Begin
         Result := NumCpf;
         If Length(Trim(NumCpf)) = 11 Then
            Result := Copy(NumCpf,01,3)+'.'+
                      Copy(NumCpf,04,3)+'.'+
                      Copy(NumCpf,07,3)+'-'+
                      Copy(NumCpf,10,2);
         Result := AjustaEsquerda(Result,14);
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.FormataCPFCNPJ(Num:             String):    String;
      Begin
         Result := Num;
         If Length(Trim(Num)) = 11 Then
         Begin
            Result := FormataCPF(Num);
         End
         Else
         If Length(Trim(Num)) = 14 Then
         Begin
            Result := Copy(Num,01,02) + '.' +
                      Copy(Num,03,03) + '.' +
                      Copy(Num,06,03) + '/' +
                      Copy(Num,09,04) + '-' +
                      Copy(Num,13,02);
            Result := AjustaEsquerda(Result,18);
         End;   
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.VerificaCPF   (NumCpf:          String;
                                           Var Dig1:        String;
                                           Var Dig2:        String):    Boolean;
      Begin
         Result := False;
         Dig1   := '';
         Dig2   := '';
         NumCpf := TStr.OnlyDigitos(NumCpf);
         If Length(Trim(NumCpf)) = 11  Then
         Begin
            If (TStr.CalculaDigito(NumCpf,9,NumCpf[10],Dig1))            And
               (TStr.CalculaDigito(Copy(NumCpf,2,9),9,NumCpf[11],Dig2))  Then
               Result := True;
         End
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.VerificaCPF   (NumCpf:          String):    Boolean;
      Var
         Dig1:   String;
         Dig2:   String;
      Begin
         Result := VerificaCpf(NumCpf,Dig1,Dig2);
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.CalculaDigito  (Cadeia:          String;
                                            Tamanho:         Integer;
                                            DigitoInfo:      String;
                                            Var DigCalc:     String):    Boolean;

      Var
         Ind:       Integer;
         Soma:      Integer;
         Valor:     Integer;
      Begin
         Result   := False;
         DigCalc  := '';
         Cadeia   := TStr.OnlyDigitos(Cadeia);
         If Length(Cadeia) < Tamanho Then
            Cadeia := TStr.AjustaDireita(Cadeia,Tamanho,'0');
         Valor    := 9;
         If Length(Trim(Cadeia)) >= Tamanho  Then
         Begin
            Soma := 0;
            For Ind := Tamanho DownTo 1 Do
            Begin
               Soma := Soma + (StrToInt(Cadeia[Ind]) * Valor);
               Dec(Valor);
               If Valor = 0 Then
                  Valor := 9;
            End;
            DigCalc := IntToStr((Soma Mod 11) Mod 10);
            If DigCalc = DigitoInfo Then
               Result := True;
         End;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.CalculaDigito  (Cadeia:          String;
                                            Tamanho:         Integer;
                                            Var DigCalc:     String):    Boolean;

      Begin
         Result   := CalculaDigito(Cadeia,Tamanho,' ',DigCalc);
         If Not Result Then
            Result := True;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.CalculaDigito  (Cadeia:          Integer;
                                            Tamanho:         Integer;
                                            DigitoInfo:      String;
                                            Var DigCalc:     String):    Boolean;

      Begin
         Result   := TStr.CalculaDigito(IntToStr(Cadeia),Tamanho,DigitoInfo,DigCalc);
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.CalculaDigito  (Cadeia:          Integer;
                                            Tamanho:         Integer):   String;

      Var
         DigCalc: String;
      Begin
         TStr.CalculaDigito(IntToStr(Cadeia),Tamanho,' ',DigCalc);
         Result := DigCalc;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Procedure  TStr.ClrScr;
      Var
         HandleScreen:     THandle;
         CoordScreen:      TCoord;
         NumCaractGrav:    DWord;
         ConsoleInfo:      TConsoleScreenBufferInfo;
         ConsoleSize:      DWord;
      Begin
         CoordScreen.X := 0;
         CoordScreen.Y := 0;
         HandleScreen  := GetStdHandle(STD_OUTPUT_HANDLE);
         GetConsoleScreenBufferInfo(HandleScreen,ConsoleInfo);

         ConsoleSize   := (ConsoleInfo.dwSize.X * ConsoleInfo.dwSize.Y);

         FillConsoleOutputCharacter(HandleScreen,' ',ConsoleSize,CoordScreen,NumCaractGrav);
         GetConsoleScreenBufferInfo(HandleScreen,ConsoleInfo);
         FillConsoleOutputAttribute(HandleScreen,ConsoleInfo.WAttributes,
                                    ConsoleSize,CoordScreen,NumCaractGrav);
         SetConsoleCursorPosition(HandleScreen,CoordScreen);
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.EhUmaDataValida   (DataStr:         String;
                                               MensagemErro:    String):       Boolean;
      Begin
         Try
            StrToDate(DataStr);
            EhUmaDataValida := True;
         Except
            If Length(Trim(MensagemErro)) > 0 Then
               ShowMessage(MensagemErro);
            EhUmaDataValida := False;
         End;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.ObtemData      (DataStr:         String):          TDateTime;
      Begin
         Try
            Result :=  StrToDate(Copy(DataStr,1,2) + '/' +
                                 Copy(DataStr,3,2) + '/' +
                                 Copy(DataStr,5,2));
         Except
            Result := 0;
         End;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.FormataCampoSql(Info:   Variant):   String;
      Var
         TipoVariant:   Integer;
      Begin
         Try
            TipoVariant := VarType(Info);
            If (TipoVariant = VarSmallInt)   Or
               (TipoVariant = VarInteger)    Or
               (TipoVariant = VarByte)       Then
               Begin
                  Result := VarToStr(Info);
               End;
            If (TipoVariant = VarSingle)     Or
               (TipoVariant = VarDouble)     Or
               (TipoVariant = VarCurrency)   Then
               Begin
                  Result := VarToStr(Info);
                  Result := StringReplace(Result,'.','',[rfReplaceAll, rfIgnoreCase]);
                  Result := StringReplace(Result,',','.',[rfReplaceAll, rfIgnoreCase]);
               End;
            If (TipoVariant = VarString)     Then
               Begin
                  Result :=  QuotedStr(VarToStr(Info));
               End;
            If (TipoVariant = VarDate)       Then
               Begin
                  Result := QuotedStr(FormatDateTime('yyyy-mm-dd',VarToDateTime(Info)));
               End;
         Except
            Result := '';
         End;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.BomDiaTardeNoite():              String;
      Var
         Hora:         Word;
         Min:          Word;
         Seg:          Word;
         MSeg:         Word;
      Begin
         DecodeTime(Now(),Hora,Min,Seg,MSeg);
         If (Hora <= 11) Then
            Result := 'Bom Dia'
         Else
            If ((Hora >= 12) And (Hora <= 17)) Then
               Result := 'Boa Tarde'
            Else
               Result := 'Boa Noite';
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.ProcuraNaLista(Cod:              String;
                                           Lista:            TStrings;
                                           Local:            Integer):     Integer;
      Var
         Ind:    Integer;
         Parte:  String;
      Begin
         Ind     := 0;
         Result  := -1;
         While (Ind < Lista.Count) And (Result = -1) Do
         Begin
            If (Length(Lista[Ind]) > (Local + Length(Cod) - 1)) Then
            Begin
               Parte := Copy(Lista[Ind],Local,Length(Cod));
               If Parte = Cod Then
                  Result := Ind;
            End;
            Inc(Ind);
         End;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.ObtemSenha(QtdeCaracteres: Integer; Tipo: Integer):    String;
      Var
         Ind:   Integer;
         X:     Integer;
      Begin
         Randomize;
         Result := '';
         For Ind := 1 To QtdeCaracteres Do
         Begin
            X := RandomRange(1,2);
            If (X = 1) Or ((Tipo = 1) Or (Tipo = 3)) Then
               Result := Result + Chr(RandomRange(48,57));
            If (X = 2) Or ((Tipo = 2) Or (Tipo = 3)) Then
               Result := Result + Chr(RandomRange(65,90));
         End;
         Result := Copy(Result,1,QtdeCaracteres);
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.ObtemSenhaDigitos(QtdeCaracteres: Integer):      String;
      Begin
         Result := Self.ObtemSenha(QtdeCaracteres,1);
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.ObtemSenhaLetras(QtdeCaracteres: Integer):        String;
      Begin
         Result := Self.ObtemSenha(QtdeCaracteres,2);
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.ObtemSenhaDigitosLetras(QtdeCaracteres: Integer): String;
      Begin
         Result := Self.ObtemSenha(QtdeCaracteres,3);
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.AproxNumero(Const Numero:       Extended;
                                        Const QtdeDecimais: Integer;
                                        Const Aproxima:     Boolean = True):  Extended;
      Var
         Pot10:       Integer;
         Valor:       Extended;
      Begin
         Pot10  := Trunc(Math.Power(10,QtdeDecimais));
         Valor  := Trunc(Numero * (Pot10*10));
         If Aproxima Then
            Valor := Valor + 5;
         Result := Int(Valor/10) / Pot10;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Procedure  TStr.Ordena(Const Vetor:        TStrings);
      Var
         Vet:         TStringList;
      Begin
         If (Vetor Is TStringList) Then
            (Vetor As TStringlist).Sort
         Else
         Begin
            Vet := TStringList.Create;
            Try
               Vet.AddStrings(Vetor);
               Vet.Sort;
               Vetor.Clear;
               Vetor.AddStrings(Vet);
            Finally
               Vet.Free;
            End;
         End;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Procedure  TStr.ImprDirecao(      Canvas:       TCanvas;
                                        Const X:            Integer;
                                        Const Y:            Integer;
                                        Const Info:         String;
                                              Fonte:        TFont;
                                        Const Direcao:      Integer = 900);

      Var
         FontGuarda: TFont;
         NaoSei:     TLogFont;
(*
         Aconselho a Criar o seu Proprio Objeto Fonte 

         Nao Aceita Todas as Fontes (Aceita Arial, Courier New)
         Direcao

            900
             |
             |
    1800 ----------  0 (ou 3600)
             |
             |
           2700
*)
      Begin
         FontGuarda            := TFont.Create;
         FontGuarda.Assign(Canvas.Font);
         GetObject(Fonte.Handle, SizeOf(NaoSei), @NaoSei);
         NaoSei.lfEscapement   := Direcao;
         NaoSei.lfOrientation  := Direcao;
         Fonte.Handle          := CreateFontIndirect(NaoSei);
         Canvas.Font.Assign(Fonte);
         Canvas.TextOut(X,Y,Info);
         Canvas.Font.Assign(FontGuarda);
         FontGuarda.Free;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.ObtemNomeArqRelat(Const Nome:     String;
                                              Const Exten:    String;
                                              Const QtdeDigs: Integer):     String;
      Var
         Mascara:     String;
         Ind:         Integer;
         NomeArq:     String;
      Begin
         Mascara := Self.AjustaDireita('',QtdeDigs,'0');
         Ind     := 1;
         NomeArq := Nome + FormatFloat(Mascara,Ind)+'.'+Exten;
         While FileExists(NomeArq) Do
         Begin
            Inc(Ind);
            NomeArq := Nome + FormatFloat(Mascara,Ind)+'.'+Exten;
         End;
         Result := NomeArq;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.Space(Const Qtde:     Integer):                 String;
      Var
         Saida:   String;
      Begin
         SetLength(Saida,200);
         Saida  := AjustaDireita(' ',200,' ');
         Result := Copy(Saida,1,Qtde);
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.FormataDir(Const Numero:   Integer;
                                       Const Tamanho:  Integer;
                                       Const Masc:     String):   String;
      Begin
         Result := AjustaDireita(FormatFloat(Masc,Numero),Tamanho,' ');
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.FormataDir(Const Numero:   Extended;
                                       Const Tamanho:  Integer;
                                       Const Masc:     String):   String;
      Begin
         Result := AjustaDireita(FormatFloat(Masc,Numero),Tamanho,' ');
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.FormataEsq(Const Numero:   Integer;
                                       Const Tamanho:  Integer;
                                       Const Masc:     String):   String;
      Begin
         Result := AjustaEsquerda(FormatFloat(Masc,Numero),Tamanho,' ');
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.FormataEsq(Const Numero:   Extended;
                                       Const Tamanho:  Integer;
                                       Const Masc:     String):   String;
      Begin
         Result := AjustaEsquerda(FormatFloat(Masc,Numero),Tamanho,' ');
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.CalcQtdeFolhas(Const QtdeReg:   Integer;
                                           Const RegPorPag: Integer):     Integer;
      Begin
         Result := QtdeReg Div RegPorPag;
         If (QtdeReg Mod RegPorPAg) <> 0 Then
            Inc(Result);
      End;
///////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.Formata(Const Fonte:   String;
                                    Const Posicao: Integer):     String;

      Begin
         Result := Formata(Fonte,Posicao,'-');
      End;
///////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.Formata(Const Fonte:    String;
                                    Const Posicao:  Integer;
                                    Const Caracter: String):      String;
      Begin
         Result := Fonte;
         If (Length(Fonte) > 0) And (Posicao > 1) And (Posicao <= Length(Fonte) - 1) Then
            Result := Copy(Fonte,1,Posicao)+Caracter+
                       Copy(Fonte,Posicao+1,Length(Fonte)-Posicao+1);
      End;

///////////////////////////////////////////////////////////////////////////////////////////////

      Class Function   TStr.FormataCep(Const Fonte: String):      String;
      Begin
         Result := Fonte;
         If Length(Trim(Fonte)) = 8 Then
            Result := Copy(Fonte,1,5)+'.'+Copy(Fonte,6,3);
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
     Class Function    TStr.RetiraAcentosMaisculo(Fonte:  String):    String;
     Begin
        Result := UpperCase(TStr.RetiraAcentos(Fonte));
     End;

/////////////////////////////////////////////////////////////////////////////////////////////////
    Class Function     TStr.CalculaDigito(Cadeia:          String;
                                          Multiplica:      String;
                                          Fator:           Integer):   String;

     Var
        Saida:     String;
        Ind:       Integer;
        Total:     Integer;
     Begin
        Saida      := '';
        Total      := 0;
        Cadeia     := TStr.OnlyDigitos(Cadeia);
        Multiplica := TStr.OnlyDigitos(Multiplica);

        If (Length(Cadeia) = Length(Multiplica)) Then
        Begin
           For Ind := 1 To Length(Cadeia) Do
           Begin
              Total := Total + (StrToInt(Copy(Cadeia,Ind,1)) * StrToInt(Copy(Multiplica,Ind,1)));
           End;
           Total := Total * Fator;
           Saida := IntToStr(((Total Mod 11) Mod 10));
        End;
        Result := Saida;
     End;
/////////////////////////////////////////////////////////////////////////////////////////////////
     Class Function   TStr.VerificaCPFCNPJ(NumCpfCnpj:      String):    Boolean;
     Var
        Saida:   Boolean;
     Begin
        Saida      := False;
        NumCpfCnpj := TStr.OnlyDigitos(NumCpfCnpj);
        If Length(NumCpfCnpj) = 11 Then
           Saida := TStr.VerificaCPF(NumCpfCnpj);
        If Length(NumCpfCnpj) = 14 Then
           Saida := TStr.VerificaCNPJ(NumCpfCnpj);
        Result := Saida;
     End;
/////////////////////////////////////////////////////////////////////////////////////////////////
     Class Function   TStr.VerificaCNPJ(NumCpfCnpj:      String):    Boolean;
     Var
        Dig1:     String;
        Dig2:     String;
        Saida:    Boolean;
     Begin
        Saida  := False;
        Dig1   := TStr.CalculaDigito(Copy(NumCpfCnpj,01,12)        ,  '543298765432',10);
        Dig2   := TStr.CalculaDigito(Copy(NumCpfCnpj,01,12) + Dig1 , '6543298765432',10);
        If ((Copy(NumCpfCnpj,13,01) = Dig1) And (Copy(NumCpfCnpj,14,01) = Dig2)) Then
           Saida := True;
        Result := Saida;
     End;
/////////////////////////////////////////////////////////////////////////////////////////////////
     Class Function   TStr.ObtemDiretorioBaseAplicacao():                     String;
     Var
        Caminho:    String;
     Begin
        Caminho := ExtractFilePath(GetModuleFileNameProc());
        Result  := Caminho;
     End;
/////////////////////////////////////////////////////////////////////////////////////////////////
     Class Function   TStr.ObtemDiretorioBaseAplicacaoUmNivelAntes():         String;
     Var
        Caminho:    String;
        Ind:        Integer;

     Begin
        Caminho := ExtractFilePath(GetModuleFileNameProc());
        If (Length(Caminho) >= 4) And (Copy(Caminho,1,4) = '\\?\') Then
           Delete(Caminho,1,4);
        Delete(Caminho,Length(Caminho),1);
        Ind := Length(Caminho);
        While (Ind > 0) And (Caminho[Ind] <> '\') Do
           Ind := Ind - 1;
        If Ind > 0 Then
           Delete(Caminho,Ind + 1,Length(Caminho) - Ind);
        Result  := Caminho;
     End;
/////////////////////////////////////////////////////////////////////////////////////////////////
     Class Function   TStr.ObtemPosicaoCaracter(Const Fonte:   String;
                                                Const Caracter:   Char;
                                                Const Qtde:    Integer;
                                                Const Inicio:  Integer;
                                                Const Final:   Integer):      Integer;
     Var
        Conta:     Integer;
        Parcela:   Integer;
        Saida:     Integer;
        InicioAux: Integer;
     Begin
        Saida      := -1;
        InicioAux  := Inicio;
        Conta      := 0;
        If (InicioAux > Final) Then
           Parcela := -1
        Else
           Parcela := 1;
        While (InicioAux <> Final) Do
        Begin
           If Fonte[InicioAux] = Caracter Then
              Conta := Conta + 1;
           If Conta = Qtde Then
           Begin
              Saida     := InicioAux;
              InicioAux := Final;
           End
           Else
              InicioAux := InicioAux + Parcela
        End;
        Result := Saida;
     End;
/////////////////////////////////////////////////////////////////////////////////////////////////
     Class Function   TStr.RetiraCrLf(Fonte:           String):    String;
     Var
        I:         Integer;
        Cadeia:    String;
        Apaga:     Boolean;
     Begin
        Cadeia := Fonte;
        I      := 1;
        While I <= Length(Cadeia) Do
        Begin
           Apaga := False;
           Case Cadeia[I] Of
              #10:   Apaga  := True;
              #13:   Apaga  := True;
           End;
           If Apaga Then
              Delete(Cadeia,I,1)
           Else
              I := I + 1;
        End;
        Result := Cadeia;
     End;
/////////////////////////////////////////////////////////////////////////////////////////////////
     Class Function   TStr.EliminaString(Fonte, Elimina: String): String;
     Var
        Ind:   Integer;
     Begin
        Ind := Pos(Elimina,Fonte);
        While (Ind <> 0) Do
        Begin
           Delete(Fonte,Ind,Length(Elimina));
           Ind := Pos(Elimina,Fonte);
        End;
        Result := Fonte;
     End;
/////////////////////////////////////////////////////////////////////////////////////////////////
     Class Function   TStr.Criptografa(Fonte: String): String;
     Var
        Ind:       Integer;
        Saida:     String;
        Num:       String;
        Num1:      Integer;
        Num2:      Integer;
        IndMais:   Integer;
     Begin
        Saida  := Fonte;
        If Length(Fonte) > 0 Then
        Begin
           Saida     := '';
           Num       := Self.ObtemSenhaDigitos(2);
           Num1      := StrToInt(Num[1]);
           Num2      := StrToInt(Num[2]);
           Ind       := 1;
           IndMais   := 1;
           While Ind <= Length(Fonte) Do
           Begin
              If (Ind Mod 2) = 1 Then
              Begin
                 If Ind = IndMais Then
                 Begin
                    IndMais := IndMais + 3;
                    Saida := Saida + Chr(Ord(Fonte[Ind]) + Num1);
                 End
                 Else
                    Saida := Saida + Chr(Ord(Fonte[Ind]) - Num1);
              End
              Else
              Begin
                 If Ind = IndMais Then
                 Begin
                    IndMais := IndMais + 1;
                    Saida := Saida + Chr(Ord(Fonte[Ind]) + Num2);
                 End
                 Else
                    Saida := Saida + Chr(Ord(Fonte[Ind]) - Num2);
              End;
              Ind := Ind + 1;
           End;
        End;
        Result := Num[1]+Saida+Num[2];
     End;
/////////////////////////////////////////////////////////////////////////////////////////////////
     Class Function   TStr.DeCriptografa(Fonte: String): String;
     Var
        Ind:       Integer;
        Saida:     String;
        Num1:      Integer;
        Num2:      Integer;
        IndMenos:  Integer;
     Begin
        Saida  := Fonte;
        If Length(Fonte) > 2 Then
        Begin
           Saida     := '';
           Num1      := StrToInt(Fonte[1]);
           Num2      := StrToInt(Fonte[Length(Fonte)]);
           Delete(Fonte,1,1);
           Delete(Fonte,Length(Fonte),1);
           Ind       := 1;
           IndMenos  := 1;
           While Ind <= Length(Fonte) Do
           Begin
              If (Ind Mod 2) = 1 Then
              Begin
                 If Ind = IndMenos Then
                 Begin
                    IndMenos := IndMenos + 3;
                    Saida := Saida + Chr(Ord(Fonte[Ind]) - Num1);
                 End
                 Else
                    Saida := Saida + Chr(Ord(Fonte[Ind]) + Num1);
              End
              Else
              Begin
                 If Ind = IndMenos Then
                 Begin
                    IndMenos := IndMenos + 1;
                    Saida := Saida + Chr(Ord(Fonte[Ind]) - Num2);
                 End
                 Else
                    Saida := Saida + Chr(Ord(Fonte[Ind]) + Num2);
              End;
              Ind := Ind + 1;
           End;
        End;
        Result := Saida;
     End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Procedure  TStr.RetornaToken(    Fonte:            WideString;
                                         Var Tokens:           TVetString;
                                             Caracter:         Char);
      Var
         Ind:         Integer;
         Tam:         Integer;
      Begin
         Tam    := 1;
         Fonte  := TStr.DeixaApenasUm(Fonte,Caracter);
         SetLength(Tokens,Tam);
         For Ind := 1 To Length(Fonte) Do
         Begin
             If Copy(Fonte,Ind,1) = Caracter Then
             Begin
                Inc(Tam);
                SetLength(Tokens,Tam);
             End
             Else
             Begin
                Tokens[Tam - 1] := Tokens[Tam - 1] + Copy(Fonte,Ind,1);
             End;
         End;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.Replicate(Info: String; QtdeVezes: Integer):  String;
      Var
         Saida:       String;
         Ind:         Integer;
      Begin
         Saida  := '';
         Ind    := 1;
         While Ind <= QtdeVezes Do
         Begin
            Saida := Saida + Info;
            Ind   := Ind   + 1;
         End;
         Result := Saida;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.Elemento(Info: String): String;
      Var
         Saida:       String;
         Ind:         Integer;
      Begin
         Saida  := '';
         Ind    := Pos('=',Info);
         If Ind <> 0 Then
         Begin
            Saida := Trim(Copy(Info,1,(Ind - 1)));
         End;
         Result := Saida;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.Valor(Info: String): String;
      Var
         Saida:       String;
         Ind:         Integer;
      Begin
         Saida  := '';
         Ind    := Pos('=',Info);
         If Ind <> 0 Then
         Begin
            Delete(Info,1,Ind);
            Saida := Trim(Info);
         End;
         Result := Saida;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.ValorBoolean(Info: Boolean): String;
      Var
         Saida:       String;
      Begin
         Saida  := 'NAO';
         If (Info) Then
            Saida := 'SIM';
         Result := Saida;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Function   TStr.PadraoDelphi(Entrada: String): String;
      Var
         Info:      String;
         Caracter:  Char;
         Saida:     String;
         Ind:       Integer;
         Tam:       Integer;
         Maiuscula: Boolean;
      Begin
         Info := Entrada;
         ShowMessage('01 = '+Info);
         Delete(Info,1,3);
         Ind        := 1;
         Tam        := Length(Info);
         Saida      := '';
         Maiuscula  := True;
         While (Ind <= Tam) Do
         Begin
            Caracter := Info[Ind];
            If (Caracter = '-') Or (Caracter = '_') Then
               Maiuscula := True
            Else
            Begin
               If Maiuscula Then
                  Saida := Saida + UpCase(Caracter)
               Else
                  Saida := Saida + Caracter;
               Maiuscula := False;
            End;
            Ind := Ind + 1;
         End;
         ShowMessage('02 = '+Saida);
         Result := Saida;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
      Class Procedure  TStr.RetornaCadeiasCenso (Fonte:           String;
                                                 Var Cadeias:     TVetString;
                                                 Caracter:        Char);
      Var
         Vet:         TVetInteger;
         Ind:         Integer;
         Tam:         Integer;
         Inicio:      Integer;
         Cadeia:      String;
      Begin
         Tam    := 1;
         Inicio := 1;
         Fonte  := Trim(Fonte);
         TStr.RetornaPosicoes(Fonte,Vet,Caracter);
         For Ind := 0 To Length(Vet) - 1 Do
         Begin
             Cadeia := Trim(Copy(Fonte,Inicio,(Vet[Ind]-Inicio)));
             Inicio := Vet[Ind]+1;
             SetLength(Cadeias,Tam);
             Cadeias[Tam-1] := Cadeia;
             Inc(Tam);
         End;
         Cadeia := Trim(Copy(Fonte,Inicio,(Length(Fonte)-Inicio)+1));
         SetLength(Cadeias,Tam);
         Cadeias[Tam-1] := Cadeia;
      End;
/////////////////////////////////////////////////////////////////////////////////////////////////
End.






