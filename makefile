#------------------------------------------------------------------------------
!ifndef ROOT
ROOT = $(MAKEDIR)\..
!endif
#------------------------------------------------------------------------------
MAKE = $(ROOT)\bin\make.exe -$(MAKEFLAGS) -f$&.mak
BPR2MAK = $(ROOT)\bin\bpr2mak
#------------------------------------------------------------------------------
default: WinSCP3.exe DragExt.dll lib\DiscMon_B5.lib

WinSCP3.exe: WinSCP3.bpr
WinSCP3.exe: lib\Moje_B5.lib lib\DragDrop_B5.lib lib\DriveDir_B5.lib
WinSCP3.exe: lib\Putty.lib lib\ScpCore.lib lib\RScpComp.lib lib\ScpForms.lib
 $(BPR2MAK) WinSCP3.bpr
 $(MAKE)

DragExt.dll: DragExt.bpr
 $(BPR2MAK) DragExt.bpr
 $(MAKE)

{packages}.bpk{lib}.lib:
 cd packages
 $(BPR2MAK) $.
 $(MAKE)
 cd ..

{}.bpk{lib}.lib:
 $(BPR2MAK) $.
 $(MAKE)

{}.bpr{lib}.lib:
 $(BPR2MAK) -t$(ROOT)\bin\deflib.bmk $.
 $(MAKE)
