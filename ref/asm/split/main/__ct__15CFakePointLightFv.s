.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __ct__15CFakePointLightFv
/* 056C60 00156B60 0043023C */  lui         $2, (0x43000000 >> 16)
/* 056C64 00156B64 1C0082AC */  sw          $2, 0x1C($4)
/* 056C68 00156B68 180082AC */  sw          $2, 0x18($4)
/* 056C6C 00156B6C 140082AC */  sw          $2, 0x14($4)
/* 056C70 00156B70 100082AC */  sw          $2, 0x10($4)
/* 056C74 00156B74 2041023C */  lui         $2, (0x41200000 >> 16)
/* 056C78 00156B78 200082AC */  sw          $2, 0x20($4)
/* 056C7C 00156B7C 8C42023C */  lui         $2, (0x428C0000 >> 16)
/* 056C80 00156B80 240082AC */  sw          $2, 0x24($4)
/* 056C84 00156B84 280080AC */  sw          $0, 0x28($4)
/* 056C88 00156B88 28168070 */  paddub      $2, $4, $0
/* 056C8C 00156B8C 0800E003 */  jr          $31
/* 056C90 00156B90 00000000 */   nop
/* 056C94 00156B94 00000000 */  nop
/* 056C98 00156B98 00000000 */  nop
/* 056C9C 00156B9C 00000000 */  nop
