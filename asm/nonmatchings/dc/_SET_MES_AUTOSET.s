.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_MES_AUTOSET__FP12RS_STACKDATAi
/* 8FD10 0018FC10 50FFBD27 */  addiu      $sp, $sp, -0xB0
/* 8FD14 0018FC14 3000BF7F */  sq         $31, 0x30($sp)
/* 8FD18 0018FC18 2000B27F */  sq         $18, 0x20($sp)
/* 8FD1C 0018FC1C 1000B17F */  sq         $17, 0x10($sp)
/* 8FD20 0018FC20 0000B07F */  sq         $16, 0x0($sp)
/* 8FD24 0018FC24 2896A070 */  paddub     $18, $5, $0
/* 8FD28 0018FC28 08009124 */  addiu      $17, $4, 0x8
/* 8FD2C 0018FC2C D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8FD30 0018FC30 00000000 */   nop
/* 8FD34 0018FC34 28264070 */  paddub     $4, $2, $0
/* 8FD38 0018FC38 643E060C */  jal        GetMes__Fi
/* 8FD3C 0018FC3C 00000000 */   nop
/* 8FD40 0018FC40 28864070 */  paddub     $16, $2, $0
/* 8FD44 0018FC44 04000016 */  bnez       $16, .L0018FC58
/* 8FD48 0018FC48 00000000 */   nop
/* 8FD4C 0018FC4C 28160070 */  paddub     $2, $0, $0
/* 8FD50 0018FC50 57000010 */  b          .L0018FDB0
/* 8FD54 0018FC54 00000000 */   nop
.L0018FC58:
/* 8FD58 0018FC58 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8FD5C 0018FC5C 10D2248C */  lw         $4, -0x2DF0($at)
/* 8FD60 0018FC60 0D008010 */  beqz       $4, .L0018FC98
/* 8FD64 0018FC64 00000000 */   nop
/* 8FD68 0018FC68 4000A527 */  addiu      $5, $sp, 0x40
/* 8FD6C 0018FC6C F890040C */  jal        GetCameraMatrix__7CCameraFPA4_f
/* 8FD70 0018FC70 00000000 */   nop
/* 8FD74 0018FC74 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8FD78 0018FC78 10D2248C */  lw         $4, -0x2DF0($at)
/* 8FD7C 0018FC7C 8000A527 */  addiu      $5, $sp, 0x80
/* 8FD80 0018FC80 9C91040C */  jal        GetPos__7CCameraFPf
/* 8FD84 0018FC84 00000000 */   nop
/* 8FD88 0018FC88 4000A427 */  addiu      $4, $sp, 0x40
/* 8FD8C 0018FC8C 8000A527 */  addiu      $5, $sp, 0x80
/* 8FD90 0018FC90 E8B7040C */  jal        MGSetViewMatrix__FPA4_fPf
/* 8FD94 0018FC94 00000000 */   nop
.L0018FC98:
/* 8FD98 0018FC98 05000224 */  addiu      $2, $0, 0x5
/* 8FD9C 0018FC9C 16004216 */  bne        $18, $2, .L0018FCF8
/* 8FDA0 0018FCA0 00000000 */   nop
/* 8FDA4 0018FCA4 28960070 */  paddub     $18, $0, $0
/* 8FDA8 0018FCA8 09000010 */  b          .L0018FCD0
/* 8FDAC 0018FCAC 00000000 */   nop
.L0018FCB0:
/* 8FDB0 0018FCB0 28262072 */  paddub     $4, $17, $0
/* 8FDB4 0018FCB4 08009124 */  addiu      $17, $4, 0x8
/* 8FDB8 0018FCB8 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8FDBC 0018FCBC 00000000 */   nop
/* 8FDC0 0018FCC0 80181200 */  sll        $3, $18, 2
/* 8FDC4 0018FCC4 21187D00 */  addu       $3, $3, $sp
/* 8FDC8 0018FCC8 900062AC */  sw         $2, 0x90($3)
/* 8FDCC 0018FCCC 01005226 */  addiu      $18, $18, 0x1
.L0018FCD0:
/* 8FDD0 0018FCD0 0400422A */  slti       $2, $18, 0x4
/* 8FDD4 0018FCD4 F6FF4014 */  bnez       $2, .L0018FCB0
/* 8FDD8 0018FCD8 00000000 */   nop
/* 8FDDC 0018FCDC 28260072 */  paddub     $4, $16, $0
/* 8FDE0 0018FCE0 9000A527 */  addiu      $5, $sp, 0x90
/* 8FDE4 0018FCE4 0C34050C */  jal        AutoSet__6ClsMesFPi
/* 8FDE8 0018FCE8 00000000 */   nop
/* 8FDEC 0018FCEC 01000224 */  addiu      $2, $0, 0x1
/* 8FDF0 0018FCF0 2F000010 */  b          .L0018FDB0
/* 8FDF4 0018FCF4 00000000 */   nop
.L0018FCF8:
/* 8FDF8 0018FCF8 03000224 */  addiu      $2, $0, 0x3
/* 8FDFC 0018FCFC 2B004216 */  bne        $18, $2, .L0018FDAC
/* 8FE00 0018FD00 00000000 */   nop
/* 8FE04 0018FD04 28262072 */  paddub     $4, $17, $0
/* 8FE08 0018FD08 08009124 */  addiu      $17, $4, 0x8
/* 8FE0C 0018FD0C D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8FE10 0018FD10 00000000 */   nop
/* 8FE14 0018FD14 28964070 */  paddub     $18, $2, $0
/* 8FE18 0018FD18 28262072 */  paddub     $4, $17, $0
/* 8FE1C 0018FD1C D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8FE20 0018FD20 00000000 */   nop
/* 8FE24 0018FD24 28364070 */  paddub     $6, $2, $0
/* 8FE28 0018FD28 FFFF0224 */  addiu      $2, $0, -0x1
/* 8FE2C 0018FD2C 05004216 */  bne        $18, $2, .L0018FD44
/* 8FE30 0018FD30 00000000 */   nop
/* 8FE34 0018FD34 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8FE38 0018FD38 1CD2258C */  lw         $5, -0x2DE4($at)
/* 8FE3C 0018FD3C 05000010 */  b          .L0018FD54
/* 8FE40 0018FD40 00000000 */   nop
.L0018FD44:
/* 8FE44 0018FD44 28264072 */  paddub     $4, $18, $0
/* 8FE48 0018FD48 702C060C */  jal        GetNPC__Fi
/* 8FE4C 0018FD4C 00000000 */   nop
/* 8FE50 0018FD50 282E4070 */  paddub     $5, $2, $0
.L0018FD54:
/* 8FE54 0018FD54 FFFF0224 */  addiu      $2, $0, -0x1
/* 8FE58 0018FD58 0500C214 */  bne        $6, $2, .L0018FD70
/* 8FE5C 0018FD5C 00000000 */   nop
/* 8FE60 0018FD60 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8FE64 0018FD64 1CD2228C */  lw         $2, -0x2DE4($at)
/* 8FE68 0018FD68 04000010 */  b          .L0018FD7C
/* 8FE6C 0018FD6C 00000000 */   nop
.L0018FD70:
/* 8FE70 0018FD70 2826C070 */  paddub     $4, $6, $0
/* 8FE74 0018FD74 702C060C */  jal        GetNPC__Fi
/* 8FE78 0018FD78 00000000 */   nop
.L0018FD7C:
/* 8FE7C 0018FD7C 28260072 */  paddub     $4, $16, $0
/* 8FE80 0018FD80 28364070 */  paddub     $6, $2, $0
/* 8FE84 0018FD84 A000A727 */  addiu      $7, $sp, 0xA0
/* 8FE88 0018FD88 F833050C */  jal        AutoSetSub__6ClsMesFP10CCharacterP10CCharacterPi
/* 8FE8C 0018FD8C 00000000 */   nop
/* 8FE90 0018FD90 28260072 */  paddub     $4, $16, $0
/* 8FE94 0018FD94 A000A527 */  addiu      $5, $sp, 0xA0
/* 8FE98 0018FD98 0C34050C */  jal        AutoSet__6ClsMesFPi
/* 8FE9C 0018FD9C 00000000 */   nop
/* 8FEA0 0018FDA0 01000224 */  addiu      $2, $0, 0x1
/* 8FEA4 0018FDA4 02000010 */  b          .L0018FDB0
/* 8FEA8 0018FDA8 00000000 */   nop
.L0018FDAC:
/* 8FEAC 0018FDAC 28160070 */  paddub     $2, $0, $0
.L0018FDB0:
/* 8FEB0 0018FDB0 3000BF7B */  lq         $31, 0x30($sp)
/* 8FEB4 0018FDB4 2000B27B */  lq         $18, 0x20($sp)
/* 8FEB8 0018FDB8 1000B17B */  lq         $17, 0x10($sp)
/* 8FEBC 0018FDBC 0000B07B */  lq         $16, 0x0($sp)
/* 8FEC0 0018FDC0 B000BD27 */  addiu      $sp, $sp, 0xB0
/* 8FEC4 0018FDC4 0800E003 */  jr         $31
/* 8FEC8 0018FDC8 00000000 */   nop
/* 8FECC 0018FDCC 00000000 */  nop
