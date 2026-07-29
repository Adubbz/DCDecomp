.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetCode__9CEditAreaFiii
/* 06DBE0 0016DAE0 0500A004 */  bltz        $5, .L0016DAF8
/* 06DBE4 0016DAE4 00000000 */   nop
/* 06DBE8 0016DAE8 0800838C */  lw          $3, 0x8($4)
/* 06DBEC 0016DAEC 2A18A300 */  slt         $3, $5, $3
/* 06DBF0 0016DAF0 03006014 */  bnez        $3, .L0016DB00
/* 06DBF4 0016DAF4 00000000 */   nop
.L0016DAF8:
/* 06DBF8 0016DAF8 12000010 */  b           .L0016DB44
/* 06DBFC 0016DAFC 00000000 */   nop
.L0016DB00:
/* 06DC00 0016DB00 0500C004 */  bltz        $6, .L0016DB18
/* 06DC04 0016DB04 00000000 */   nop
/* 06DC08 0016DB08 0C00838C */  lw          $3, 0xC($4)
/* 06DC0C 0016DB0C 2A18C300 */  slt         $3, $6, $3
/* 06DC10 0016DB10 03006014 */  bnez        $3, .L0016DB20
/* 06DC14 0016DB14 00000000 */   nop
.L0016DB18:
/* 06DC18 0016DB18 0A000010 */  b           .L0016DB44
/* 06DC1C 0016DB1C 00000000 */   nop
.L0016DB20:
/* 06DC20 0016DB20 C0180500 */  sll         $3, $5, 3
/* 06DC24 0016DB24 23186500 */  subu        $3, $3, $5
/* 06DC28 0016DB28 80190300 */  sll         $3, $3, 6
/* 06DC2C 0016DB2C 21206400 */  addu        $4, $3, $4
/* 06DC30 0016DB30 C0180600 */  sll         $3, $6, 3
/* 06DC34 0016DB34 23186600 */  subu        $3, $3, $6
/* 06DC38 0016DB38 80180300 */  sll         $3, $3, 2
/* 06DC3C 0016DB3C 21186400 */  addu        $3, $3, $4
/* 06DC40 0016DB40 380067AC */  sw          $7, 0x38($3)
.L0016DB44:
/* 06DC44 0016DB44 0800E003 */  jr          $31
/* 06DC48 0016DB48 00000000 */   nop
/* 06DC4C 0016DB4C 00000000 */  nop
