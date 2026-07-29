.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetPartsID__9CEditAreaFiii
/* 06DB00 0016DA00 0500A004 */  bltz        $5, .L0016DA18
/* 06DB04 0016DA04 00000000 */   nop
/* 06DB08 0016DA08 0800838C */  lw          $3, 0x8($4)
/* 06DB0C 0016DA0C 2A18A300 */  slt         $3, $5, $3
/* 06DB10 0016DA10 03006014 */  bnez        $3, .L0016DA20
/* 06DB14 0016DA14 00000000 */   nop
.L0016DA18:
/* 06DB18 0016DA18 12000010 */  b           .L0016DA64
/* 06DB1C 0016DA1C 00000000 */   nop
.L0016DA20:
/* 06DB20 0016DA20 0500C004 */  bltz        $6, .L0016DA38
/* 06DB24 0016DA24 00000000 */   nop
/* 06DB28 0016DA28 0C00838C */  lw          $3, 0xC($4)
/* 06DB2C 0016DA2C 2A18C300 */  slt         $3, $6, $3
/* 06DB30 0016DA30 03006014 */  bnez        $3, .L0016DA40
/* 06DB34 0016DA34 00000000 */   nop
.L0016DA38:
/* 06DB38 0016DA38 0A000010 */  b           .L0016DA64
/* 06DB3C 0016DA3C 00000000 */   nop
.L0016DA40:
/* 06DB40 0016DA40 C0180500 */  sll         $3, $5, 3
/* 06DB44 0016DA44 23186500 */  subu        $3, $3, $5
/* 06DB48 0016DA48 80190300 */  sll         $3, $3, 6
/* 06DB4C 0016DA4C 21206400 */  addu        $4, $3, $4
/* 06DB50 0016DA50 C0180600 */  sll         $3, $6, 3
/* 06DB54 0016DA54 23186600 */  subu        $3, $3, $6
/* 06DB58 0016DA58 80180300 */  sll         $3, $3, 2
/* 06DB5C 0016DA5C 21186400 */  addu        $3, $3, $4
/* 06DB60 0016DA60 340067AC */  sw          $7, 0x34($3)
.L0016DA64:
/* 06DB64 0016DA64 0800E003 */  jr          $31
/* 06DB68 0016DA68 00000000 */   nop
/* 06DB6C 0016DA6C 00000000 */  nop
