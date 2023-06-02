.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel serialPutchar
/* 15C90 00115B90 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 15C94 00115B94 0A000224 */  addiu      $2, $0, 0xA
/* 15C98 00115B98 07008214 */  bne        $4, $2, .L00115BB8
/* 15C9C 00115B9C 0000BFFF */   sd        $31, 0x0($sp)
/* 15CA0 00115BA0 AA56040C */  jal        kputchar
/* 15CA4 00115BA4 0D000424 */   addiu     $4, $0, 0xD
/* 15CA8 00115BA8 0000BFDF */  ld         $31, 0x0($sp)
/* 15CAC 00115BAC 0A000424 */  addiu      $4, $0, 0xA
/* 15CB0 00115BB0 AA560408 */  j          kputchar
/* 15CB4 00115BB4 1000BD27 */   addiu     $sp, $sp, 0x10
.L00115BB8:
/* 15CB8 00115BB8 0000BFDF */  ld         $31, 0x0($sp)
/* 15CBC 00115BBC AA560408 */  j          kputchar
/* 15CC0 00115BC0 1000BD27 */   addiu     $sp, $sp, 0x10
/* 15CC4 00115BC4 00000000 */  nop
