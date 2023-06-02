.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel init_all__Fv
/* 40C90 00140B90 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 40C94 00140B94 0000BF7F */  sq         $31, 0x0($sp)
/* 40C98 00140B98 28260070 */  paddub     $4, $0, $0
/* 40C9C 00140B9C 125B040C */  jal        sceSifInitRpc
/* 40CA0 00140BA0 00000000 */   nop
/* 40CA4 00140BA4 28260070 */  paddub     $4, $0, $0
/* 40CA8 00140BA8 042C040C */  jal        sceCdInit
/* 40CAC 00140BAC 00000000 */   nop
/* 40CB0 00140BB0 02000424 */  addiu      $4, $0, 0x2
/* 40CB4 00140BB4 542E040C */  jal        sceCdMmode
/* 40CB8 00140BB8 00000000 */   nop
.L00140BBC:
/* 40CBC 00140BBC 2A00023C */  lui        $2, %hi(_626)
/* 40CC0 00140BC0 20924424 */  addiu      $4, $2, %lo(_626)
/* 40CC4 00140BC4 5665040C */  jal        sceSifRebootIop
/* 40CC8 00140BC8 00000000 */   nop
/* 40CCC 00140BCC FBFF4010 */  beqz       $2, .L00140BBC
/* 40CD0 00140BD0 00000000 */   nop
.L00140BD4:
/* 40CD4 00140BD4 4465040C */  jal        sceSifSyncIop
/* 40CD8 00140BD8 00000000 */   nop
/* 40CDC 00140BDC FDFF4010 */  beqz       $2, .L00140BD4
/* 40CE0 00140BE0 00000000 */   nop
/* 40CE4 00140BE4 28260070 */  paddub     $4, $0, $0
/* 40CE8 00140BE8 125B040C */  jal        sceSifInitRpc
/* 40CEC 00140BEC 00000000 */   nop
/* 40CF0 00140BF0 28260070 */  paddub     $4, $0, $0
/* 40CF4 00140BF4 042C040C */  jal        sceCdInit
/* 40CF8 00140BF8 00000000 */   nop
/* 40CFC 00140BFC 02000424 */  addiu      $4, $0, 0x2
/* 40D00 00140C00 542E040C */  jal        sceCdMmode
/* 40D04 00140C04 00000000 */   nop
/* 40D08 00140C08 785F040C */  jal        sceFsReset
/* 40D0C 00140C0C 00000000 */   nop
.L00140C10:
/* 40D10 00140C10 2A00023C */  lui        $2, %hi(_627)
/* 40D14 00140C14 40924424 */  addiu      $4, $2, %lo(_627)
/* 40D18 00140C18 282E0070 */  paddub     $5, $0, $0
/* 40D1C 00140C1C 28360070 */  paddub     $6, $0, $0
/* 40D20 00140C20 1E64040C */  jal        sceSifLoadModule
/* 40D24 00140C24 00000000 */   nop
/* 40D28 00140C28 F9FF4004 */  bltz       $2, .L00140C10
/* 40D2C 00140C2C 00000000 */   nop
.L00140C30:
/* 40D30 00140C30 2A00023C */  lui        $2, %hi(_628)
/* 40D34 00140C34 60924424 */  addiu      $4, $2, %lo(_628)
/* 40D38 00140C38 282E0070 */  paddub     $5, $0, $0
/* 40D3C 00140C3C 28360070 */  paddub     $6, $0, $0
/* 40D40 00140C40 1E64040C */  jal        sceSifLoadModule
/* 40D44 00140C44 00000000 */   nop
/* 40D48 00140C48 F9FF4004 */  bltz       $2, .L00140C30
/* 40D4C 00140C4C 00000000 */   nop
.L00140C50:
/* 40D50 00140C50 2A00023C */  lui        $2, %hi(_629)
/* 40D54 00140C54 80924424 */  addiu      $4, $2, %lo(_629)
/* 40D58 00140C58 282E0070 */  paddub     $5, $0, $0
/* 40D5C 00140C5C 28360070 */  paddub     $6, $0, $0
/* 40D60 00140C60 1E64040C */  jal        sceSifLoadModule
/* 40D64 00140C64 00000000 */   nop
/* 40D68 00140C68 F9FF4004 */  bltz       $2, .L00140C50
/* 40D6C 00140C6C 00000000 */   nop
.L00140C70:
/* 40D70 00140C70 2A00023C */  lui        $2, %hi(_630)
/* 40D74 00140C74 A0924424 */  addiu      $4, $2, %lo(_630)
/* 40D78 00140C78 282E0070 */  paddub     $5, $0, $0
/* 40D7C 00140C7C 28360070 */  paddub     $6, $0, $0
/* 40D80 00140C80 1E64040C */  jal        sceSifLoadModule
/* 40D84 00140C84 00000000 */   nop
/* 40D88 00140C88 F9FF4004 */  bltz       $2, .L00140C70
/* 40D8C 00140C8C 00000000 */   nop
.L00140C90:
/* 40D90 00140C90 2A00023C */  lui        $2, %hi(_631)
/* 40D94 00140C94 C0924424 */  addiu      $4, $2, %lo(_631)
/* 40D98 00140C98 282E0070 */  paddub     $5, $0, $0
/* 40D9C 00140C9C 28360070 */  paddub     $6, $0, $0
/* 40DA0 00140CA0 1E64040C */  jal        sceSifLoadModule
/* 40DA4 00140CA4 00000000 */   nop
/* 40DA8 00140CA8 F9FF4004 */  bltz       $2, .L00140C90
/* 40DAC 00140CAC 00000000 */   nop
.L00140CB0:
/* 40DB0 00140CB0 2A00023C */  lui        $2, %hi(_632)
/* 40DB4 00140CB4 E0924424 */  addiu      $4, $2, %lo(_632)
/* 40DB8 00140CB8 282E0070 */  paddub     $5, $0, $0
/* 40DBC 00140CBC 28360070 */  paddub     $6, $0, $0
/* 40DC0 00140CC0 1E64040C */  jal        sceSifLoadModule
/* 40DC4 00140CC4 00000000 */   nop
/* 40DC8 00140CC8 F9FF4004 */  bltz       $2, .L00140CB0
/* 40DCC 00140CCC 00000000 */   nop
.L00140CD0:
/* 40DD0 00140CD0 2A00023C */  lui        $2, %hi(_633)
/* 40DD4 00140CD4 00934424 */  addiu      $4, $2, %lo(_633)
/* 40DD8 00140CD8 282E0070 */  paddub     $5, $0, $0
/* 40DDC 00140CDC 28360070 */  paddub     $6, $0, $0
/* 40DE0 00140CE0 1E64040C */  jal        sceSifLoadModule
/* 40DE4 00140CE4 00000000 */   nop
/* 40DE8 00140CE8 F9FF4004 */  bltz       $2, .L00140CD0
/* 40DEC 00140CEC 00000000 */   nop
.L00140CF0:
/* 40DF0 00140CF0 2A00023C */  lui        $2, %hi(_634)
/* 40DF4 00140CF4 20934424 */  addiu      $4, $2, %lo(_634)
/* 40DF8 00140CF8 282E0070 */  paddub     $5, $0, $0
/* 40DFC 00140CFC 28360070 */  paddub     $6, $0, $0
/* 40E00 00140D00 1E64040C */  jal        sceSifLoadModule
/* 40E04 00140D04 00000000 */   nop
/* 40E08 00140D08 F9FF4004 */  bltz       $2, .L00140CF0
/* 40E0C 00140D0C 00000000 */   nop
.L00140D10:
/* 40E10 00140D10 2A00023C */  lui        $2, %hi(_635)
/* 40E14 00140D14 40934424 */  addiu      $4, $2, %lo(_635)
/* 40E18 00140D18 282E0070 */  paddub     $5, $0, $0
/* 40E1C 00140D1C 28360070 */  paddub     $6, $0, $0
/* 40E20 00140D20 1E64040C */  jal        sceSifLoadModule
/* 40E24 00140D24 00000000 */   nop
/* 40E28 00140D28 F9FF4004 */  bltz       $2, .L00140D10
/* 40E2C 00140D2C 00000000 */   nop
/* 40E30 00140D30 84FC040C */  jal        InitCDFile__Fv
/* 40E34 00140D34 00000000 */   nop
/* 40E38 00140D38 E89E040C */  jal        DevInit__Fv
/* 40E3C 00140D3C 00000000 */   nop
/* 40E40 00140D40 01000424 */  addiu      $4, $0, 0x1
/* 40E44 00140D44 EA30040C */  jal        sceDmaGetChan
/* 40E48 00140D48 00000000 */   nop
/* 40E4C 00140D4C 488D82AF */  sw         $2, -0x72B8($gp)
/* 40E50 00140D50 02000424 */  addiu      $4, $0, 0x2
/* 40E54 00140D54 EA30040C */  jal        sceDmaGetChan
/* 40E58 00140D58 00000000 */   nop
/* 40E5C 00140D5C 4C8D82AF */  sw         $2, -0x72B4($gp)
/* 40E60 00140D60 08000424 */  addiu      $4, $0, 0x8
/* 40E64 00140D64 EA30040C */  jal        sceDmaGetChan
/* 40E68 00140D68 00000000 */   nop
/* 40E6C 00140D6C 508D82AF */  sw         $2, -0x72B0($gp)
/* 40E70 00140D70 88B0040C */  jal        MGInit__Fv
/* 40E74 00140D74 00000000 */   nop
/* 40E78 00140D78 D4FC040C */  jal        InitMemoryFile__Fv
/* 40E7C 00140D7C 00000000 */   nop
/* 40E80 00140D80 F096040C */  jal        BufferAllClear__Fv
/* 40E84 00140D84 00000000 */   nop
/* 40E88 00140D88 94FA040C */  jal        InitReadBG__Fv
/* 40E8C 00140D8C 00000000 */   nop
/* 40E90 00140D90 0000BF7B */  lq         $31, 0x0($sp)
/* 40E94 00140D94 1000BD27 */  addiu      $sp, $sp, 0x10
/* 40E98 00140D98 0800E003 */  jr         $31
/* 40E9C 00140D9C 00000000 */   nop
