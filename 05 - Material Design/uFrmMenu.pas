unit uFrmMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.MultiView, FMX.Objects, FMX.Layouts,
  FMX.StdCtrls, FMX.Effects, FMX.Ani;

type
  TForm1 = class(TForm)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    MultiView1: TMultiView;
    SpeedButton1: TSpeedButton;
    rectMenuTop: TRectangle;
    GridPanelLayout1: TGridPanelLayout;
    Circle1: TCircle;
    Layout2: TLayout;
    Label1: TLabel;
    Label2: TLabel;
    rectMainMenu: TRectangle;
    rectMenuItem1: TRectangle;
    PathLabel1: TPathLabel;
    Label3: TLabel;
    rectMenuItem2: TRectangle;
    PathLabel2: TPathLabel;
    Label4: TLabel;
    VertScrollBox1: TVertScrollBox;
    rectMenuItem3: TRectangle;
    PathLabel3: TPathLabel;
    Label5: TLabel;
    lineItem: TLine;
    rectMenuItem4: TRectangle;
    PathLabel4: TPathLabel;
    Label6: TLabel;
    Rectangle2: TRectangle;
    Layout3: TLayout;
    rectAnimate: TRectangle;
    ShadowEffect1: TShadowEffect;
    Layout4: TLayout;
    Line1: TLine;
    lblCollapse: TLabel;
    Label8: TLabel;
    Circle2: TCircle;
    lblFloatButton: TLabel;
    layoutMenuFloat: TLayout;
    Circle3: TCircle;
    procedure MouseMove(Sender: TObject; Shift: TShiftState; X,  Y: Single);
    procedure MouseLeave(Sender: TObject);
    procedure lblCollapseClick(Sender: TObject);
    procedure lblFloatButtonClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Single);
begin
  TRectangle(Sender).Fill.Color := $FFE0B4B4;
end;

procedure TForm1.lblFloatButtonClick(Sender: TObject);
begin
 if layoutMenuFloat.Visible = False then
  begin
    layoutMenuFloat.Visible := true;
    TAnimator.AnimateFloat(Circle3, 'Position.Y', Circle2.Position.Y - 55, 0.4,
    TAnimationType.&In, TInterpolationType.Circular);
  end
  else
    begin
     TAnimator.AnimateFloat(Circle3, 'Position.Y', Circle2.Position.Y, 0.4,
      TAnimationType.&In, TInterpolationType.Circular);
     layoutMenuFloat.Visible := False;
    end;
end;

procedure TForm1.lblCollapseClick(Sender: TObject);
begin
  if rectAnimate.Height = 300 then
  begin
    TAnimator.AnimateFloat(rectAnimate,'Height',100,0.7,
      TAnimationType.&In, TInterpolationType.Linear);
    lblCollapse.Text := 'EXPAND';
  end
  else
    begin
        TAnimator.AnimateFloat(rectAnimate,'Height',300,0.7,
      TAnimationType.&In, TInterpolationType.Linear);
    lblCollapse.Text := 'COLLAPSE';
    end;
end;

procedure TForm1.MouseLeave(Sender: TObject);
begin
  TRectangle(Sender).Fill.Color := $FFFFFF;
end;

end.
