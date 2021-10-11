unit ConnectInfo;
interface
uses
Registry,SysUtils,Windows, WinSock, WinInet;
type
TConnectionType = (ctNone, ctProxy, ctDialup);
function ConnectedToInternet : TConnectionType;
function RasConnectionCount : Integer;
implementation
const
  cERROR_BUFFER_TOO_SMALL = 603;
  cRAS_MaxEntryName = 256;
  cRAS_MaxDeviceName = 128;
  cRAS_MaxDeviceType = 16;
type
  ERasError = class(Exception);
    HRASConn = DWord;
    PRASConn = ^TRASConn;
    TRASConn = record
    dwSize: DWORD;
    rasConn: HRASConn;
    szEntryName: array[0..cRAS_MaxEntryName] of Char;
    szDeviceType : array[0..cRAS_MaxDeviceType] of Char;
    szDeviceName : array [0..cRAS_MaxDeviceName] of char;
  end;
TRasEnumConnections = function (RASConn: PrasConn; var BufSize: DWord; var Connections: DWord ): LongInt; stdcall;
function ConnectedToInternet: TConnectionType;
var
  Reg : TRegistry;
  bUseProxy : Boolean;
  UseProxy : LongWord;
begin
  Result := ctNone;
  Reg := TRegistry.Create;
  with REG do
    try
      try
        RootKey := HKEY_CURRENT_USER;
        if OpenKey('\Software\Microsoft\Windows\CurrentVersion\Internet settings',False) then
        begin
          if GetDataType('ProxyEnable') = rdBinary then
            ReadBinaryData('ProxyEnable', UseProxy, SizeOf(LongWord) )
          else
          begin
            bUseProxy := ReadBool('ProxyEnable');
            if bUseProxy then
              UseProxy := 1
            else
              UseProxy := 0;
          end;
          if (UseProxy <> 0) and ( ReadString('ProxyServer') <> '' ) then
            Result := ctProxy;
        end;
      except
      end;
    finally
      Free;
    end;
  if Result = ctNone then
  begin
    if RasConnectionCount > 0 then
      Result := ctDialup;
  end;
end;

function RasConnectionCount : Integer;
var
  RasDLL : HInst;
  Conns : array[1..4] of TRasConn;
  RasEnums : TRasEnumConnections;
  BufSize : DWord;
  NumConns : DWord;
  RasResult : Longint;
begin
  Result := 0;
  RasDLL := LoadLibrary('rasapi32.dll');
  if RasDLL = 0 then
    exit;

  try
    RasEnums := GetProcAddress(RasDLL,'RasEnumConnectionsA');
  if @RasEnums = nil then
    raise ERasError.Create('RasEnumConnectionsA not found in rasapi32.dll');

  Conns[1].dwSize := Sizeof (Conns[1]);
  BufSize := SizeOf(Conns);

  RasResult := RasEnums(@Conns, BufSize, NumConns);

  if (RasResult = 0) or (Result = cERROR_BUFFER_TOO_SMALL) then
    Result := NumConns;
  finally
    FreeLibrary(RasDLL);
  end;
end;
{
  ShowMessage(IntToStr(RasConnectionCount));
  if ConnectedToInternet=ctNone then
    Form1.Caption:='ctNone';
  if ConnectedToInternet=ctProxy then
    Form1.Caption:='ctProxy';
  if ConnectedToInternet=ctDialup then
    Form1.Caption:='ctDialup';
}
end.

 