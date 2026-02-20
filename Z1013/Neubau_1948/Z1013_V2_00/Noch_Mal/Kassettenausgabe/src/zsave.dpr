program zsave;

{ Programm: ZSAVE 
	Speichern im Z1013-Headersave-Format
	Volker Pohlers, 200x
}

uses
  Forms,
  SysUtils,
  umain in 'umain.pas' {frmKCSave},
  uZ80File in 'uZ80File.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.MainFormOnTaskBar := true;
  Application.Title := 'ZSAVE';
  Application.HelpFile := ExtractFilePath(Application.ExeName) + 'zsave.chm';
  Application.CreateForm(TfrmKCSave, frmKCSave);
  Application.Run;
end.
