.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _sceRpcGetFPacket2
/* 17028 00116F28 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 1702C 00116F2C 0500A004 */  bltz       $5, .L00116F44
/* 17030 00116F30 0000BFFF */   sd        $31, 0x0($sp)
/* 17034 00116F34 2000828C */  lw         $2, 0x20($4)
/* 17038 00116F38 2A10A200 */  slt        $2, $5, $2
/* 1703C 00116F3C 05004054 */  bnel       $2, $0, .L00116F54
/* 17040 00116F40 1C00838C */   lw        $3, 0x1C($4)
.L00116F44:
/* 17044 00116F44 BE5B040C */  jal        _sceRpcGetFPacket
/* 17048 00116F48 00000000 */   nop
/* 1704C 00116F4C 04000010 */  b          .L00116F60
/* 17050 00116F50 0000BFDF */   ld        $31, 0x0($sp)
.L00116F54:
/* 17054 00116F54 80110500 */  sll        $2, $5, 6
/* 17058 00116F58 21106200 */  addu       $2, $3, $2
/* 1705C 00116F5C 0000BFDF */  ld         $31, 0x0($sp)
.L00116F60:
/* 17060 00116F60 0800E003 */  jr         $31
/* 17064 00116F64 1000BD27 */   addiu     $sp, $sp, 0x10
