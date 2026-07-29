.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdDrawOpenItemBox__Fv
/* 073E00 00173D00 D0FFBD27 */  addiu       $29, $29, -0x30
/* 073E04 00173D04 0000BF7F */  sq          $31, 0x0($29)
/* 073E08 00173D08 A88F838F */  lw          $3, -0x7058($28)
/* 073E0C 00173D0C 04006014 */  bnez        $3, .L00173D20
/* 073E10 00173D10 00000000 */   nop
/* 073E14 00173D14 AC8F838F */  lw          $3, -0x7054($28)
/* 073E18 00173D18 33006010 */  beqz        $3, .L00173DE8
/* 073E1C 00173D1C 00000000 */   nop
.L00173D20:
/* 073E20 00173D20 B48F848F */  lw          $4, -0x704C($28)
/* 073E24 00173D24 0E008010 */  beqz        $4, .L00173D60
/* 073E28 00173D28 00000000 */   nop
/* 073E2C 00173D2C D201023C */  lui         $2, %hi(ibox_pos)
/* 073E30 00173D30 809A4524 */  addiu       $5, $2, %lo(ibox_pos)
/* 073E34 00173D34 B89F040C */  jal         SetPosition__6CFrameFPf
/* 073E38 00173D38 00000000 */   nop
/* 073E3C 00173D3C B48F848F */  lw          $4, -0x704C($28)
/* 073E40 00173D40 D201013C */  lui         $1, %hi(ibox_rot)
/* 073E44 00173D44 909A2CC4 */  lwc1        $f12, %lo(ibox_rot)($1)
/* 073E48 00173D48 D201013C */  lui         $1, %hi(ibox_rot + 0x4)
/* 073E4C 00173D4C 949A2DC4 */  lwc1        $f13, %lo(ibox_rot + 0x4)($1)
/* 073E50 00173D50 D201013C */  lui         $1, %hi(ibox_rot + 0x8)
/* 073E54 00173D54 989A2EC4 */  lwc1        $f14, %lo(ibox_rot + 0x8)($1)
/* 073E58 00173D58 70A3040C */  jal         SetRotation__6CFrameFfff
/* 073E5C 00173D5C 00000000 */   nop
.L00173D60:
/* 073E60 00173D60 1000A427 */  addiu       $4, $29, 0x10
/* 073E64 00173D64 4CB7040C */  jal         MGGetAmbient__FPf
/* 073E68 00173D68 00000000 */   nop
/* 073E6C 00173D6C 2000A427 */  addiu       $4, $29, 0x20
/* 073E70 00173D70 1000A527 */  addiu       $5, $29, 0x10
/* 073E74 00173D74 0C86040C */  jal         sceVu0CopyVector
/* 073E78 00173D78 00000000 */   nop
/* 073E7C 00173D7C B08F838F */  lw          $3, -0x7050($28)
/* 073E80 00173D80 14006128 */  slti        $1, $3, 0x14
/* 073E84 00173D84 0C002010 */  beqz        $1, .L00173DB8
/* 073E88 00173D88 00000000 */   nop
/* 073E8C 00173D8C 0043023C */  lui         $2, (0x43000000 >> 16)
/* 073E90 00173D90 00088244 */  mtc1        $2, $f1
/* 073E94 00173D94 00008344 */  mtc1        $3, $f0
/* 073E98 00173D98 00000000 */  nop
/* 073E9C 00173D9C 20008046 */  cvt.s.w     $f0, $f0
/* 073EA0 00173DA0 42080046 */  mul.s       $f1, $f1, $f0
/* 073EA4 00173DA4 A041023C */  lui         $2, (0x41A00000 >> 16)
/* 073EA8 00173DA8 00008244 */  mtc1        $2, $f0
/* 073EAC 00173DAC 00000000 */  nop
/* 073EB0 00173DB0 03080046 */  div.s       $f0, $f1, $f0
/* 073EB4 00173DB4 1C00A0E7 */  swc1        $f0, 0x1C($29)
.L00173DB8:
/* 073EB8 00173DB8 A88F828F */  lw          $2, -0x7058($28)
/* 073EBC 00173DBC 04004010 */  beqz        $2, .L00173DD0
/* 073EC0 00173DC0 00000000 */   nop
/* 073EC4 00173DC4 1000A427 */  addiu       $4, $29, 0x10
/* 073EC8 00173DC8 40B7040C */  jal         MGSetAmbient__FPf
/* 073ECC 00173DCC 00000000 */   nop
.L00173DD0:
/* 073ED0 00173DD0 B48F848F */  lw          $4, -0x704C($28)
/* 073ED4 00173DD4 60BB040C */  jal         MGDraw__FP6CFrame
/* 073ED8 00173DD8 00000000 */   nop
/* 073EDC 00173DDC 2000A427 */  addiu       $4, $29, 0x20
/* 073EE0 00173DE0 40B7040C */  jal         MGSetAmbient__FPf
/* 073EE4 00173DE4 00000000 */   nop
.L00173DE8:
/* 073EE8 00173DE8 0000BF7B */  lq          $31, 0x0($29)
/* 073EEC 00173DEC 3000BD27 */  addiu       $29, $29, 0x30
/* 073EF0 00173DF0 0800E003 */  jr          $31
/* 073EF4 00173DF4 00000000 */   nop
/* 073EF8 00173DF8 00000000 */  nop
/* 073EFC 00173DFC 00000000 */  nop
