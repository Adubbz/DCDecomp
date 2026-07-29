.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceVif1PkCloseDirectCode
/* 020F90 00120E90 0000828C */  lw          $2, 0x0($4)
/* 020F94 00120E94 0C00858C */  lw          $5, 0xC($4)
/* 020F98 00120E98 FCFF4224 */  addiu       $2, $2, -0x4
/* 020F9C 00120E9C 0C0080AC */  sw          $0, 0xC($4)
/* 020FA0 00120EA0 23104500 */  subu        $2, $2, $5
/* 020FA4 00120EA4 0000A38C */  lw          $3, 0x0($5)
/* 020FA8 00120EA8 83100200 */  sra         $2, $2, 2
/* 020FAC 00120EAC 82100200 */  srl         $2, $2, 2
/* 020FB0 00120EB0 21186200 */  addu        $3, $3, $2
/* 020FB4 00120EB4 0800E003 */  jr          $31
/* 020FB8 00120EB8 0000A3AC */   sw         $3, 0x0($5)
/* 020FBC 00120EBC 00000000 */  nop
