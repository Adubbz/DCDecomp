.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetPartsExtra__9CEditAreaFiii
/* 6DB70 0016DA70 0500A004 */  bltz       $5, .L0016DA88
/* 6DB74 0016DA74 00000000 */   nop
/* 6DB78 0016DA78 0800838C */  lw         $3, 0x8($4)
/* 6DB7C 0016DA7C 2A18A300 */  slt        $3, $5, $3
/* 6DB80 0016DA80 03006014 */  bnez       $3, .L0016DA90
/* 6DB84 0016DA84 00000000 */   nop
.L0016DA88:
/* 6DB88 0016DA88 12000010 */  b          .L0016DAD4
/* 6DB8C 0016DA8C 00000000 */   nop
.L0016DA90:
/* 6DB90 0016DA90 0500C004 */  bltz       $6, .L0016DAA8
/* 6DB94 0016DA94 00000000 */   nop
/* 6DB98 0016DA98 0C00838C */  lw         $3, 0xC($4)
/* 6DB9C 0016DA9C 2A18C300 */  slt        $3, $6, $3
/* 6DBA0 0016DAA0 03006014 */  bnez       $3, .L0016DAB0
/* 6DBA4 0016DAA4 00000000 */   nop
.L0016DAA8:
/* 6DBA8 0016DAA8 0A000010 */  b          .L0016DAD4
/* 6DBAC 0016DAAC 00000000 */   nop
.L0016DAB0:
/* 6DBB0 0016DAB0 C0180500 */  sll        $3, $5, 3
/* 6DBB4 0016DAB4 23186500 */  subu       $3, $3, $5
/* 6DBB8 0016DAB8 80190300 */  sll        $3, $3, 6
/* 6DBBC 0016DABC 21206400 */  addu       $4, $3, $4
/* 6DBC0 0016DAC0 C0180600 */  sll        $3, $6, 3
/* 6DBC4 0016DAC4 23186600 */  subu       $3, $3, $6
/* 6DBC8 0016DAC8 80180300 */  sll        $3, $3, 2
/* 6DBCC 0016DACC 21186400 */  addu       $3, $3, $4
/* 6DBD0 0016DAD0 3C0067AC */  sw         $7, 0x3C($3)
.L0016DAD4:
/* 6DBD4 0016DAD4 0800E003 */  jr         $31
/* 6DBD8 0016DAD8 00000000 */   nop
/* 6DBDC 0016DADC 00000000 */  nop
