(*********************************************************************************************)
(* Classe - TEMail                                                                           *)
(*********************************************************************************************)


Unit UEmial;

Interface
     Uses
               SysUtils,
               Dialogs,
               Classes,
               IdMessage,
               IdBaseComponent,
               IdComponent,
               IdTCPConnection,
               IdTCPClient,
               IdMessageClient,
               IdSMTP;


     Type

           TEmail        = Class

                Private
                     Mensagem:                                 TIdMessage;
                     Servidor:                                 TIdSMTP;
                Protected

                Public
                     Class   Function    GetObjetoEmail():     TEmail;
                     Class   Function    QuantosObjetos:       Integer;
                     Class   Function    NewInstance:          TObject;              Override;

                             Procedure   FreeInstance;                               Override;
                             Procedure   EnviarEmail(Assunto:      String;
                                                     Mensagem:     String);
            End;

Implementation

     Var
        Email:          TEmail      = Nil;
        QtdeObjetos:    Integer     = 0;

//--------------------------------------------------------------------------------------------------
   Class     Function  TEmail.NewInstance: TObject;
   Begin
      If (Not Assigned(Email)) Then
      Begin
         Try
            Email := ((Inherited NewInstance) As TEmail);
            Email.Mensagem := TIdMessage.Create(Nil);
            Email.Servidor := TIdSmtp.Create(Nil);


         Except
            On E: Exception Do
            Begin
               Email := Nil;
               Dec(QtdeObjetos);
               Raise Exception.Create(' TEmail.NewInstance ' + E.Message);
            End;
         End;
      End;
      Result := Email;
      Inc(QtdeObjetos);
   End;
//--------------------------------------------------------------------------------------------------
   Class     Function   TEmail.GetObjetoEmail():  TEmail;
   Begin
      Try
         Result := (NewInstance As TEmail);
      Except
         On E: Exception Do
         Begin
            Raise Exception.Create(' TEmail.GetObjetoEmail ' + E.Message);
         End;
      End;
   End;
/////////////////////////////////////////////////////////////////////////////////////////////
   Class     Function   TEmail.QuantosObjetos:    Integer;
   Begin
      Result := QtdeObjetos;
   End;
/////////////////////////////////////////////////////////////////////////////////////////////
   Procedure TEmail.FreeInstance;
   Begin
      If (Email <> Nil) Then
      Begin
         Dec(QtdeObjetos);
         If (QtdeObjetos = 0) Then
         Begin
            Mensagem.Free;
            Servidor.Free;
            Email.Free;
            Email := Nil;
            Inherited FreeInstance;
         End;
      End;
   End;
/////////////////////////////////////////////////////////////////////////////////////////////
             Procedure  TEmail.EnviarEmail(Assunto:       String;
                                           Mensagem:      String);

             Begin
                Self.Mensagem.From.Address := 'paulo@ufba.br';
                Self.Mensagem.Recipients.EMailAddresses := 'paulo@ufba.br';

                Self.Mensagem.Subject := Assunto;


                Self.Mensagem.Body.Add('Data e Hora '+DateTimeToStr(Now));
                Self.Mensagem.Body.Add('');

                Self.Mensagem.Body.Add(Mensagem);

                Self.Mensagem.ReceiptRecipient.Text := 'paulo@ufba.br';


                Self.Servidor.Host := 'smtp.ufba.br';
                Self.Servidor.Connect;
                Try
                   Self.Servidor.Send(Self.Mensagem);
                Finally
                   Self.Servidor.Disconnect;
                End;

             End;
/////////////////////////////////////////////////////////////////////////////////////////////
End.
