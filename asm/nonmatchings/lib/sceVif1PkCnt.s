.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceVif1PkCnt
/* 20D80 00120C80 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 20D84 00120C84 1000B1FF */  sd         $17, 0x10($sp)
/* 20D88 00120C88 2D888000 */  daddu      $17, $4, $0
/* 20D8C 00120C8C 0000B0FF */  sd         $16, 0x0($sp)
/* 20D90 00120C90 2000BFFF */  sd         $31, 0x20($sp)
/* 20D94 00120C94 0A83040C */  jal        sceVif1PkTerminate
/* 20D98 00120C98 2D80A000 */   daddu     $16, $5, $0
/* 20D9C 00120C9C 0000248E */  lw         $4, 0x0($17)
/* 20DA0 00120CA0 0010033C */  lui        $3, (0x10000000 >> 16)
/* 20DA4 00120CA4 25800302 */  or         $16, $16, $3
/* 20DA8 00120CA8 080022AE */  sw         $2, 0x8($17)
/* 20DAC 00120CAC 000090AC */  sw         $16, 0x0($4)
/* 20DB0 00120CB0 04008424 */  addiu      $4, $4, 0x4
/* 20DB4 00120CB4 0C0020AE */  sw         $0, 0xC($17)
/* 20DB8 00120CB8 04008224 */  addiu      $2, $4, 0x4
/* 20DBC 00120CBC 2000BFDF */  ld         $31, 0x20($sp)
/* 20DC0 00120CC0 000022AE */  sw         $2, 0x0($17)
/* 20DC4 00120CC4 1000B1DF */  ld         $17, 0x10($sp)
/* 20DC8 00120CC8 0000B0DF */  ld         $16, 0x0($sp)
/* 20DCC 00120CCC 000080AC */  sw         $0, 0x0($4)
/* 20DD0 00120CD0 0800E003 */  jr         $31
/* 20DD4 00120CD4 3000BD27 */   addiu     $sp, $sp, 0x30
