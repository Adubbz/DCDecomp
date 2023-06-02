.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetAttachToPos__10CStockItemFiP11ATTACH_LIST
/* 13F8D0 0023F7D0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 13F8D4 0023F7D4 2000BF7F */  sq         $31, 0x20($sp)
/* 13F8D8 0023F7D8 1000B17F */  sq         $17, 0x10($sp)
/* 13F8DC 0023F7DC 0000B07F */  sq         $16, 0x0($sp)
/* 13F8E0 0023F7E0 288EC070 */  paddub     $17, $6, $0
/* 13F8E4 0023F7E4 40110500 */  sll        $2, $5, 5
/* 13F8E8 0023F7E8 21108200 */  addu       $2, $4, $2
/* 13F8EC 0023F7EC 001E5024 */  addiu      $16, $2, 0x1E00
/* 13F8F0 0023F7F0 3000A427 */  addiu      $4, $sp, 0x30
/* 13F8F4 0023F7F4 282E0072 */  paddub     $5, $16, $0
/* 13F8F8 0023F7F8 20000624 */  addiu      $6, $0, 0x20
/* 13F8FC 0023F7FC EC0C040C */  jal        memcpy
/* 13F900 0023F800 00000000 */   nop
/* 13F904 0023F804 28260072 */  paddub     $4, $16, $0
/* 13F908 0023F808 282E2072 */  paddub     $5, $17, $0
/* 13F90C 0023F80C 20000624 */  addiu      $6, $0, 0x20
/* 13F910 0023F810 EC0C040C */  jal        memcpy
/* 13F914 0023F814 00000000 */   nop
/* 13F918 0023F818 28262072 */  paddub     $4, $17, $0
/* 13F91C 0023F81C 3000A527 */  addiu      $5, $sp, 0x30
/* 13F920 0023F820 20000624 */  addiu      $6, $0, 0x20
/* 13F924 0023F824 EC0C040C */  jal        memcpy
/* 13F928 0023F828 00000000 */   nop
/* 13F92C 0023F82C 2000BF7B */  lq         $31, 0x20($sp)
/* 13F930 0023F830 1000B17B */  lq         $17, 0x10($sp)
/* 13F934 0023F834 0000B07B */  lq         $16, 0x0($sp)
/* 13F938 0023F838 5000BD27 */  addiu      $sp, $sp, 0x50
/* 13F93C 0023F83C 0800E003 */  jr         $31
/* 13F940 0023F840 00000000 */   nop
/* 13F944 0023F844 00000000 */  nop
/* 13F948 0023F848 00000000 */  nop
/* 13F94C 0023F84C 00000000 */  nop
