.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FrameObjectOnOff__9CMapPartsFPci
/* 9AAB0 0019A9B0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 9AAB4 0019A9B4 3000BF7F */  sq         $31, 0x30($sp)
/* 9AAB8 0019A9B8 2000B27F */  sq         $18, 0x20($sp)
/* 9AABC 0019A9BC 1000B17F */  sq         $17, 0x10($sp)
/* 9AAC0 0019A9C0 0000B07F */  sq         $16, 0x0($sp)
/* 9AAC4 0019A9C4 28968070 */  paddub     $18, $4, $0
/* 9AAC8 0019A9C8 288EA070 */  paddub     $17, $5, $0
/* 9AACC 0019A9CC 2886C070 */  paddub     $16, $6, $0
/* 9AAD0 0019A9D0 645D050C */  jal        FrameObjectOnOff__10CMapObjectFPci
/* 9AAD4 0019A9D4 00000000 */   nop
/* 9AAD8 0019A9D8 0401448E */  lw         $4, 0x104($18)
/* 9AADC 0019A9DC 07008010 */  beqz       $4, .L0019A9FC
/* 9AAE0 0019A9E0 00000000 */   nop
/* 9AAE4 0019A9E4 282E2072 */  paddub     $5, $17, $0
/* 9AAE8 0019A9E8 C0A1040C */  jal        SearchFrame__6CFrameFPc
/* 9AAEC 0019A9EC 00000000 */   nop
/* 9AAF0 0019A9F0 02004010 */  beqz       $2, .L0019A9FC
/* 9AAF4 0019A9F4 00000000 */   nop
/* 9AAF8 0019A9F8 B00050A4 */  sh         $16, 0xB0($2)
.L0019A9FC:
/* 9AAFC 0019A9FC 3000BF7B */  lq         $31, 0x30($sp)
/* 9AB00 0019AA00 2000B27B */  lq         $18, 0x20($sp)
/* 9AB04 0019AA04 1000B17B */  lq         $17, 0x10($sp)
/* 9AB08 0019AA08 0000B07B */  lq         $16, 0x0($sp)
/* 9AB0C 0019AA0C 4000BD27 */  addiu      $sp, $sp, 0x40
/* 9AB10 0019AA10 0800E003 */  jr         $31
/* 9AB14 0019AA14 00000000 */   nop
/* 9AB18 0019AA18 00000000 */  nop
/* 9AB1C 0019AA1C 00000000 */  nop
