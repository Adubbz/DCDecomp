.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel SetAlarm
/* 15040 00114F40 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 15044 00114F44 FFFF8430 */  andi       $4, $4, 0xFFFF
/* 15048 00114F48 1000BFFF */  sd         $31, 0x10($sp)
/* 1504C 00114F4C 0000B0FF */  sd         $16, 0x0($sp)
/* 15050 00114F50 00601040 */  mfc0       $16, $12 # handwritten instruction
/* 15054 00114F54 0100023C */  lui        $2, (0x10000 >> 16)
/* 15058 00114F58 24800202 */  and        $16, $16, $2
/* 1505C 00114F5C 09000012 */  beqz       $16, .L00114F84
/* 15060 00114F60 0100033C */   lui       $3, (0x10000 >> 16)
/* 15064 00114F64 00000000 */  nop
.L00114F68:
/* 15068 00114F68 39000042 */  di # handwritten instruction
/* 1506C 00114F6C 0F040000 */  sync.p
/* 15070 00114F70 00600240 */  mfc0       $2, $12 # handwritten instruction
/* 15074 00114F74 24104300 */  and        $2, $2, $3
/* 15078 00114F78 00000000 */  nop
/* 1507C 00114F7C FAFF4014 */  bnez       $2, .L00114F68
/* 15080 00114F80 00000000 */   nop
.L00114F84:
/* 15084 00114F84 2850040C */  jal        _SetAlarm
/* 15088 00114F88 00000000 */   nop
/* 1508C 00114F8C 0F000000 */  sync
/* 15090 00114F90 03000012 */  beqz       $16, .L00114FA0
/* 15094 00114F94 1000BFDF */   ld        $31, 0x10($sp)
/* 15098 00114F98 38000042 */  ei # handwritten instruction
/* 1509C 00114F9C 1000BFDF */  ld         $31, 0x10($sp)
.L00114FA0:
/* 150A0 00114FA0 0000B0DF */  ld         $16, 0x0($sp)
/* 150A4 00114FA4 0800E003 */  jr         $31
/* 150A8 00114FA8 2000BD27 */   addiu     $sp, $sp, 0x20
/* 150AC 00114FAC 00000000 */  nop
