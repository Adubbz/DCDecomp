.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdSetFlag__Fv
/* 780A0 00177FA0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 780A4 00177FA4 0000BF7F */  sq         $31, 0x0($sp)
/* 780A8 00177FA8 849080AF */  sw         $0, -0x6F7C($gp)
/* 780AC 00177FAC B0DF050C */  jal        run_event_check__Fv
/* 780B0 00177FB0 00000000 */   nop
/* 780B4 00177FB4 03004010 */  beqz       $2, .L00177FC4
/* 780B8 00177FB8 00000000 */   nop
/* 780BC 00177FBC 01000224 */  addiu      $2, $0, 0x1
/* 780C0 00177FC0 849082AF */  sw         $2, -0x6F7C($gp)
.L00177FC4:
/* 780C4 00177FC4 8490828F */  lw         $2, -0x6F7C($gp)
/* 780C8 00177FC8 06004010 */  beqz       $2, .L00177FE4
/* 780CC 00177FCC 00000000 */   nop
/* 780D0 00177FD0 28260070 */  paddub     $4, $0, $0
/* 780D4 00177FD4 FCA5050C */  jal        EdSetKeyMode__Fi
/* 780D8 00177FD8 00000000 */   nop
/* 780DC 00177FDC 04000010 */  b          .L00177FF0
/* 780E0 00177FE0 00000000 */   nop
.L00177FE4:
/* 780E4 00177FE4 FFFF0434 */  ori        $4, $0, 0xFFFF
/* 780E8 00177FE8 FCA5050C */  jal        EdSetKeyMode__Fi
/* 780EC 00177FEC 00000000 */   nop
.L00177FF0:
/* 780F0 00177FF0 6087828F */  lw         $2, -0x78A0($gp)
/* 780F4 00177FF4 01004238 */  xori       $2, $2, 0x1
/* 780F8 00177FF8 0100422C */  sltiu      $2, $2, 0x1
/* 780FC 00177FFC B49082AF */  sw         $2, -0x6F4C($gp)
/* 78100 00178000 8490828F */  lw         $2, -0x6F7C($gp)
/* 78104 00178004 02004010 */  beqz       $2, .L00178010
/* 78108 00178008 00000000 */   nop
/* 7810C 0017800C B49080AF */  sw         $0, -0x6F4C($gp)
.L00178010:
/* 78110 00178010 1C8D848F */  lw         $4, -0x72E4($gp)
/* 78114 00178014 CC5E050C */  jal        GetConfigData__9CSaveDataFv
/* 78118 00178018 00000000 */   nop
/* 7811C 0017801C 0800438C */  lw         $3, 0x8($2)
/* 78120 00178020 2B180300 */  sltu       $3, $0, $3
/* 78124 00178024 01006338 */  xori       $3, $3, 0x1
/* 78128 00178028 FF006330 */  andi       $3, $3, 0xFF
/* 7812C 0017802C B89083AF */  sw         $3, -0x6F48($gp)
/* 78130 00178030 8490838F */  lw         $3, -0x6F7C($gp)
/* 78134 00178034 02006010 */  beqz       $3, .L00178040
/* 78138 00178038 00000000 */   nop
/* 7813C 0017803C B89080AF */  sw         $0, -0x6F48($gp)
.L00178040:
/* 78140 00178040 0000BF7B */  lq         $31, 0x0($sp)
/* 78144 00178044 1000BD27 */  addiu      $sp, $sp, 0x10
/* 78148 00178048 0800E003 */  jr         $31
/* 7814C 0017804C 00000000 */   nop
