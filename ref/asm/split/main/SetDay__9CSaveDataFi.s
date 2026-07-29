.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetDay__9CSaveDataFi
/* 057DC0 00157CC0 D80185AC */  sw          $5, 0x1D8($4)
/* 057DC4 00157CC4 D801838C */  lw          $3, 0x1D8($4)
/* 057DC8 00157CC8 0F276128 */  slti        $1, $3, 0x270F
/* 057DCC 00157CCC 03002014 */  bnez        $1, .L00157CDC
/* 057DD0 00157CD0 00000000 */   nop
/* 057DD4 00157CD4 0E270324 */  addiu       $3, $0, 0x270E
/* 057DD8 00157CD8 D80183AC */  sw          $3, 0x1D8($4)
.L00157CDC:
/* 057DDC 00157CDC D801838C */  lw          $3, 0x1D8($4)
/* 057DE0 00157CE0 02006104 */  bgez        $3, .L00157CEC
/* 057DE4 00157CE4 00000000 */   nop
/* 057DE8 00157CE8 D80180AC */  sw          $0, 0x1D8($4)
.L00157CEC:
/* 057DEC 00157CEC 0800E003 */  jr          $31
/* 057DF0 00157CF0 00000000 */   nop
/* 057DF4 00157CF4 00000000 */  nop
/* 057DF8 00157CF8 00000000 */  nop
/* 057DFC 00157CFC 00000000 */  nop
