mkdir x64
mkdir x64\Release
for %%f in (..\src\*.c) do (
	cl /c /Zi /W3 /WX- /sdl /O2 /Oi /GL /D _MBCS /D _CRT_SECURE_NO_WARNINGS /D _MBCS /Gm- /EHsc /MD /GS /Gy /fp:precise /Zc:wchar_t /Zc:forScope /Zc:inline /openmp /Fo"x64\Release\\" /Fd"x64\Release\vc140.pdb" /Gd /TC /errorReport:prompt %%f
	link "/OUT:.\x64\Release\%%~nf.exe" kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /MANIFEST "/MANIFESTUAC:level='asInvoker' uiAccess='false'" /manifest:embed /DEBUG "/PDB:.\x64\Release\%%~nf.pdb" /OPT:REF /OPT:ICF /LTCG:incremental /TLBID:1 /DYNAMICBASE /NXCOMPAT "/IMPLIB:.\x64\Release\%%~nf.lib" /MACHINE:X64 x64\Release\%%~nf.obj
)

