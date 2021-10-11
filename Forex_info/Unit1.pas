unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, idHTTP, ExtCtrls, ComCtrls, ConnectInfo;

type
  TForm1 = class(TForm)
    label1: TLabel;
    Timer1: TTimer;
    clickpanel: TPageControl;
    TabSheet1: TTabSheet;
    val1: TLabel;
    val2: TLabel;
    val3: TLabel;
    val4: TLabel;
    val5: TLabel;
    val6: TLabel;
    val7: TLabel;
    GroupBox1: TGroupBox;
    kot1: TLabel;
    kot2: TLabel;
    kot3: TLabel;
    kot4: TLabel;
    kot5: TLabel;
    kot6: TLabel;
    kot7: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  HTTP: TIdHTTP;
  imgdef, imgon, ccc, ddd ,item, kotbid, kotask: array[0..6] of string;
  colval1, colval: array[0..6] of TColor;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
y: integer;
begin
   for y:=0 to 6 do
   begin
   ddd[y]:='0';
   colval[y]:= clGreen;
   imgdef[y]:='off.bmp';
   end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  URL,b: string;
   s:TstringList;
 val: array[0..6]of integer;
 i,p: integer;
 begin
  if RasConnectionCount<>0 // Если интернет есть, то поехали !
 then                          // Функция из ConnectInfo.pas
  begin
 Label1.Font.Color:=clGreen;
 Label1.Caption:='Интернет активен...';
  //Выбор валютных пар по номерам строк
 val[0]:=0;
  val[1]:=1;
   val[2]:=2;
    val[3]:=3;
     val[4]:=10;
      val[5]:=11;
       val[6]:=12;
 HTTP:=TIdHTTP.Create(nil);
 HTTP.HandleRedirects:=True;
 HTTP.ProtocolVersion:=pv1_0;
URL:='http://quotesrv.fxclub.org/tools/quotes/data8/WebQuote13.txt'; // URL C данными
  S:=TStringList.Create; //Создаём TStringList

 S.Text:=HTTP.Get(URL);  //Записываем в него то, что загрузили

{ Выглядит это вот так

EUR/USD 1.4711 1.4714
USD/JPY 109.41 109.45
GBP/USD 1.9763 1.9767
USD/CHF 1.1145 1.1149
EUR/JPY 160.98 161.02
EUR/CHF 1.6398 1.6402
EUR/GBP 0.7443 0.7448
GBP/JPY 216.21 216.29
GBP/CHF 2.2024 2.2032
CHF/JPY  98.14  98.20
AUD/USD 0.8815 0.8820
NZD/USD 0.7735 0.7739
USD/CAD 0.9895 0.9900
}
 
 for i:=0  to 6 do     //И начинаем копаться в данных
 begin
 b:=s.Strings[i];

 item[i]:=copy(b,0,7);
 kotbid[i]:=copy(b,9,6);
 kotask[i]:=copy(b,16,6);
 p:=pos('.', kotbid[i]);
 ccc[i]:= kotbid[i];
 delete(ccc[i],p,1);
 If StrToInt(ccc[i])=StrToInt(ddd[i]) Then
 begin
  colval[i]:=colval1[i];
  imgon[i]:='off.bmp';
  end
else If StrToInt(ccc[i])>StrToInt(ddd[i]) Then
  begin
 colval[i]:=clGreen;
 imgon[i]:='up.bmp';
  end
else If StrToInt(ccc[i])<StrToInt(ddd[i]) Then
  begin
 colval[i]:=clMaroon;
 imgon[i]:='down.bmp';
  end;
 end;                            //Далее их выводим
 form1.val1.Caption:=item[0];
   form1.val2.Caption:=item[1];
    form1.val3.Caption:=item[2];
     form1.val4.Caption:=item[3];
      form1.val5.Caption:=item[4];
       form1.val6.Caption:=item[5];
        form1.val7.Caption:=item[6];
 form1.Image1.Picture.LoadFromFile(imgon[0]);
  form1.Image2.Picture.LoadFromFile(imgon[1]);
   form1.Image3.Picture.LoadFromFile(imgon[2]);
    form1.Image4.Picture.LoadFromFile(imgon[3]);
     form1.Image5.Picture.LoadFromFile(imgon[4]);
      form1.Image6.Picture.LoadFromFile(imgon[5]);
       form1.Image7.Picture.LoadFromFile(imgon[6]);

  form1.kot1.Font.Color:=colval[0];
  form1.kot1.Caption:=kotbid[0]+'        '+kotask[0];
   form1.kot2.Font.Color:=colval[1];
   form1.kot2.Caption:=kotbid[1]+'        '+kotask[1];
    form1.kot3.Font.Color:=colval[2];
    form1.kot3.Caption:=kotbid[2]+'        '+kotask[2];
     form1.kot4.Font.Color:=colval[3];
     form1.kot4.Caption:=kotbid[3]+'        '+kotask[3];
      form1.kot5.Font.Color:=colval[4];
      form1.kot5.Caption:=kotbid[4]+'        '+kotask[4];
       form1.kot6.Font.Color:=colval[5];
       form1.kot6.Caption:=kotbid[5]+'        '+kotask[5];
        form1.kot7.Font.Color:=colval[6];
        form1.kot7.Caption:=kotbid[6]+'        '+kotask[6];

     ddd:=ccc;
     colval1:=colval;
 s.Free;
 HTTP.Free;
end
 else
  begin
   Label1.Font.Color:=clRed;
   Form1.Label1.Caption:='Проверьте соединение с интернетом!';
  end;
end;

end.
 