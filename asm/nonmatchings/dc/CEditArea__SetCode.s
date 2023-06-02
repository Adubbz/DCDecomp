.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetCode__9CEditAreaFiii
/* 6DBE0 0016DAE0 0500A004 */  bltz       $5, .L0016DAF8
/* 6DBE4 0016DAE4 00000000 */   nop
/* 6DBE8 0016DAE8 0800838C */  lw         $3, 0x8($4)
/* 6DBEC 0016DAEC 2A18A300 */  slt        $3, $5, $3
/* 6DBF0 0016DAF0 03006014 */  bnez       $3, .L0016DB00
/* 6DBF4 0016DAF4 00000000 */   nop
.L0016DAF8:
/* 6DBF8 0016DAF8 12000010 */  b          .L0016DB44
/* 6DBFC 0016DAFC 00000000 */   nop
.L0016DB00:
/* 6DC00 0016DB00 0500C004 */  bltz       $6, .L0016DB18
/* 6DC04 0016DB04 00000000 */   nop
/* 6DC08 0016DB08 0C00838C */  lw         $3, 0xC($4)
/* 6DC0C 0016DB0C 2A18C300 */  slt        $3, $6, $3
/* 6DC10 0016DB10 03006014 */  bnez       $3, .L0016DB20
/* 6DC14 0016DB14 00000000 */   nop
.L0016DB18:
/* 6DC18 0016DB18 0A000010 */  b          .L0016DB44
/* 6DC1C 0016DB1C 00000000 */   nop
.L0016DB20:
/* 6DC20 0016DB20 C0180500 */  sll        $3, $5, 3
/* 6DC24 0016DB24 23186500 */  subu       $3, $3, $5
/* 6DC28 0016DB28 80190300 */  sll        $3, $3, 6
/* 6DC2C 0016DB2C 21206400 */  addu       $4, $3, $4
/* 6DC30 0016DB30 C0180600 */  sll        $3, $6, 3
/* 6DC34 0016DB34 23186600 */  subu       $3, $3, $6
/* 6DC38 0016DB38 80180300 */  sll        $3, $3, 2
/* 6DC3C 0016DB3C 21186400 */  addu       $3, $3, $4
/* 6DC40 0016DB40 380067AC */  sw         $7, 0x38($3)
.L0016DB44:
/* 6DC44 0016DB44 0800E003 */  jr         $31
/* 6DC48 0016DB48 00000000 */   nop
/* 6DC4C 0016DB4C 00000000 */  nop
