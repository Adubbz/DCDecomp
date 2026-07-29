.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _STATUS_SET_FALL__FP12RS_STACKDATAi
/* 0E2C70 001E2B70 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0E2C74 001E2B74 1000BF7F */  sq          $31, 0x10($29)
/* 0E2C78 001E2B78 0000B07F */  sq          $16, 0x0($29)
/* 0E2C7C 001E2B7C E09C828F */  lw          $2, -0x6320($28)
/* 0E2C80 001E2B80 9000508C */  lw          $16, 0x90($2)
/* 0E2C84 001E2B84 9085070C */  jal         GetStackInt__FP12RS_STACKDATA__3
/* 0E2C88 001E2B88 00000000 */   nop
/* 0E2C8C 001E2B8C E09C858F */  lw          $5, -0x6320($28)
/* 0E2C90 001E2B90 80181000 */  sll         $3, $16, 2
/* 0E2C94 001E2B94 21207000 */  addu        $4, $3, $16
/* 0E2C98 001E2B98 80180400 */  sll         $3, $4, 2
/* 0E2C9C 001E2B9C 21188300 */  addu        $3, $4, $3
/* 0E2CA0 001E2BA0 00190300 */  sll         $3, $3, 4
/* 0E2CA4 001E2BA4 21186500 */  addu        $3, $3, $5
/* 0E2CA8 001E2BA8 0200013C */  lui         $1, (0x20000 >> 16)
/* 0E2CAC 001E2BAC 21086100 */  addu        $1, $3, $1
/* 0E2CB0 001E2BB0 58E422AC */  sw          $2, -0x1BA8($1)
/* 0E2CB4 001E2BB4 01000224 */  addiu       $2, $0, 0x1
/* 0E2CB8 001E2BB8 1000BF7B */  lq          $31, 0x10($29)
/* 0E2CBC 001E2BBC 0000B07B */  lq          $16, 0x0($29)
/* 0E2CC0 001E2BC0 2000BD27 */  addiu       $29, $29, 0x20
/* 0E2CC4 001E2BC4 0800E003 */  jr          $31
/* 0E2CC8 001E2BC8 00000000 */   nop
/* 0E2CCC 001E2BCC 00000000 */  nop
