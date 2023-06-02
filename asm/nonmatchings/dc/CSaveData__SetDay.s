.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetDay__9CSaveDataFi
/* 57DC0 00157CC0 D80185AC */  sw         $5, 0x1D8($4)
/* 57DC4 00157CC4 D801838C */  lw         $3, 0x1D8($4)
/* 57DC8 00157CC8 0F276128 */  slti       $at, $3, 0x270F
/* 57DCC 00157CCC 03002014 */  bnez       $at, .L00157CDC
/* 57DD0 00157CD0 00000000 */   nop
/* 57DD4 00157CD4 0E270324 */  addiu      $3, $0, 0x270E
/* 57DD8 00157CD8 D80183AC */  sw         $3, 0x1D8($4)
.L00157CDC:
/* 57DDC 00157CDC D801838C */  lw         $3, 0x1D8($4)
/* 57DE0 00157CE0 02006104 */  bgez       $3, .L00157CEC
/* 57DE4 00157CE4 00000000 */   nop
/* 57DE8 00157CE8 D80180AC */  sw         $0, 0x1D8($4)
.L00157CEC:
/* 57DEC 00157CEC 0800E003 */  jr         $31
/* 57DF0 00157CF0 00000000 */   nop
/* 57DF4 00157CF4 00000000 */  nop
/* 57DF8 00157CF8 00000000 */  nop
/* 57DFC 00157CFC 00000000 */  nop
