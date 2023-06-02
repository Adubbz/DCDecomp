.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdDrawOpenItemBox__Fv
/* 73E00 00173D00 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 73E04 00173D04 0000BF7F */  sq         $31, 0x0($sp)
/* 73E08 00173D08 A88F838F */  lw         $3, -0x7058($gp)
/* 73E0C 00173D0C 04006014 */  bnez       $3, .L00173D20
/* 73E10 00173D10 00000000 */   nop
/* 73E14 00173D14 AC8F838F */  lw         $3, -0x7054($gp)
/* 73E18 00173D18 33006010 */  beqz       $3, .L00173DE8
/* 73E1C 00173D1C 00000000 */   nop
.L00173D20:
/* 73E20 00173D20 B48F848F */  lw         $4, -0x704C($gp)
/* 73E24 00173D24 0E008010 */  beqz       $4, .L00173D60
/* 73E28 00173D28 00000000 */   nop
/* 73E2C 00173D2C D201023C */  lui        $2, %hi(ibox_pos)
/* 73E30 00173D30 809A4524 */  addiu      $5, $2, %lo(ibox_pos)
/* 73E34 00173D34 B89F040C */  jal        SetPosition__6CFrameFPf
/* 73E38 00173D38 00000000 */   nop
/* 73E3C 00173D3C B48F848F */  lw         $4, -0x704C($gp)
/* 73E40 00173D40 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 73E44 00173D44 909A2CC4 */  lwc1       $f12, -0x6570($at)
/* 73E48 00173D48 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 73E4C 00173D4C 949A2DC4 */  lwc1       $f13, -0x656C($at)
/* 73E50 00173D50 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 73E54 00173D54 989A2EC4 */  lwc1       $f14, -0x6568($at)
/* 73E58 00173D58 70A3040C */  jal        SetRotation__6CFrameFfff
/* 73E5C 00173D5C 00000000 */   nop
.L00173D60:
/* 73E60 00173D60 1000A427 */  addiu      $4, $sp, 0x10
/* 73E64 00173D64 4CB7040C */  jal        MGGetAmbient__FPf
/* 73E68 00173D68 00000000 */   nop
/* 73E6C 00173D6C 2000A427 */  addiu      $4, $sp, 0x20
/* 73E70 00173D70 1000A527 */  addiu      $5, $sp, 0x10
/* 73E74 00173D74 0C86040C */  jal        sceVu0CopyVector
/* 73E78 00173D78 00000000 */   nop
/* 73E7C 00173D7C B08F838F */  lw         $3, -0x7050($gp)
/* 73E80 00173D80 14006128 */  slti       $at, $3, 0x14
/* 73E84 00173D84 0C002010 */  beqz       $at, .L00173DB8
/* 73E88 00173D88 00000000 */   nop
/* 73E8C 00173D8C 0043023C */  lui        $2, (0x43000000 >> 16)
/* 73E90 00173D90 00088244 */  mtc1       $2, $f1
/* 73E94 00173D94 00008344 */  mtc1       $3, $f0
/* 73E98 00173D98 00000000 */  nop
/* 73E9C 00173D9C 20008046 */  cvt.s.w    $f0, $f0
/* 73EA0 00173DA0 42080046 */  mul.s      $f1, $f1, $f0
/* 73EA4 00173DA4 A041023C */  lui        $2, (0x41A00000 >> 16)
/* 73EA8 00173DA8 00008244 */  mtc1       $2, $f0
/* 73EAC 00173DAC 00000000 */  nop
/* 73EB0 00173DB0 03080046 */  div.s      $f0, $f1, $f0
/* 73EB4 00173DB4 1C00A0E7 */  swc1       $f0, 0x1C($sp)
.L00173DB8:
/* 73EB8 00173DB8 A88F828F */  lw         $2, -0x7058($gp)
/* 73EBC 00173DBC 04004010 */  beqz       $2, .L00173DD0
/* 73EC0 00173DC0 00000000 */   nop
/* 73EC4 00173DC4 1000A427 */  addiu      $4, $sp, 0x10
/* 73EC8 00173DC8 40B7040C */  jal        MGSetAmbient__FPf
/* 73ECC 00173DCC 00000000 */   nop
.L00173DD0:
/* 73ED0 00173DD0 B48F848F */  lw         $4, -0x704C($gp)
/* 73ED4 00173DD4 60BB040C */  jal        MGDraw__FP6CFrame
/* 73ED8 00173DD8 00000000 */   nop
/* 73EDC 00173DDC 2000A427 */  addiu      $4, $sp, 0x20
/* 73EE0 00173DE0 40B7040C */  jal        MGSetAmbient__FPf
/* 73EE4 00173DE4 00000000 */   nop
.L00173DE8:
/* 73EE8 00173DE8 0000BF7B */  lq         $31, 0x0($sp)
/* 73EEC 00173DEC 3000BD27 */  addiu      $sp, $sp, 0x30
/* 73EF0 00173DF0 0800E003 */  jr         $31
/* 73EF4 00173DF4 00000000 */   nop
/* 73EF8 00173DF8 00000000 */  nop
/* 73EFC 00173DFC 00000000 */  nop
