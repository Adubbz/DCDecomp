.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel init_all__Fv
/* 040C90 00140B90 F0FFBD27 */  addiu       $29, $29, -0x10
/* 040C94 00140B94 0000BF7F */  sq          $31, 0x0($29)
/* 040C98 00140B98 28260070 */  paddub      $4, $0, $0
/* 040C9C 00140B9C 125B040C */  jal         sceSifInitRpc
/* 040CA0 00140BA0 00000000 */   nop
/* 040CA4 00140BA4 28260070 */  paddub      $4, $0, $0
/* 040CA8 00140BA8 042C040C */  jal         sceCdInit
/* 040CAC 00140BAC 00000000 */   nop
/* 040CB0 00140BB0 02000424 */  addiu       $4, $0, 0x2
/* 040CB4 00140BB4 542E040C */  jal         sceCdMmode
/* 040CB8 00140BB8 00000000 */   nop
.L00140BBC:
/* 040CBC 00140BBC 2A00023C */  lui         $2, %hi(LIT_626)
/* 040CC0 00140BC0 20924424 */  addiu       $4, $2, %lo(LIT_626)
/* 040CC4 00140BC4 5665040C */  jal         sceSifRebootIop
/* 040CC8 00140BC8 00000000 */   nop
/* 040CCC 00140BCC FBFF4010 */  beqz        $2, .L00140BBC
/* 040CD0 00140BD0 00000000 */   nop
.L00140BD4:
/* 040CD4 00140BD4 4465040C */  jal         sceSifSyncIop
/* 040CD8 00140BD8 00000000 */   nop
/* 040CDC 00140BDC FDFF4010 */  beqz        $2, .L00140BD4
/* 040CE0 00140BE0 00000000 */   nop
/* 040CE4 00140BE4 28260070 */  paddub      $4, $0, $0
/* 040CE8 00140BE8 125B040C */  jal         sceSifInitRpc
/* 040CEC 00140BEC 00000000 */   nop
/* 040CF0 00140BF0 28260070 */  paddub      $4, $0, $0
/* 040CF4 00140BF4 042C040C */  jal         sceCdInit
/* 040CF8 00140BF8 00000000 */   nop
/* 040CFC 00140BFC 02000424 */  addiu       $4, $0, 0x2
/* 040D00 00140C00 542E040C */  jal         sceCdMmode
/* 040D04 00140C04 00000000 */   nop
/* 040D08 00140C08 785F040C */  jal         sceFsReset
/* 040D0C 00140C0C 00000000 */   nop
.L00140C10:
/* 040D10 00140C10 2A00023C */  lui         $2, %hi(LIT_627)
/* 040D14 00140C14 40924424 */  addiu       $4, $2, %lo(LIT_627)
/* 040D18 00140C18 282E0070 */  paddub      $5, $0, $0
/* 040D1C 00140C1C 28360070 */  paddub      $6, $0, $0
/* 040D20 00140C20 1E64040C */  jal         sceSifLoadModule
/* 040D24 00140C24 00000000 */   nop
/* 040D28 00140C28 F9FF4004 */  bltz        $2, .L00140C10
/* 040D2C 00140C2C 00000000 */   nop
.L00140C30:
/* 040D30 00140C30 2A00023C */  lui         $2, %hi(LIT_628)
/* 040D34 00140C34 60924424 */  addiu       $4, $2, %lo(LIT_628)
/* 040D38 00140C38 282E0070 */  paddub      $5, $0, $0
/* 040D3C 00140C3C 28360070 */  paddub      $6, $0, $0
/* 040D40 00140C40 1E64040C */  jal         sceSifLoadModule
/* 040D44 00140C44 00000000 */   nop
/* 040D48 00140C48 F9FF4004 */  bltz        $2, .L00140C30
/* 040D4C 00140C4C 00000000 */   nop
.L00140C50:
/* 040D50 00140C50 2A00023C */  lui         $2, %hi(LIT_629)
/* 040D54 00140C54 80924424 */  addiu       $4, $2, %lo(LIT_629)
/* 040D58 00140C58 282E0070 */  paddub      $5, $0, $0
/* 040D5C 00140C5C 28360070 */  paddub      $6, $0, $0
/* 040D60 00140C60 1E64040C */  jal         sceSifLoadModule
/* 040D64 00140C64 00000000 */   nop
/* 040D68 00140C68 F9FF4004 */  bltz        $2, .L00140C50
/* 040D6C 00140C6C 00000000 */   nop
.L00140C70:
/* 040D70 00140C70 2A00023C */  lui         $2, %hi(LIT_630)
/* 040D74 00140C74 A0924424 */  addiu       $4, $2, %lo(LIT_630)
/* 040D78 00140C78 282E0070 */  paddub      $5, $0, $0
/* 040D7C 00140C7C 28360070 */  paddub      $6, $0, $0
/* 040D80 00140C80 1E64040C */  jal         sceSifLoadModule
/* 040D84 00140C84 00000000 */   nop
/* 040D88 00140C88 F9FF4004 */  bltz        $2, .L00140C70
/* 040D8C 00140C8C 00000000 */   nop
.L00140C90:
/* 040D90 00140C90 2A00023C */  lui         $2, %hi(LIT_631)
/* 040D94 00140C94 C0924424 */  addiu       $4, $2, %lo(LIT_631)
/* 040D98 00140C98 282E0070 */  paddub      $5, $0, $0
/* 040D9C 00140C9C 28360070 */  paddub      $6, $0, $0
/* 040DA0 00140CA0 1E64040C */  jal         sceSifLoadModule
/* 040DA4 00140CA4 00000000 */   nop
/* 040DA8 00140CA8 F9FF4004 */  bltz        $2, .L00140C90
/* 040DAC 00140CAC 00000000 */   nop
.L00140CB0:
/* 040DB0 00140CB0 2A00023C */  lui         $2, %hi(LIT_632)
/* 040DB4 00140CB4 E0924424 */  addiu       $4, $2, %lo(LIT_632)
/* 040DB8 00140CB8 282E0070 */  paddub      $5, $0, $0
/* 040DBC 00140CBC 28360070 */  paddub      $6, $0, $0
/* 040DC0 00140CC0 1E64040C */  jal         sceSifLoadModule
/* 040DC4 00140CC4 00000000 */   nop
/* 040DC8 00140CC8 F9FF4004 */  bltz        $2, .L00140CB0
/* 040DCC 00140CCC 00000000 */   nop
.L00140CD0:
/* 040DD0 00140CD0 2A00023C */  lui         $2, %hi(LIT_633)
/* 040DD4 00140CD4 00934424 */  addiu       $4, $2, %lo(LIT_633)
/* 040DD8 00140CD8 282E0070 */  paddub      $5, $0, $0
/* 040DDC 00140CDC 28360070 */  paddub      $6, $0, $0
/* 040DE0 00140CE0 1E64040C */  jal         sceSifLoadModule
/* 040DE4 00140CE4 00000000 */   nop
/* 040DE8 00140CE8 F9FF4004 */  bltz        $2, .L00140CD0
/* 040DEC 00140CEC 00000000 */   nop
.L00140CF0:
/* 040DF0 00140CF0 2A00023C */  lui         $2, %hi(LIT_634)
/* 040DF4 00140CF4 20934424 */  addiu       $4, $2, %lo(LIT_634)
/* 040DF8 00140CF8 282E0070 */  paddub      $5, $0, $0
/* 040DFC 00140CFC 28360070 */  paddub      $6, $0, $0
/* 040E00 00140D00 1E64040C */  jal         sceSifLoadModule
/* 040E04 00140D04 00000000 */   nop
/* 040E08 00140D08 F9FF4004 */  bltz        $2, .L00140CF0
/* 040E0C 00140D0C 00000000 */   nop
.L00140D10:
/* 040E10 00140D10 2A00023C */  lui         $2, %hi(LIT_635)
/* 040E14 00140D14 40934424 */  addiu       $4, $2, %lo(LIT_635)
/* 040E18 00140D18 282E0070 */  paddub      $5, $0, $0
/* 040E1C 00140D1C 28360070 */  paddub      $6, $0, $0
/* 040E20 00140D20 1E64040C */  jal         sceSifLoadModule
/* 040E24 00140D24 00000000 */   nop
/* 040E28 00140D28 F9FF4004 */  bltz        $2, .L00140D10
/* 040E2C 00140D2C 00000000 */   nop
/* 040E30 00140D30 84FC040C */  jal         InitCDFile__Fv
/* 040E34 00140D34 00000000 */   nop
/* 040E38 00140D38 E89E040C */  jal         DevInit__Fv
/* 040E3C 00140D3C 00000000 */   nop
/* 040E40 00140D40 01000424 */  addiu       $4, $0, 0x1
/* 040E44 00140D44 EA30040C */  jal         sceDmaGetChan
/* 040E48 00140D48 00000000 */   nop
/* 040E4C 00140D4C 488D82AF */  sw          $2, -0x72B8($28)
/* 040E50 00140D50 02000424 */  addiu       $4, $0, 0x2
/* 040E54 00140D54 EA30040C */  jal         sceDmaGetChan
/* 040E58 00140D58 00000000 */   nop
/* 040E5C 00140D5C 4C8D82AF */  sw          $2, -0x72B4($28)
/* 040E60 00140D60 08000424 */  addiu       $4, $0, 0x8
/* 040E64 00140D64 EA30040C */  jal         sceDmaGetChan
/* 040E68 00140D68 00000000 */   nop
/* 040E6C 00140D6C 508D82AF */  sw          $2, -0x72B0($28)
/* 040E70 00140D70 88B0040C */  jal         MGInit__Fv
/* 040E74 00140D74 00000000 */   nop
/* 040E78 00140D78 D4FC040C */  jal         InitMemoryFile__Fv
/* 040E7C 00140D7C 00000000 */   nop
/* 040E80 00140D80 F096040C */  jal         BufferAllClear__Fv
/* 040E84 00140D84 00000000 */   nop
/* 040E88 00140D88 94FA040C */  jal         InitReadBG__Fv
/* 040E8C 00140D8C 00000000 */   nop
/* 040E90 00140D90 0000BF7B */  lq          $31, 0x0($29)
/* 040E94 00140D94 1000BD27 */  addiu       $29, $29, 0x10
/* 040E98 00140D98 0800E003 */  jr          $31
/* 040E9C 00140D9C 00000000 */   nop
