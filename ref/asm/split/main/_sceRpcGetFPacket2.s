.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _sceRpcGetFPacket2
/* 017028 00116F28 F0FFBD27 */  addiu       $29, $29, -0x10
/* 01702C 00116F2C 0500A004 */  bltz        $5, .L00116F44
/* 017030 00116F30 0000BFFF */   sd         $31, 0x0($29)
/* 017034 00116F34 2000828C */  lw          $2, 0x20($4)
/* 017038 00116F38 2A10A200 */  slt         $2, $5, $2
/* 01703C 00116F3C 05004054 */  bnel        $2, $0, .L00116F54
/* 017040 00116F40 1C00838C */   lw         $3, 0x1C($4)
.L00116F44:
/* 017044 00116F44 BE5B040C */  jal         _sceRpcGetFPacket
/* 017048 00116F48 00000000 */   nop
/* 01704C 00116F4C 04000010 */  b           .L00116F60
/* 017050 00116F50 0000BFDF */   ld         $31, 0x0($29)
.L00116F54:
/* 017054 00116F54 80110500 */  sll         $2, $5, 6
/* 017058 00116F58 21106200 */  addu        $2, $3, $2
/* 01705C 00116F5C 0000BFDF */  ld          $31, 0x0($29)
.L00116F60:
/* 017060 00116F60 0800E003 */  jr          $31
/* 017064 00116F64 1000BD27 */   addiu      $29, $29, 0x10
