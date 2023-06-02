.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LangsetProc__Fv
/* 144E60 00244D60 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 144E64 00244D64 0000BF7F */  sq         $31, 0x0($sp)
/* 144E68 00244D68 CC01023C */  lui        $2, %hi(GamePad)
/* 144E6C 00244D6C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 144E70 00244D70 00100524 */  addiu      $5, $0, 0x1000
/* 144E74 00244D74 1CAE040C */  jal        Down__8CGamePadFi
/* 144E78 00244D78 00000000 */   nop
/* 144E7C 00244D7C 04004010 */  beqz       $2, .L00244D90
/* 144E80 00244D80 00000000 */   nop
/* 144E84 00244D84 EC97828F */  lw         $2, -0x6814($gp)
/* 144E88 00244D88 FFFF4224 */  addiu      $2, $2, -0x1
/* 144E8C 00244D8C EC9782AF */  sw         $2, -0x6814($gp)
.L00244D90:
/* 144E90 00244D90 CC01023C */  lui        $2, %hi(GamePad)
/* 144E94 00244D94 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 144E98 00244D98 00400524 */  addiu      $5, $0, 0x4000
/* 144E9C 00244D9C 1CAE040C */  jal        Down__8CGamePadFi
/* 144EA0 00244DA0 00000000 */   nop
/* 144EA4 00244DA4 04004010 */  beqz       $2, .L00244DB8
/* 144EA8 00244DA8 00000000 */   nop
/* 144EAC 00244DAC EC97828F */  lw         $2, -0x6814($gp)
/* 144EB0 00244DB0 01004224 */  addiu      $2, $2, 0x1
/* 144EB4 00244DB4 EC9782AF */  sw         $2, -0x6814($gp)
.L00244DB8:
/* 144EB8 00244DB8 EC97828F */  lw         $2, -0x6814($gp)
/* 144EBC 00244DBC 03004104 */  bgez       $2, .L00244DCC
/* 144EC0 00244DC0 00000000 */   nop
/* 144EC4 00244DC4 04000224 */  addiu      $2, $0, 0x4
/* 144EC8 00244DC8 EC9782AF */  sw         $2, -0x6814($gp)
.L00244DCC:
/* 144ECC 00244DCC EC97828F */  lw         $2, -0x6814($gp)
/* 144ED0 00244DD0 05004128 */  slti       $at, $2, 0x5
/* 144ED4 00244DD4 02002014 */  bnez       $at, .L00244DE0
/* 144ED8 00244DD8 00000000 */   nop
/* 144EDC 00244DDC EC9780AF */  sw         $0, -0x6814($gp)
.L00244DE0:
/* 144EE0 00244DE0 CC01023C */  lui        $2, %hi(GamePad)
/* 144EE4 00244DE4 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 144EE8 00244DE8 00080524 */  addiu      $5, $0, 0x800
/* 144EEC 00244DEC 1CAE040C */  jal        Down__8CGamePadFi
/* 144EF0 00244DF0 00000000 */   nop
/* 144EF4 00244DF4 08004014 */  bnez       $2, .L00244E18
/* 144EF8 00244DF8 00000000 */   nop
/* 144EFC 00244DFC CC01023C */  lui        $2, %hi(GamePad)
/* 144F00 00244E00 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 144F04 00244E04 40000524 */  addiu      $5, $0, 0x40
/* 144F08 00244E08 1CAE040C */  jal        Down__8CGamePadFi
/* 144F0C 00244E0C 00000000 */   nop
/* 144F10 00244E10 04004010 */  beqz       $2, .L00244E24
/* 144F14 00244E14 00000000 */   nop
.L00244E18:
/* 144F18 00244E18 01000224 */  addiu      $2, $0, 0x1
/* 144F1C 00244E1C 02000010 */  b          .L00244E28
/* 144F20 00244E20 00000000 */   nop
.L00244E24:
/* 144F24 00244E24 28160070 */  paddub     $2, $0, $0
.L00244E28:
/* 144F28 00244E28 0000BF7B */  lq         $31, 0x0($sp)
/* 144F2C 00244E2C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 144F30 00244E30 0800E003 */  jr         $31
/* 144F34 00244E34 00000000 */   nop
/* 144F38 00244E38 00000000 */  nop
/* 144F3C 00244E3C 00000000 */  nop
