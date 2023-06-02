.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Initialize__9CMapPartsFv
/* 9A9C0 0019A8C0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 9A9C4 0019A8C4 1000BF7F */  sq         $31, 0x10($sp)
/* 9A9C8 0019A8C8 0000B07F */  sq         $16, 0x0($sp)
/* 9A9CC 0019A8CC 28868070 */  paddub     $16, $4, $0
/* 9A9D0 0019A8D0 445E050C */  jal        Initialize__10CMapObjectFv
/* 9A9D4 0019A8D4 00000000 */   nop
/* 9A9D8 0019A8D8 080100AE */  sw         $0, 0x108($16)
/* 9A9DC 0019A8DC FC0000AE */  sw         $0, 0xFC($16)
/* 9A9E0 0019A8E0 000100AE */  sw         $0, 0x100($16)
/* 9A9E4 0019A8E4 040100AE */  sw         $0, 0x104($16)
/* 9A9E8 0019A8E8 D40100AE */  sw         $0, 0x1D4($16)
/* 9A9EC 0019A8EC D00100AE */  sw         $0, 0x1D0($16)
/* 9A9F0 0019A8F0 F80000AE */  sw         $0, 0xF8($16)
/* 9A9F4 0019A8F4 140100AE */  sw         $0, 0x114($16)
/* 9A9F8 0019A8F8 180100AE */  sw         $0, 0x118($16)
/* 9A9FC 0019A8FC FFFF0324 */  addiu      $3, $0, -0x1
/* 9AA00 0019A900 F40003AE */  sw         $3, 0xF4($16)
/* 9AA04 0019A904 F00003AE */  sw         $3, 0xF0($16)
/* 9AA08 0019A908 1C0100AE */  sw         $0, 0x11C($16)
/* 9AA0C 0019A90C 80BF033C */  lui        $3, (0xBF800000 >> 16)
/* 9AA10 0019A910 200103AE */  sw         $3, 0x120($16)
/* 9AA14 0019A914 28260070 */  paddub     $4, $0, $0
/* 9AA18 0019A918 06000010 */  b          .L0019A934
/* 9AA1C 0019A91C 00000000 */   nop
.L0019A920:
/* 9AA20 0019A920 80180400 */  sll        $3, $4, 2
/* 9AA24 0019A924 21187000 */  addu       $3, $3, $16
/* 9AA28 0019A928 D80160AC */  sw         $0, 0x1D8($3)
/* 9AA2C 0019A92C 380260AC */  sw         $0, 0x238($3)
/* 9AA30 0019A930 01008424 */  addiu      $4, $4, 0x1
.L0019A934:
/* 9AA34 0019A934 18008328 */  slti       $3, $4, 0x18
/* 9AA38 0019A938 F9FF6014 */  bnez       $3, .L0019A920
/* 9AA3C 0019A93C 00000000 */   nop
/* 9AA40 0019A940 0C0100AE */  sw         $0, 0x10C($16)
/* 9AA44 0019A944 100100AE */  sw         $0, 0x110($16)
/* 9AA48 0019A948 1000BF7B */  lq         $31, 0x10($sp)
/* 9AA4C 0019A94C 0000B07B */  lq         $16, 0x0($sp)
/* 9AA50 0019A950 2000BD27 */  addiu      $sp, $sp, 0x20
/* 9AA54 0019A954 0800E003 */  jr         $31
/* 9AA58 0019A958 00000000 */   nop
/* 9AA5C 0019A95C 00000000 */  nop
