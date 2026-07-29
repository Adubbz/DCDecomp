.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandTEX_ANIME__FPPv
/* 067D80 00167C80 F0FFBD27 */  addiu       $29, $29, -0x10
/* 067D84 00167C84 0000BF7F */  sq          $31, 0x0($29)
/* 067D88 00167C88 0000828C */  lw          $2, 0x0($4)
/* 067D8C 00167C8C 0000428C */  lw          $2, 0x0($2)
/* 067D90 00167C90 988E82AF */  sw          $2, -0x7168($28)
/* 067D94 00167C94 0400828C */  lw          $2, 0x4($4)
/* 067D98 00167C98 0000428C */  lw          $2, 0x0($2)
/* 067D9C 00167C9C 07004010 */  beqz        $2, .L00167CBC
/* 067DA0 00167CA0 00000000 */   nop
/* 067DA4 00167CA4 948E848F */  lw          $4, -0x716C($28)
/* 067DA8 00167CA8 988E858F */  lw          $5, -0x7168($28)
/* 067DAC 00167CAC D09E050C */  jal         Enable__13CTextureAnimeFi
/* 067DB0 00167CB0 00000000 */   nop
/* 067DB4 00167CB4 05000010 */  b           .L00167CCC
/* 067DB8 00167CB8 00000000 */   nop
.L00167CBC:
/* 067DBC 00167CBC 948E848F */  lw          $4, -0x716C($28)
/* 067DC0 00167CC0 988E858F */  lw          $5, -0x7168($28)
/* 067DC4 00167CC4 E09E050C */  jal         Disable__13CTextureAnimeFi
/* 067DC8 00167CC8 00000000 */   nop
.L00167CCC:
/* 067DCC 00167CCC 0000BF7B */  lq          $31, 0x0($29)
/* 067DD0 00167CD0 1000BD27 */  addiu       $29, $29, 0x10
/* 067DD4 00167CD4 0800E003 */  jr          $31
/* 067DD8 00167CD8 00000000 */   nop
/* 067DDC 00167CDC 00000000 */  nop
