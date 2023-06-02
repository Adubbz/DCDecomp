.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetBuff__6ClsMesFPs
/* 4DB00 0014DA00 A01785AC */  sw         $5, 0x17A0($4)
/* 4DB04 0014DA04 A017838C */  lw         $3, 0x17A0($4)
/* 4DB08 0014DA08 A81783AC */  sw         $3, 0x17A8($4)
/* 4DB0C 0014DA0C A017838C */  lw         $3, 0x17A0($4)
/* 4DB10 0014DA10 02006594 */  lhu        $5, 0x2($3)
/* 4DB14 0014DA14 A817838C */  lw         $3, 0x17A8($4)
/* 4DB18 0014DA18 21186500 */  addu       $3, $3, $5
/* 4DB1C 0014DA1C A81783AC */  sw         $3, 0x17A8($4)
/* 4DB20 0014DA20 0800E003 */  jr         $31
/* 4DB24 0014DA24 00000000 */   nop
/* 4DB28 0014DA28 00000000 */  nop
/* 4DB2C 0014DA2C 00000000 */  nop
