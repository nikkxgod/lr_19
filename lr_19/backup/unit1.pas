unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Btn0: TButton;
    Btn1: TButton;
    Btn2: TButton;
    Btn3: TButton;
    Btn4: TButton;
    Btn5: TButton;
    Btn6: TButton;
    Btn7: TButton;
    Btn8: TButton;
    Btn9: TButton;
    BtnAdd: TButton;
    BtnSubtract: TButton;
    BtnMultiply: TButton;
    BtnDivide: TButton;
    BtnEqual: TButton;
    BtnClear: TButton;
    BtnDot: TButton;
    Edit1: TEdit;
    procedure BtnClearClick(Sender: TObject);
    procedure BtnDigitClick(Sender: TObject);
    procedure BtnOperationClick(Sender: TObject);
    procedure BtnEqualClick(Sender: TObject);
    procedure BtnDotClick(Sender: TObject);
  private
    { private declarations }
    FOperator: Char;
    FOperand1: Double;
    FNewOperand: Boolean;
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.BtnDigitClick(Sender: TObject);
begin
  ShowMessage('BtnDigitClick called'); // Debug message
  if FNewOperand then
  begin
    Edit1.Text := '';
    FNewOperand := False;
  end;
  Edit1.Text := Edit1.Text + (Sender as TButton).Caption;
  ShowMessage('BtnDigitClick: ' + Edit1.Text); // Debug message
end;

procedure TForm1.BtnOperationClick(Sender: TObject);
begin
  ShowMessage('BtnOperationClick called'); // Debug message
  FOperand1 := StrToFloatDef(Edit1.Text, 0);
  FOperator := (Sender as TButton).Caption[1];
  FNewOperand := True;
  ShowMessage('BtnOperationClick: Operand1=' + FloatToStr(FOperand1) + ' Operator=' + FOperator); // Debug message
end;

procedure TForm1.BtnEqualClick(Sender: TObject);
var
  Operand2, Result: Double;
begin
  ShowMessage('BtnEqualClick called'); // Debug message
  Operand2 := StrToFloatDef(Edit1.Text, 0);
  Result := 0;

  case FOperator of
    '+': Result := FOperand1 + Operand2;
    '-': Result := FOperand1 - Operand2;
    '*': Result := FOperand1 * Operand2;
    '/':
      if Operand2 = 0 then
      begin
        ShowMessage('Error: Division by zero');
        Exit;
      end
      else
        Result := FOperand1 / Operand2;
  end;

  Edit1.Text := FloatToStr(Result);
  FNewOperand := True;
  ShowMessage('BtnEqualClick: Result=' + FloatToStr(Result)); // Debug message
end;

procedure TForm1.BtnClearClick(Sender: TObject);
begin
  ShowMessage('BtnClearClick called'); // Debug message
  Edit1.Text := '';
  FOperand1 := 0;
  FOperator := #0;
  FNewOperand := False;
  ShowMessage('BtnClearClick: Cleared'); // Debug message
end;

procedure TForm1.BtnDotClick(Sender: TObject);
begin
  ShowMessage('BtnDotClick called'); // Debug message
  if Pos('.', Edit1.Text) = 0 then
    Edit1.Text := Edit1.Text + '.';
  ShowMessage('BtnDotClick: ' + Edit1.Text); // Debug message
end;

end.

