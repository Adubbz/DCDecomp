.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Disable__13CTextureAnimeFi
/* 067C80 00167B80 0400A004 */  bltz        $5, .L00167B94
/* 067C84 00167B84 00000000 */   nop
/* 067C88 00167B88 1800A328 */  slti        $3, $5, 0x18
/* 067C8C 00167B8C 03006014 */  bnez        $3, .L00167B9C
/* 067C90 00167B90 00000000 */   nop
.L00167B94:
/* 067C94 00167B94 07000010 */  b           .L00167BB4
/* 067C98 00167B98 00000000 */   nop
.L00167B9C:
/* 067C9C 00167B9C 80180500 */  sll         $3, $5, 2
/* 067CA0 00167BA0 21208300 */  addu        $4, $4, $3
/* 067CA4 00167BA4 000080AC */  sw          $0, 0x0($4)
/* 067CA8 00167BA8 6000838C */  lw          $3, 0x60($4)
/* 067CAC 00167BAC 200183AC */  sw          $3, 0x120($4)
/* 067CB0 00167BB0 800180AC */  sw          $0, 0x180($4)
.L00167BB4:
/* 067CB4 00167BB4 0800E003 */  jr          $31
/* 067CB8 00167BB8 00000000 */   nop
/* 067CBC 00167BBC 00000000 */  nop
